<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><spring:message code="message.login.pagetitle" /></title>
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
              <h4><spring:message code="message.login.hello" /></h4>
              <h6 class="font-weight-light"><spring:message code="message.login.continue" /></h6>
              
              <!-- 로그인폼 -->
              <form class="pt-3" method="post" action="login.do">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="id" id="exampleInputEmail1" placeholder="<spring:message code="message.login.id" />" required>
                </div>
                <div class="form-group">
                  <input type="password" class="form-control form-control-lg" name="pw" id="exampleInputPassword1" placeholder="<spring:message code="message.login.pw" />" required>
                </div>
                <div class="mt-3">
                <button type="submit" class="btn btn-info btn-lg btn-block" >
                      <i class="mdi mdi-account"></i>                      
                      <spring:message code="message.login.login" />
                    </button>
                
                </div>
                <div class="my-2 d-flex justify-content-between align-items-center">
                  
                  <a href="main.jsp" class="auth-link text-black"><spring:message code="message.login.main" /></a>
                </div>
                
                <div class="text-center mt-4 font-weight-light">
                  <spring:message code="message.login.noAccount" /> <a href="signUpPage.do" class="text-primary"><spring:message code="message.login.create" /></a>
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
  <!-- endinject -->
</body>

</html>
