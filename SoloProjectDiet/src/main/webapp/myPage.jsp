<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script src="js/Common.js"></script>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>MyPage</title>
  <!-- base:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="vendors/select2/select2.min.css">
  <link rel="stylesheet" href="vendors/select2-bootstrap-theme/select2-bootstrap.min.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
  <style type="text/css">
  .displNone{
  	display:none;
  }
  .hiddenBtn{
  visibility: hidden;
  }
  </style>
</head>

<body>
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <c:if test="${uVO==null}">
    	<mytag:noneClientTopMenu/>
    </c:if>
    
    <c:if test="${uVO!=null}">
    	<mytag:clientTopMenu/>
    </c:if>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <c:if test="${uVO==null}">
        <mytag:nonClientMenu />
        </c:if>
            <c:if test="${uVO!=null}">
             <mytag:clientMenu />
            </c:if>
      <!-- partial -->
      <div class="main-panel">        
        <div class="content-wrapper">
          <div class="row">
        
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">계정정보</h4>
                  <p class="card-description">
                    회원정보 : ID , PW , Name<br>
          최신 바디정보 : Height , Weight          
                  </p>
                  <div class="user-profile">
          <div class="user-image" style="text-align:center;">
            <img src="${uVO.path}" alt="${uVO.name}님의 프로필(워너비?)사진" width="250px" height="250px">
            <!-- <p>${uVO.path}</p> -->
            <br>
            <br>
            <button type="button" class="btn btn-outline-secondary btn-icon-text" onclick="ChangeProfile()">
                          사진변경
                          <i class="icon-image btn-icon-append"></i>                          
                        </button>
          </div>
          
         
          <br>
          <br>
        </div>
                  <form class="forms-sample" action="deleteUser.do" method="post" id="userInfoForm">
                    <div class="form-group">
                      <label for="exampleInputName1">ID</label>
                      <input type="text" class="form-control" id="exampleInputName1" value="${uVO.id}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputName1">Name</label>
                      <input type="text" class="form-control" id="exampleInputName1" value="${uVO.name}" readonly>
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputName1">Gender</label>
                        <input type="text" class="form-control" id="exampleInputName1" value="${uVO.gender}" readonly>
                      </div>
                    <button type="button" class="btn btn-danger mr-2" id="updateUserInfoBtn" onclick="updateBtn('userInfoForm','updateUserInfoForm')">회원정보 변경</button>                               
                    <button type="button" class="btn btn-light" onclick="checkAlert('deleteUser.do?id=${uVO.id}','회원탈퇴 하시겠습니까?')">회원탈퇴</button>
                  </form>
                  
                  
                  
                  
                  <!-- 회원정보 변경 폼 -->
                  <form class="forms-sample displNone" action="updateUser.do" method="post" id="updateUserInfoForm">
                    <input type="hidden" class="form-control" id="exampleInputName1" name="id" value="${uVO.id}" >
                    <input type="hidden" class="form-control" id="exampleInputName1" name="pw" value="${uVO.pw}" >
                    
                    <div class="form-group">
                      <label for="exampleInputName1">Name</label>
                      <input type="text" class="form-control" name="name" id="exampleInputName1" value="${uVO.name}" required>
                    </div>
                    
                    <div class="form-group">
                      <label for="exampleInputName1">Gender</label>
                        <select class="form-control" name="gender">
                      	<option ${uVO.gender=='man' ? 'selected':'' }>man</option>
                      	<option ${uVO.gender=='woman' ? 'selected':'' }>woman</option>
                      </select>
                      </div>
					       	
                    <button type="submit" class="btn btn-danger mr-2">변경하기</button>
                    <button type="button" class="btn btn-light" id="updateUserInfoCancleBtn" onclick="updateCancleBtn('userInfoForm','updateUserInfoForm')">수정취소</button>                                                         
                  </form>
                  
                  
                  
                  <br><br>
                  
                  <!-- 최신 바디정보 폼 -->
                  <form class="forms-sample" action="deleteUser.do" method="post" id="bodyForm">
                  <input type="hidden" name="bnum" value="${lastBodyVO.bnum}">                   
                    <div class="form-group">
                      <label for="exampleInputName1">측정날짜</label>
                      <input type="text" class="form-control" id="exampleInputName1" value="${lastBodyVO.bdate}" readonly>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputName1">height</label>
                      <input type="text" class="form-control" id="exampleInputName1" value="${lastBodyVO.height} cm" readonly>
                    </div><div class="form-group">
                      <label for="exampleInputName1">weight</label>
                      <input type="text" class="form-control" id="exampleInputName1" value="${lastBodyVO.weight} kg" readonly>
                    </div>            
                    <button type="button" class="btn btn-success mr-2" onclick="updateBtn('bodyForm','updateBodyForm')">최신 바디정보 변경</button>
                    <button type="button" class="btn btn-light" onclick="checkAlert('deleteRecentBody.do?bnum=${lastBodyVO.bnum}','최신 바디정보를 삭제하시겠어요?')">최신 바디정보 삭제</button>                                       
                  </form>
                  
                  <!-- 최신 바디정보 변경폼 -->
                  <form class="forms-sample displNone" action="updateRecentBody.do" method="post" id="updateBodyForm">
                  <input type="hidden" name="bnum" value="${lastBodyVO.bnum}">
                  
                  <div class="form-group">
                      <label for="exampleInputName1">등록날짜</label>
                      <input type="date" class="form-control" id="exampleInputName1" value="${lastBodyVO.bdate}" readonly>
                    </div>                   
                    <div class="form-group">
                      <label for="exampleInputName1">height</label>
                      <input type="number" class="form-control" id="exampleInputName1" name="height" value="${lastBodyVO.height}" required>
                    </div><div class="form-group">
                      <label for="exampleInputName1">weight</label>
                      <input type="number" class="form-control" id="exampleInputName1" name="weight" value="${lastBodyVO.weight}" required>
                    </div>            
                    <button  class="btn btn-success mr-2">최신 바디정보 변경</button>
                    <button type="button" class="btn btn-light" onclick="updateCancleBtn('bodyForm','updateBodyForm')">수정취소</button>                                       
                  </form>
                </div>
              </div>
            </div>
            
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        <footer class="footer">
          <div class="d-sm-flex justify-content-center justify-content-sm-between">
            <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright © bootstrapdash.com 2020</span>
            <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"> Free <a href="https://www.bootstrapdash.com/" target="_blank">Bootstrap dashboard templates</a> from Bootstrapdash.com</span>
          </div>
        </footer>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <script src="js/Common.js"></script>
  <!-- base:js -->
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
  <script src="vendors/typeahead.js/typeahead.bundle.min.js"></script>
  <script src="vendors/select2/select2.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <script src="js/file-upload.js"></script>
  <script src="js/typeahead.js"></script>
  <script src="js/select2.js"></script>
  <!-- End custom js for this page-->
</body>

</html>
