<%@ tag language="java" pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
  		<div class="user-profile">
          <div class="user-image">
            <img src="${uVO.path}">
          </div>
          <div class="user-name">
              ${uVO.name}
          </div>
          
        </div>
        <ul class="nav">
          <!-- <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="icon-box menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="bodyList.do">
              <i class="icon-heart menu-icon"></i>
              <span class="menu-title">바디기록</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="dietList.do">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">식단기록</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="myPage.do">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">MyPage</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" onclick="checkAlert('logout.do','로그아웃하시겠어요?')">
              <i class="icon-cross menu-icon"></i>
              <span class="menu-title">Logout</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="newsPage.do">
              <i class="icon-paper menu-icon"></i>
              <span class="menu-title">식습관 뉴스</span>
            </a>
          </li>  
          <!-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="myPage.do"> MyPage </a></li>
                <li class="nav-item"> <a class="nav-link" href="bodyList.do"> 바디기록 </a></li>
                <li class="nav-item"> <a class="nav-link" href="dietList.do"> 식단기록 </a></li>
                <li class="nav-item"> <a class="nav-link" href="logout.do"> Logout </a></li>
                
              </ul>
            </div>
          </li> -->
          
        </ul>
      </nav>