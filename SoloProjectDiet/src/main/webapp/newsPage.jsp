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
  <title>DietNews</title>
  
  <!-- base:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="vendors/jquery-bar-rating/fontawesome-stars.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/templatemo-xtra-blog.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
  <style type="text/css">
  .displNone{
  	display:none;
  }
  .dietInsBtn{
  float:right; 
  font-size:20px; 
  width: 150px; 
  height: 51px;
  }
  .textAlignC{
  text-align:center;
  }
  .hiddenBtn{
  visibility: hidden;
  }
  .marginLeft{
  margin-left: 30px;
  }
  .ptag{
  font-size: 20px; 
  line-height: 30px;
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
            <div class="col-sm-12 mb-4 mb-xl-0">
              <h3 class="font-weight-bold text-dark">식습관 뉴스</h3>
              
            </div>
          </div>
         
          <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body textAlignC" >
                  <h3 class="card-title">식습관에 관한 뉴스</h3>
                  <p class="card-description">
                    이 뉴스들은 <span style="color: #14c314;">네이버뉴스</span>에서 크롤링하였습니다!
                  </p>
                  <div class="table-responsive pt-3">
        
        
         
        <c:forEach var="d" items="${title}" varStatus="status" begin="0" end="7">
      
        <article class="col-12 col-md-6 tm-post" style="display:inline;">
		<hr class="tm-hr-primary" style="border-top: 5px solid #ec37fc;">
		<a href="${dNewsUrl[status.index]}"
			class="effect-lily tm-post-link tm-pt-60" target="blank">

			
				<img src="${newsImg[status.index]}" alt="포스트사진" class="img-fluid"
				style="width:300px; height:300px; display:inline;">
			 
			
			<h2 class="tm-pt-30 tm-color-primary tm-post-title" style="color: #f9938e;">
			${title[status.index]}</h2>
		</a>
		<p class="tm-pt-30">
			${content[status.index]}
			
		</p>
		
	</article>
	
        </c:forEach>
        
   


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
          <span class="text-muted d-block text-center text-sm-left d-sm-inline-block mt-2">Distributed By: <a href="https://www.themewagon.com/" target="_blank">ThemeWagon</a></span> 
        </footer>
        
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
	
  <!-- base:js -->
  <script src="vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/hoverable-collapse.js"></script>
  <script src="js/template.js"></script>
  <!-- endinject -->
  <!-- plugin js for this page -->
   <script src="vendors/chart.js/Chart.min.js"></script> 
  <script src="vendors/jquery-bar-rating/jquery.barrating.min.js"></script>
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <script src="js/dashboard.js"></script>
  <script src="js/chart.js"></script>
  <!-- End custom js for this page-->
</body>

</html>

