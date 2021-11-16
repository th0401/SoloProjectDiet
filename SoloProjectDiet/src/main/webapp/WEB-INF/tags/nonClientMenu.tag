<%@ tag language="java" pageEncoding="UTF-8"%>
<nav class="sidebar sidebar-offcanvas" id="sidebar">
               	
        
        <ul class="nav">
          <!-- <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="icon-box menu-icon"></i>
              <span class="menu-title">Dashboard</span>
            </a>
          </li> -->        
          
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">Login/SignUp</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="loginPage.do"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="signUpPage.do"> SignUp </a></li>
                
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="newsPage.do">
              <i class="icon-box menu-icon"></i>
              <span class="menu-title">식습관 뉴스</span>
            </a>
          </li>  
        </ul>
      </nav>