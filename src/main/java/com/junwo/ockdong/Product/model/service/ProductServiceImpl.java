package com.junwo.ockdong.Product.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.junwo.ockdong.Product.model.dao.ProductDAO;
import com.junwo.ockdong.Product.model.vo.Product;
import com.junwo.ockdong.common.PageInfo;

@Service("pService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductDAO pDAO;
	 
	@Override
	public int getListCount() {
		
		return pDAO.getListCount();
	}

	@Override
	public ArrayList<Product> selectList(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertProduct(Product p, ArrayList<MultipartFile> list) {
		return pDAO.insertProduct(p,list);
	}
	

}
