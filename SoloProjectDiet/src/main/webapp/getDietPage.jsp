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
  <title>식단변경페이지</title>
  
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
              <h4 class="font-weight-bold text-dark">식단정보 변경</h4>
              <p class="font-weight-normal mb-2 text-muted">APRIL 1, 2019</p>
            </div>
          </div>
          
    
    
    
          <!-- 식단보여주기,등록,수정 가능 -->
          <div class="col-lg-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title">식단보기,작성</h4>
                  <p class="card-description">
                    Add class <code>식단</code>
                  </p>
                  <div class="table-responsive pt-3">
            
                   <div id="recentMainDietForm">                  
                    <table class="table table-bordered" style="text-align: center;">
                      <thead>                     
                        <tr>
                          <th style="width: 120px">#</th>
                          <th>식 단</th>                          
                          <th style="width: 160px">칼로리(kcal)</th>                                                   
                        </tr>
                      </thead>
                      <tbody>
                       <tr class="table-info">
                          <td>날 짜</td>
                          <td colspan="3">
                           <input type="date" name="ddate" value="${dietData.ddate}" readonly required> 
                          </td>
                          
                        </tr>     
                        <tr class="table-success">
                          <td>아 침</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="breakfast" readonly required>${dietData.breakfast}</textarea>
                          </td>
                          <td>
                            <input type="text" name="breakfastCalorie"  value="${dietData.breakfastCalorie}  kcal" readonly required>
                          </td>
                        
                        </tr>
                        <tr class="table-warning">
                          <td>점 심</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="lunch" readonly required>${dietData.lunch}</textarea>
                          </td>
                          <td>
                            <input type="text" name="lunchCalorie" value="${dietData.lunchCalorie}  kcal" readonly  required>
                          </td>
                          
                        </tr>
                        <tr class="table-danger">
                          <td>저 녁</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="diner" readonly required>${dietData.diner}</textarea>
                          </td>
                          
                          <td>
                            <input type="text" name="dinerCalorie" value="${dietData.dinerCalorie}  kcal" readonly required>
                          </td>
                      
                        </tr>
                        <tr class="table-primary">
                          <td>그 외<br>(간식 음료 등)</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="another" readonly required>${dietData.another}</textarea>
                          </td>
                          
                          <td>
                            <input type="text" name="anotherCalorie" value="${dietData.anotherCalorie} kcal" readonly required>
                          </td>
                         
                        </tr> 
                        <tr class="table-info">
                          <td>총 칼로리</td>
                          <td colspan="2">
                           <input type="text" name="dayCalorie" class="form-control textAlignC" value="하루 총  칼로리양은 ${dietData.dayCalorie} kcal입니다!" readonly required> 
                          </td>
                          
                        </tr>                                            
                      </tbody>
                    </table>
                    <br>
                   <button type="button" class="dietInsBtn btn btn-info marginLeft" onclick="checkAlert('deleteDiet.do?dnum=${dietData.dnum}', '식단정보를 삭제하시겠어요?')" id="insertMainDietBtn" style="width: 170px;">삭제하기</button>
                   <button type="button" class="dietInsBtn btn btn-info" onclick="insertMainDiet()" id="insertMainDietBtn" style="width: 170px;">정보수정</button>
                   
                    </div>
                    
                    
                    <form action="updateDiet.do" method="post" id="insertMainDietForm" class="displNone">
                    <input type="hidden" name="dnum" value="${dietData.dnum}">                    
                    
                    <table class="table table-bordered" style="text-align: center;">
                      <thead>                     
                        <tr>
                          <th style="width: 120px">#</th>
                          <th>식 단</th>                          
                          <th style="width: 160px">칼로리(kcal)</th>                                                   
                        </tr>
                      </thead>
                      <tbody>
                       <tr class="table-info">
                          <td>날 짜</td>
                          <td colspan="3">
                           <input type="date" name="ddate" value="${dietData.ddate}" required > 
                          </td>
                          
                        </tr>     
                        <tr class="table-success">
                          <td>아 침</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="breakfast" required>${dietData.breakfast}</textarea>
                          </td>
                          <td>
                            <input type="number" name="breakfastCalorie" value="${dietData.breakfastCalorie}" required>
                          </td>
                        
                        </tr>
                        <tr class="table-warning">
                          <td>점 심</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="lunch" required>${dietData.lunch}</textarea>
                          </td>
                          <td>
                            <input type="number" name="lunchCalorie" value="${dietData.lunchCalorie}" required>
                          </td>
                          
                        </tr>
                        <tr class="table-danger">
                          <td>저 녁</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="diner" required>${dietData.diner}</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="dinerCalorie" value="${dietData.lunchCalorie}" required>
                          </td>
                      
                        </tr>
                        <tr class="table-primary">
                          <td>그 외<br>(간식 음료 등)</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="another" required>${dietData.another}</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="anotherCalorie" value="${dietData.lunchCalorie}" required>
                          </td>
                        
                        </tr>                                                               
                      </tbody>                     
                    </table>
                     <br>
                     <button type="button" class="dietInsBtn btn btn-info marginLeft" id="insertMainDietCancleBtn"onclick="insertMainDietCancle()">취소하기</button>
                     <button type="submit" class="dietInsBtn btn btn-info">변경하기</button>                            
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

