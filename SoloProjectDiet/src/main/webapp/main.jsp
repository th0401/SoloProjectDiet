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
  <title>Main</title>
  
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
  .ptag{
  font-size: 20px; 
  line-height: 30px;
  }
  </style>
  <script type="text/javascript">
          
          const jbd=[
        	  <c:forEach var="jbd" items="${jbd}">
        	  	${jbd},
        	  </c:forEach>
          ];
          //jbd[0],jbd[1],jbd[2]
          //console.log(jbd);
          </script>
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
              <h3 class="font-weight-bold text-dark">Hi, welcome!</h3>
              
            </div>
          </div>
          <!-- 로그인이 안된경우 -->
          <c:if test="${uVO==null}">
          <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">올바른 식습관</h3>
                  <p class="card-description">
                    건강한 내일을 위한 어렵지않은 해법! <code>올바른 식생활</code>에서 찾을 수 있다.
                  </p>
                  <div class="table-responsive pt-3">
                    
                    <h3 class="text-success">올바른 식생활이란?</h3><br>
                       <p class="ptag"> 올바른 식생활은 <span class="text-info">제때에, 다양한 식품들을 골고루, 자신의 체중과 활동량에 알맞게, 싱겁게 그리고 온 가족이 한 자리에 모여 즐겁게 </span>
                  먹는 것이다.<br><br> </p>         
     
     				<h3 class="text-success">우리 식생활은?</h3><br>               
                    <p class="ptag">최근 식생활의 서구화, 불규칙한 식사, 잦은 외식 등 다양한 식생활의 변화로 뇌혈관질환, 심장병, 위암, 고혈압성질환, 당뇨병 등의 만성 질환이 해를 거듭할 수록 증가하고 있습니다. 이러한 식습관 불균형이 원인이 된 만성 질환은 올바른 식생활로 식습관의 개선을 통해서만 좋아질 수 있다.
올바른 식생활은 사실 어렵지 않습니다. 아래의 다섯가지 사항을 잘 지키면 된다.
<span class="text-info">규칙적인 시간에, 한쪽에 치우치지 않고 자연적인 식품을 골고루, 과식하지 않고 싱겁게, 가족과 함께 식사하는 것이 올바른 식생활입니다.</span>
건강한 내일에의 어렵지 않은 해법!<br>
올바른 식생활에서 찾을 수 있습니다.</p><br><br>

<h3 class="text-success">제때에!</h3><br>
<ul>
<li class="ptag">신체리듬에 맞춰 규칙적으로 식사하는 것은 아주 중요하다.</li>
<li class="ptag">다음 끼니의 과식으로 이어져 영양불균형을 초래하게 된다.</li>
<li class="ptag">이러한 불규칙적인 식사를 계속하면 소화기관의 손상 또는 관련질환이 생기는 등 건강을 해치게 된다.
특히 <span class="text-info">아침식사는 자동차에 시동을 걸 듯이 인체에 시동을 걸어주므로 꼭 챙겨 먹는 것</span>이 좋습니다.</li>
</ul>
<br>
<h3 class="text-success">아침을 거르면?</h3><br>
<ul>
<li class="ptag">혈당치 저하로 무기력해지며 집중력이 떨어짐</li>
<li class="ptag">과식으로 이어져 영양불균형을 초래함.</li>
<li class="ptag">이러한 불규칙적인 식사를 계속하면 소화기 관련질환의 발병으로 건강을 해치게 됨.</li>
</ul>
    <br>
    <h3 class="text-success">표준체중</h3><br>
    <p class="ptag">가장 건강한 체중을 말하며 통계적으로는 사망률이 가장 적은 체중을 의미한다.</p><br>
    <p class="ptag">표준 체중 계산하는 방법</p><br>
    <p class="ptag">여자 : 키(m)x키(m)x21</p><br>
    <p class="ptag">남자 : 키(m)x키(m)x21</p><br>
    <p class="ptag">예제 : 키 160cm 인 성인여성의 표준체중은 1.6 x 1.6 x 21 = 53.8입니다!</p><br><br>
    
    <h3 class="text-success">프로그램 목적</h3><br>
    <ul>
