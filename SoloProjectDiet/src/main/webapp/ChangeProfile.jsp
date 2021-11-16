<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script src="js/Common.js"></script>
<script type="text/javascript">

$("#file1").on('change',function(){
	console.log("재밋네 js");
	  var fileName = $("#file1").val();
	  $(".upload-name").val(fileName);
	});

</script>
  <!-- Required meta tags --> 
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>프로필사진 변경창</title>
  
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
.outer{
   display:flex;
   align-items:center;
   flex-direction:row;
   justify-content: center;
}
.inner{
   position:absolute;
   top:50%;
   left:50%;
   transform: translate(-50%,-50%);
}
.fset{
   display:inline-block;
   width: 360px;
}
.tc{
	text-align:center;
}
.filebox .upload-name {
    display: inline-block;
    height: 40px;
    padding: 0 10px;
    vertical-align: middle;
    border: 1px solid #dddddd;
    
    color: #999999;
}

.filebox label {
    display: inline-block;
    padding: 10px 20px;
    color: #fff;
    border-radius:4px;
    background-color: #f02003;
    cursor: pointer;
    height: 40px;
    
   
}
.displNone{
  	display:none;
  }
</style>
</head>
<body>
<div class="outer">
		<div class="inner">
			<form method="post" enctype="multipart/form-data"
			action="updateProfile.do" class="fset textCenter mb-5 tm-comment-form tc" >
				<input type="hidden" name="id" value="${uVO.id}">
				<input type="hidden" name="pw" value="${uVO.pw}">
				<input type="hidden" name="name" value="${uVO.name}">
				<input type="hidden" name="gender" value="${uVO.gender}">
								
					
					<img src="${uVO.path}" alt="${uVO.name}님의 프로필(워너비?)사진" width="200px" height="200px" id="preImage">
						
					<br>
					<br>
					<div class="filebox">
						<label for="filename">파일찾기</label>
					    <input class="upload-name" id="uploadfilename"  value="첨부파일" placeholder="첨부파일" readonly>					    
						<input type="file" class="displNone"  name="FileUpload" id="filename" onchange="readImage(event)">
						</div>	
					
						<br>
						<br>
						<button type="submit" class="btn btn-danger btn-icon-text" id="confirm">
                          <i class="mdi mdi-upload btn-icon-prepend"></i>                                                    
                          변경 적용하기
                        </button>
	
				
			</form>
			
		</div>
	</div>
	
  
</body>
</html>