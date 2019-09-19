<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/12.0.0/classic/ckeditor.js"></script>

<style>
.mb-style1 .table-write {
    border-top: 1px solid #dbdbdb !important;
}
.mb-board div table {
    width: 100%;
    table-layout: fixed;
    word-break: break-all;
    font-size: 13px;
    line-height: 1.6em;
    border-collapse: collapse;
    border: none;
    background: none;
    margin: 0;
    padding: 0;
}

</style>
</head>
<body>


	<!-- ############### 헤더 부분 ############### -->
	<c:import url="../header/header.jsp"/>

	<!-- 첫번쨰 <div class="ht-body-wrapper ht-layout ht-wrapper">
		<div class="container">
			<div class="ht-body-main ht-body-sidebar-">
				<div class="ht-content-wrap">
					<div class="ht-content responsive-list col-sm-12">

						<article id="post-93" class="post-93 page type-page status-publish hentry">

							<p>도시락 자랑 게시판입니다.</p>
							<p>&nbsp;</p>
							<div class="clear"></div>
							<div class="mb-mobile">
								<div id="contact_board" class="mb-board">
									<div class="mb-level-0 mb-name-contact mb-mode-write mb-skin-bbs-basic">
										<form name="">

											<div class="mb-style1">
												<div class="main-style1" id="contact_board_box">
													<div>
														<div class="pull-right"></div>
														<div class="clear"></div>
													</div>

													<table class="table table-write">
														<caption>글쓰기</caption>
														<colgroup>
															<col style="width: 20%">
															<col>
														</colgroup>
														<tbody>
															<tr id="mb_contact_tr_user_name">
																<th scope="row"><label for="mb_contact_i_user_name">이름(*)</label></th>
																<td><input class="user_name" style="width: 150px;"
																	name="user_name" id="mb_contact_i_user_name" title="이름"
																	value="" type="text" maxlength="20"></td>
															</tr>
															<tr id="mb_contact_tr_email">
																<th scope="row"><label for="mb_contact_i_email">이메일(*)</label></th>
																<td><input style="width: 200px;" name="email"
																	id="mb_contact_i_email" title="이메일" value=""
																	type="text" maxlength="50"></td>
															</tr>
															<tr id="mb_contact_tr_title">
																<th scope="row"><label for="mb_contact_i_title">제목(*)</label></th>
																<td><input class="text-left" style="width: 99%;"
																	name="title" id="mb_contact_i_title" title="제목"
																	value="" type="text"></td>
															</tr>
															<tr id="mb_contact_tr_content">
																<td class="content-box" colspan="2">
																<input name="data_type" id="data_type" style="width: 1080px; height: 500px;">
																<textarea class="content" style="width: 1080px; height: 50px; visibility: hidden;" name="content" id="se_content" title="내용"></textarea>
																	</td>
															</tr>
															<tr id="mb_contact_tr_file1">
																<th scope="row"><label for="mb_contact_i_file1">첨부파일</label></th>
																<td><input class="file" style="width: 300px;"
																	name="file1" id="mb_contact_i_file1" title="첨부파일"
																	value="" type="file"></td>
															</tr>
														</tbody>
													</table>
												</div>
												<div class="write-btn">
													<div class="btn-box-right" id="contact_btn_box">
														<div class="btn-box-left" style="float: left;"></div>
														<button onclick="checkWriteData();return false;" title="확인" class="btn btn-default btn-send-write" type="button">
															<span>확인</span>
														</button>
													</div>
												</div>
											</div>

										</form>


										<script type="text/javascript">
											if (category_text != ""
													&& isJsonType(category_text))
												category_select(0);
										</script>
									</div>
								</div>
							</div>
						</article>


					</div>
					<br><br>
				</div>
				end ht-content-wrap

			</div>
		</div>
		end container
	</div> -->
	
 	<div class="container">
    <div class="content" style="width: 100%">
    
        <div class="row justify-content-md-center">
            <div class="col-sm-9">
            <div class="input-group mb-3">
                <div class="input-group-prepend">
                    <label class="input-group-text">제목</label>
                  </div>            
                  <input type="text" class="form-control">              
                </div>
            </div>
            <div class="col-sm-3">
                <div class="input-group mb-3">
                    <select class="custom-select" id="inputGroupSelect03">
                    <option selected>분류</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                  </select>  
                </div>
            </div>            
      </div>
      
      <hr>
      
      <div class="row justify-content-md-center" style="">
          <div class="col_c" style="margin-bottom: 30px;">
                <div class="input-group">                 
                  <textarea class="form-control" id="p_content"></textarea>
                  <script type="text/javascript"  src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js">
                  CKEDITOR.replace('p_content', {
                	  width: '700px', height: '700px', startupFocus: false
                	  });
                  </script>
                </div>
            </div> 
      </div>
      
      <div class="row justify-content-md-center">
            <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">썸네일</span>
              </div>
              <div class="custom-file">
                  &nbsp;<input type="file" class="form-control-file" id="exampleFormControlFile1">
              </div>
            </div>
      </div>
      
      <div class="row justify-content-md-center">
        <button type="submit" class="btn btn-outline-secondary" style="width: 20%; font-weight: bold">
             등   록          
            </button>
        </div>
  </div>
</div>
<div style="margin-bottom: 50px;"></div>

	<!-- ##################### 풋터 부분 ##################### -->
	<c:import url="../footer/footer.jsp"/>

</body>
</html>