<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>

 <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><spring:message code="message.signUp.pagetitle" /></title>
  <!-- base:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
  
  <style type="text/css">
  .checkIdBtn{
  float:right;
  margin-bottom:15px;
  }
  #idError, #pwError, #pwCheckError, #nameError {
	width: 0px auto;
	display: inline-block;
	color: red;
	font-size: 11px;
	font-weight: normal;
	margin-left: 10px;
}
  </style>
</head>

<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              <div class="brand-logo">
                <img src="images/logo-dark.svg" alt="logo">
              </div>
              <h4><spring:message code="message.signUp.new" /></h4>
              <h6 class="font-weight-light"><spring:message code="message.signUp.method" /></h6>
              
              <!-- 회원가입폼 -->
              <form class="pt-3" action="signUp.do" method="post" name="join">
              
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="id" id="sid" placeholder="<spring:message code="message.signUp.id" maxlength="15"/>" required>
                   <br>
                   <div class="checkIdBtn">
                  <button type="button" class="btn btn-outline-info btn-icon-text" id="confirm" onclick="emptyID()"><i class="mdi mdi-upload btn-icon-prepend"></i>id중복체크</button>
                  </div>
                </div>
                <br >
                <span class="signupt" id="pwError"></span>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg check" id="pw" name="pw" maxlength="15" placeholder="<spring:message code="message.signUp.pw"/>" required>
                </div>
               <br >
                <span class="signupt" id="pwCheckError"></span>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg check" id="pwCheck" name="pwCheck" maxlength="15" placeholder="<spring:message code="message.signUp.pwCheck" />" required>
                </div>
                <br >
                <span class="signupt" id="nameError"></span>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg check" id="name" name="name" placeholder="Username" maxlength="6" required>
                </div>
                
                        <div class="form-group row">
                          <label class="col-sm-3 col-form-label" style="font-size: 17px;"><spring:message code="message.signUp.gender" /></label>
                          <div class="col-sm-4">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="gender" value="man" checked>
                                <spring:message code="message.signUp.man" />
                              </label>
                            </div>
                          </div>
                          <div class="col-sm-5">
                            <div class="form-check">
                              <label class="form-check-label">
                                <input type="radio" class="form-check-input" name="gender" value="woman">
                                <spring:message code="message.signUp.woman" />
                              </label>
                            </div>
                          </div>
                        </div>
    
                <div class="mt-3">
                <button type="submit" class="btn btn-primary btn-lg btn-block" >
                      <i class="mdi mdi-account"></i>                      
                      <spring:message code="message.signUp.signUp" />
                    </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  <spring:message code="message.signUp.already" /> <a href="loginPage.do" class="text-primary"><spring:message code="message.signUp.login" /></a>
                </div>
              </form>
              
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
  <script src="js/Common.js"></script>
  <!-- endinject -->
</body>

</html>