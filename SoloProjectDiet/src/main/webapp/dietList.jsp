<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib prefix="mytag" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script src="js/Common.js"></script>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>dietList</title>
  <!-- base:css -->
  <link rel="stylesheet" href="vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/feather/feather.css">
  <link rel="stylesheet" href="vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="images/favicon.png" />
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
            
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">Bordered table</h4>
                  <p class="card-description">
                    Add class <code>.table-bordered</code>
                  </p>
                  <div class="table-responsive pt-3">
                  
                  <input type="hidden" >
                    <table class="table table-bordered">
                      <thead>
                        <tr>
                     
                          <th>날짜 </th>
                          <th>아침</th>
                          <th>점심</th>
                          <th>저녁</th>
                          <th>기타</th>
                          <th>총 칼로리</th>
                        </tr>
                      </thead>
                      
                      <c:forEach var="dl" items="${DietList}">                     
                      <tbody>                    
                     <input type="hidden" name="dnum" value="${dl.dnum}" >            
                       <tr>                          
                          <td>
                            <p>${dl.ddate}</p>
                          </td>
                          
                          <td>
                          <p>${dl.breakfastCalorie} kcal</p>
                          </td>
                          
                          <td>
                          <p>${dl.breakfastCalorie} kcal</p>
                          </td>
                          
                          <td>
                          <p>${dl.lunchCalorie} kcal</p>  
                          </td>
                          <td>
                          <p>${dl.dinerCalorie} kcal</p>  
                          </td>
                          <td>
                            <p style="display:inline; font-size:18px;">${dl.dayCalorie} kcal</p><button type="button" class="btn btn-outline-info btn-fw"  
                            onclick="location.href='getDietData.do?dnum=${dl.dnum}'" style="float:right;">세부정보</button>
                           
                          </td>
                        </tr>
                     
                      </tbody>                     
                                           
                      </c:forEach>
                    </table>
                    <br>
                    <mytag:paging pagingIndex="${pagingIndex}" isFirst="${isFirst}" isLast="${isLast}" url="dietList.do" />
                  </div>
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
  <!-- End plugin js for this page -->
  <!-- Custom js for this page-->
  <!-- End custom js for this page-->
</body>

</html>