<li class="ptag">자신의 체중,키를 입력하며 최근 일주일동안의 체중변화를 그래프로 확인가능!</li>
<li class="ptag">자신이 과거에 어떤 식단으로 먹는지, 얼마만큼 칼로리를 섭취하는지를 기록하여 자신의 식단을 체크할 수 있음!</li>
<li class="ptag">식습관의 중요성을 위해 네이버에서 발췌한 최신 식습관과 관련된 뉴스제공</li>
</ul>
                  </div>
                </div>
              </div>
            </div>
          </c:if>
          
          <!-- 로그인한 경우 -->
          <c:if test="${uVO!=null}">
          <c:if test="${empty bodyDatas}">
          	<form class="pt-3" method="post" action="insertBody.do">
          	<input type="hidden" name="b_user" value="${uVO.id}">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="height" id="exampleInputEmail1" placeholder="키를 입력하세요" required>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="weight" id="exampleInputEmail1" placeholder="몸무게를 입력하세요" required>
                </div>
                <div class="mt-3">
                <button type="submit" class="btn btn-info btn-lg btn-block" >
                      <i class="mdi mdi-account"></i>                      
                      등록하기
                    </button>
                
                </div>
                
              </form>
              <br>
          </c:if>
          
          <c:if test="${!empty bodyDatas}">
          
          <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">현재 체중</h3>
                  <p class="card-description">
                    등록 일자 <code>${lastBodyVO.bdate}</code>
                  </p>
                  <div class="table-responsive pt-3">
                    <p style="font-size: 20px; line-height: 30px;">${lastBodyVO.weight} kg

                    </p>
                  </div>
                  <div id="insertMainBodyBtn">
                  <button type="button" class="btn btn-info" id="inBodyBtn" onclick="insertUpdateBtn('insertMainBodyBtn','insertMainBodyForm')">새로 등록하기!</button>
                  </div>
                </div>
              </div>              
            </div> 
            
            <div class="displNone" id="insertMainBodyForm">
            <form class="pt-3" method="post" action="insertBody.do">
          	<input type="hidden" name="b_user" value="${uVO.id}">
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="height" id="exampleInputEmail1" placeholder="키를 입력하세요" value="${lastBodyVO.height}" required>
                </div>
                <div class="form-group">
                  <input type="text" class="form-control form-control-lg" name="weight" id="exampleInputEmail1" placeholder="몸무게를 입력하세요" required>
                </div>
                <div class="mt-3">
                <button type="submit" class="btn btn-info btn-lg btn-block" >
                      <i class="mdi mdi-account"></i>                      
                      등록하기
                    </button>
                <button type="button" class="btn btn-info btn-lg btn-block" onclick="insertUpdateCancleBtn('insertMainBodyBtn','insertMainBodyForm')">
                      <i class="mdi mdi-account"></i>                      
                      취소하기
                    </button>
                </div>
                
              </form>
            </div>
         
            <div class="col-lg-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">몸무게(kg)</h3>
                  <canvas id="areaChart" style="height:30vh; width:50vw"></canvas>
                </div>
              </div>
            </div>
           
          
          </c:if>
    <c:if test="${empty dietDatas}">
    	<!-- 식단보여주기,등록,수정 가능 -->
          <div class="col-lg-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">식단보기,작성</h3>                  
                  <div class="table-responsive pt-3">
         
         		<!-- 최초식단등록 폼 -->
                    <form action="insertDiet.do" method="post">
                    <input type="hidden" name="d_user" value="${uVO.id}">
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
                           <input type="date" name="ddate" required > 
                          </td>
                          
                        </tr>     
                        <tr class="table-success">
                          <td>아 침</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="breakfast" required>-</textarea>
                          </td>
                          <td>
                            <input type="number" name="breakfastCalorie" value="0"required>
                          </td>
                        
                        </tr>
                        <tr class="table-warning">
                          <td>점 심</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="lunch" required>-</textarea>
                          </td>
                          <td>
                            <input type="number" name="lunchCalorie" value="0"required>
                          </td>
                          
                        </tr>
                        <tr class="table-danger">
                          <td>저 녁</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="diner" required>-</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="dinerCalorie" value="0" required>
                          </td>
                      
                        </tr>
                        <tr class="table-primary">
                          <td>그 외<br>(간식 음료 등)</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="another" required>-</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="anotherCalorie" value="0" required>
                          </td>
                        
                        </tr>                                                               
                      </tbody>                     
                    </table>
                     <br>
                    <button type="submit" class="dietInsBtn btn btn-info">등록하기</button>                  	
                    </form>                   
                  </div>
                </div>
              </div>
            </div>
    </c:if>
    <c:if test="${!empty dietDatas}">
          <!-- 식단보여주기,등록,수정 가능 -->
          <div class="col-lg-12 stretch-card">
              <div class="card">
                <div class="card-body">
                  <h3 class="card-title">식단보기,작성</h3>
                  
                  <div class="table-responsive pt-3">
         
                    
                    <div id="recentMainDietForm">
                    <table class="table table-bordered" style="text-align: center;" >
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
                           <input type="date" name="ddate" id="fdd" value="${lastDietVO.ddate}" readonly required> 
                          </td>
                          
                        </tr>     
                        <tr class="table-success">
                          <td>아 침</td>
                          <td>
                            <textarea class="form-control" id="fb" rows="4" name="breakfast" readonly required>${lastDietVO.breakfast}</textarea>
                          </td>
                          <td>
                            <input type="text" name="breakfastCalorie" id="fbc" value="${lastDietVO.breakfastCalorie}  kcal" readonly required>
                          </td>
                        
                        </tr>
                        <tr class="table-warning">
                          <td>점 심</td>
                          <td>
                            <textarea class="form-control" id="fl" rows="4" name="lunch" readonly required>${lastDietVO.lunch}</textarea>
                          </td>
                          <td>
                            <input type="text" name="lunchCalorie" id="flc" value="${lastDietVO.lunchCalorie}  kcal" readonly  required>
                          </td>
                          
                        </tr>
                        <tr class="table-danger">
                          <td>저 녁</td>
                          <td>
                            <textarea class="form-control" id="fd" rows="4" name="diner" readonly required>${lastDietVO.diner}</textarea>
                          </td>
                          
                          <td>
                            <input type="text" name="dinerCalorie" id="fdc" value="${lastDietVO.dinerCalorie}  kcal" readonly required>
                          </td>
                      
                        </tr>
                        <tr class="table-primary">
                          <td>그 외<br>(간식 음료 등)</td>
                          <td>
                            <textarea class="form-control" id="fa" rows="4" name="another" readonly required>${lastDietVO.another}</textarea>
                          </td>
                          
                          <td>
                            <input type="text" name="anotherCalorie" id="fac" value="${lastDietVO.anotherCalorie} kcal" readonly required>
                          </td>
                         
                        </tr> 
                        <tr class="table-info">
                          <td>총 칼로리</td>
                          <td colspan="2">
                           <input type="text" name="dayCalorie" id="fAllC" class="form-control textAlignC" value="하루 총  칼로리양은 ${lastDietVO.dayCalorie} kcal입니다!" readonly required> 
                          </td>
                          
                        </tr>                                            
                      </tbody>
                    </table>
                    <br>
                   <button type="button" class="dietInsBtn btn btn-info marginLeft" onclick="insertUpdateBtn('recentMainDietForm','insertMainDietForm')" style="width: 170px;">새로 등록하기</button>
                   <button type="button" class="dietInsBtn btn btn-info" onclick="updateMainDiet()">수정하기</button>
                  </div>
                  <!-- 식단수정 폼 -->
                   
                   <div id="updateDietMainForm" class="displNone">
                   <form method="post">
                   <input type="hidden" name="dnum" id="ufdn" value="${lastDietVO.dnum}">
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
                           <input type="date" name="ddate" id="ufdd" value="${lastDietVO.ddate}" required> 
                          </td>
                          
                        </tr>     
                        <tr class="table-success">
                          <td>아 침</td>
                          <td>
                            <textarea class="form-control" id="ufb" rows="4" name="breakfast"  required>${lastDietVO.breakfast}</textarea>
                          </td>
                          <td>
                            <input type="number" name="breakfastCalorie" id="ufbc" value="${lastDietVO.breakfastCalorie}"  required>
                          </td>
                        
                        </tr>
                        <tr class="table-warning">
                          <td>점 심</td>
                          <td>
                            <textarea class="form-control" id="ufl" rows="4" name="lunch" required>${lastDietVO.lunch}</textarea>
                          </td>
                          <td>
                            <input type="number" name="lunchCalorie" id="uflc" value="${lastDietVO.lunchCalorie}"   required>
                          </td>
                          
                        </tr>
                        <tr class="table-danger">
                          <td>저 녁</td>
                          <td>
                            <textarea class="form-control" id="ufd" rows="4" name="diner"  required>${lastDietVO.diner}</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="dinerCalorie" id="ufdc" value="${lastDietVO.dinerCalorie}"  required>
                          </td>
                      
                        </tr>
                        <tr class="table-primary">
                          <td>그 외<br>(간식 음료 등)</td>
                          <td>
                            <textarea class="form-control" id="ufa" rows="4" name="another"  required>${lastDietVO.another}</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="anotherCalorie" id="ufac" value="${lastDietVO.anotherCalorie}"  required>
                          </td>
                         
                        </tr> 
                                                                 
                      </tbody>
                    </table>
                    </form>
                    <br>
                    <button type="button" class="dietInsBtn btn btn-info marginLeft" onclick="insertUpdateCancleBtn('recentMainDietForm','updateDietMainForm')" id="insertMainDietBtn" style="width: 170px;">취소하기</button>
                   <button type="button" class="dietInsBtn btn btn-info" onclick="dietEditFinish()">수정하기</button>
                   </div>
                   
                    
                    <form action="insertDiet.do" method="post" id="insertMainDietForm" class="displNone">
                    <input type="hidden" name="d_user" value="${uVO.id}">
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
                           <input type="date" name="ddate" required > 
                          </td>
                          
                        </tr>     
                        <tr class="table-success">
                          <td>아 침</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="breakfast" required>-</textarea>
                          </td>
                          <td>
                            <input type="number" name="breakfastCalorie" value="0"required>
                          </td>
                        
                        </tr>
                        <tr class="table-warning">
                          <td>점 심</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="lunch" required>-</textarea>
                          </td>
                          <td>
                            <input type="number" name="lunchCalorie" value="0"required>
                          </td>
                          
                        </tr>
                        <tr class="table-danger">
                          <td>저 녁</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="diner" required>-</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="dinerCalorie" value="0" required>
                          </td>
                      
                        </tr>
                        <tr class="table-primary">
                          <td>그 외<br>(간식 음료 등)</td>
                          <td>
                            <textarea class="form-control" id="exampleTextarea1" rows="4" name="another" required>-</textarea>
                          </td>
                          
                          <td>
                            <input type="number" name="anotherCalorie" value="0" required>
                          </td>
                        
                        </tr>                                                               
                      </tbody>                     
                    </table>
                     <br>
                     <button type="button" class="dietInsBtn btn btn-info marginLeft"onclick="insertUpdateCancleBtn('recentMainDietForm','insertMainDietForm')">취소하기</button> 
                     <button type="submit" class="dietInsBtn btn btn-info">등록하기</button>
                                                
                    </form>  
                                       
                  </div>
                </div>
              </div>
            </div>
           </c:if><!-- !empty dietDatas if닫는 테그 --> 
           </c:if><!-- 로그인 if닫는테그 -->
          
          
 			
 			
 			<%-- <!-- json 데이터를 위한 코드 -->
          <c:forEach var="jbd" items="${jbd}">
          ${jbd}
          </c:forEach>   --%>       
    
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

