package com.junwo.ockdong.product.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.junwo.ockdong.product.Exception.ProductException;
import com.junwo.ockdong.product.model.service.ProductService;
import com.junwo.ockdong.product.model.vo.PictureList;
import com.junwo.ockdong.product.model.vo.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService pService;
	
	// 상품 관리 관리자 상품 등록하기
		@RequestMapping("insertProduct.do")
		public String insertProduct(@ModelAttribute Product p,
										  @RequestParam(value="thumbnailImg1" , required=true) MultipartFile thumbnailImg1 ,
										  @RequestParam(value="thumbnailImg2" , required=false) MultipartFile thumbnailImg2 ,
										  @RequestParam(value="thumbnailImg3" , required=false) MultipartFile thumbnailImg3 ,
										  @RequestParam(value="thumbnailImg4" , required=false) MultipartFile thumbnailImg4 ,
										  @RequestParam("p_lunchtype") String p_lunchtype,
										 
										  HttpServletRequest request) throws ProductException {
			
	
			// 값 확인을 위해서 가지고 온다. 등록된 값 확인 한다.
			System.out.println(p);
			System.out.println(thumbnailImg1);
			System.out.println(thumbnailImg2);
			System.out.println(thumbnailImg3);
			System.out.println(thumbnailImg4);
			
			System.out.println(thumbnailImg1.getOriginalFilename()); // 원래 이름 저장한다.
			System.out.println(thumbnailImg2.getOriginalFilename());
			System.out.println(thumbnailImg3.getOriginalFilename());
			System.out.println(thumbnailImg4.getOriginalFilename());
			
			// 사진을 list 에 담아서 처리 한다.
			ArrayList<MultipartFile> list = new ArrayList<MultipartFile>();
			
			list.add(thumbnailImg1);
			list.add(thumbnailImg2);
			list.add(thumbnailImg3);
			list.add(thumbnailImg4);
			
			PictureList pt = new PictureList(); // 사진 객체 
			
			ArrayList<String> renameList  =	saveproduct(list, request); // 리스트에 잇는 사진 이름 변경후 받아온다.
			
			ArrayList<PictureList> pList = new ArrayList<PictureList>(); // 메인 사진 담을 리스트
			
			
			// 출력 결과 이름이 중복으로 됨........ 사진 결과 중복 됨
			for(int i = 0; i < renameList.size(); i++) {
				System.out.println("변경된 이름? 출력 한다.  : " + renameList);
			}
		 
			// 이거 주석 하니간  위 원래 이름 은 정상으로 나옴
//			if(renameList != null) {
//				for (int i = 0; i <renameList.size(); i++) {
//					pt.setPt_realName(list.get(i).getOriginalFilename());
//					pt.setPt_naem(renameList.get(i));
//					
//					if(i == 0) {
//						pt.setPt_type(0);
//					}else {
//						pt.setPt_type(1);
//					}
//					pList.add(pt);
//				}
//			}
			
			// 출력 결과 이름이 중복으로 됨........ 사진 결과 중복 됨
						for(int i = 0; i < renameList.size(); i++) {
							System.out.println("변경된 이름? 출력 한다.  : " + renameList);
						}
			

			HashMap<String, Object> map = new HashMap<>(); // 해쉬맵으로 전달한다.
			
			
			map.put("p", p);
			map.put("list", list);
			
			
			
			//  사진 불러오기
			int result = pService.insertProduct(map);
			
		/*
		 * if(result > 0) {
		 * 
		 * mv.addObject("admin/products/productList"); }else {
		 * mv.addObject("view/common/errorPage"); }
		 */
				
			return "admin/products/productList";

			
		}
		
			// 사진 원래 사진 이름 변경하는 메소드
		  public ArrayList<String> saveproduct(ArrayList<MultipartFile> list, HttpServletRequest request) {

			  ArrayList<String> renamePaths = new ArrayList<String>();
			  
			  String root = request.getSession().getServletContext().getRealPath("resources"); // 경로를 찾다.
			  String savePath = root + "\\img\\products"; // 경로에 이름으로 저장한다.
			  
			  // 파일 없으면 파일 만들고
			  File folder = new File(savePath);
			  if(!folder.exists()) {
				  folder.mkdir();
			  }
			  
			  // 여기서 한번에 중복된 이름으로 돌리는거 같음....
			  for(int i = 0; i < list.size(); i++) {
				  MultipartFile file = list.get(i);
				  
				  
				  // 날짜 변경
				  SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				  
				  String originalFileName = file.getOriginalFilename();
				  
				  String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + '.' +
						  							originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				  
				  String renamePath = folder + "\\" + renameFileName; // 경로에 변경된 이름 저장한다.
				  // 넘어온 파일을 리스트로 저장
				  renamePaths.add(renamePath);
				  
				  System.out.println("이름 변경 된거 : " + renamePaths.get(i));
				  try {
					  file.transferTo(new File(renamePath));
						
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
					
			  }
			  
			  return renamePaths;
			  
		  }
//=====================================================================================================
		// 리스트 검색
		  @RequestMapping("searchProduct.do")
		  @ResponseBody
		  public void searchProduct(HttpServletResponse response, String sContent, String type) throws JsonIOException, IOException {
			  
			  Map<String,String> search = new HashMap<String,String>();
			  search.put("sContent", sContent); // 내용 즉 입력값
			  search.put("type",type); // 타입 내용 인지 번호 인지
			  
			  System.out.println(sContent);
			  System.out.println(type);
			  
			  ArrayList<Product> pList = pService.searchList(search);
			  
			  if(pList != null) {
				  for(Product i : pList) {
					  i.setP_name(URLEncoder.encode(i.getP_name(), "utf-8")); // 상품명
					  i.setP_content(URLEncoder.encode(i.getP_content(), "utf-8")); // 상품설명
					  i.setP_lunchtype(URLEncoder.encode(i.getP_lunchtype(), "utf-8")); // 타입
					  
				  }
			  }
			  Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			  gson.toJson(pList, response.getWriter());
			  
		  }
	
		  // 상품 삭제
		  @RequestMapping("deletedProduct.do")
		 
		  public String deletedProduct(int p_Id) {
			  System.out.println("p_Id : "  + p_Id );
			  
			  int result = pService.deleteProduct(p_Id);
			  
			  if(result > 0) {
				  System.out.println("삭제 완료");
				  return "redirect:productList.do";
			  }
			return "redirect:productList.do";
		  }
	
}
