
// 내가 만든 js페이지


//=================================================== 모든페이지 기능수행===================================================

// 사용자 확인시 동작기능
function checkAlert(uri, text) {
	result = confirm(text);
	if (result == true) {
		location.href = uri;
	} else {
		return;
	}
}

function insertUpdateBtn(id1,id2){ // 등록버튼 클릭시 등록폼이 보이게하는 기능, 모든 페이지 통합
	$('#'+id1).addClass('displNone');
	$('#'+id2).removeClass('displNone');
}

function insertUpdateCancleBtn(id1,id2){ // 취소버튼 클릭시 등록폼이 사라지게하는 기능, 모든 페이지 통합
	$('#'+id1).removeClass('displNone');
	$('#'+id2).addClass('displNone');
}

//=================================================== main.jsp===================================================


/* 기존에 해왔던 js코드 => 기능을 통합한 코드로 개발하여 필요없음
function insertBody(){ // 등록버튼 클릭시 등록폼이 보이게하는 기능

	$('#inBodyDiv').css('display','');
	$('#inBodyBtn').css('visibility','hidden');
}	 

function insertBodyCancle(){ 

	$('#inBodyDiv').css('display','none');
	$('#inBodyBtn').css('visibility','');
}	 	 

function updateMainDiet(){
	$('#updateDietMainForm').removeClass('displNone');
	$('#recentMainDietForm').addClass('displNone');
	
}

function updateMainDietCancle(){
	$('#updateDietMainForm').addClass('displNone');
	$('#recentMainDietForm').removeClass('displNone');
	
}
*/
function dietEditFinish(){ 
	
	var dnum = $("#ufdn").val();
	var ddate = $("#ufdd").val();
	
	var breakfast = $("#ufb").val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	var lunch = $("#ufl").val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	var diner = $("#ufd").val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	var another = $("#ufa").val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	
	var bCalorie = $("#ufbc").val();
	var lCalorie = $("#uflc").val();
	var dCalorie = $("#ufdc").val();
	var aCalorie = $("#ufac").val();
	
	// 데이터들
	var params = "dnum="+dnum+"&ddate="+ddate+
	"&breakfast="+breakfast+"&lunch="+lunch+"&diner="+diner+"&another="+another+
	"&breakfastCalorie="+bCalorie+"&lunchCalorie="+lCalorie+"&dinerCalorie="+dCalorie+
	"&anotherCalorie="+aCalorie;
  //console.log(params);

	$.ajax({
		type:"post",
		url:"updateDietMain.do",
		data:params,
		dataType:"json",
		success:function(args){
			$('#updateDietMainForm').addClass('displNone');
			$('#recentMainDietForm').removeClass('displNone');			
			
//			console.log(args[0].ddate);
//			console.log(args[0].breakfastCalorie);
//			console.log(args[0].lunchCalorie);
//			console.log(args[0].dinerCalorie);
//			console.log(args[0].anotherCalorie);
//			console.log(args[0].dayCalorie);			
			
			$("#fdd").val(args[0].ddate);
			$("#fb").text(args[0].breakfast);
			$("#fbc").val(args[0].breakfastCalorie);
			$("#fl").text(args[0].lunch);
			$("#flc").val(args[0].lunchCalorie);
			$("#fd").text(args[0].diner);
			$("#fdc").val(args[0].dinerCalorie);
			$("#fa").text(args[0].another);
			$("#fac").val(args[0].anotherCalorie);
			$("#fAllC").val(args[0].dayCalorie);
		}
	})
}
// =================================================== BodyList.jsp=================================================== 

function bdEdit(index){ 
	//console.log("이태호 들어옴?? "+index);
	$('#bdEditBtn'+index).css('visibility','hidden');
	$('#bdDeleteBtn'+index).css('visibility','hidden');
	$('#bodyWeight'+index).attr('type','text');
	$('#bodyHeight'+index).attr('type','text');
	$('#bdinsertBtn'+index).css('visibility','');
	$('#bdCancleBtn'+index).css('visibility','');
	$('#pBodyWeight'+index).css('display','none');
	$('#pBodyHeight'+index).css('display','none');
	
}	 

function bdEditCancle(index){ 

	$('#bdEditBtn'+index).css('visibility','');
	$('#bdDeleteBtn'+index).css('visibility','');
	$('#bodyWeight'+index).attr('type','hidden');
	$('#bodyHeight'+index).attr('type','hidden');
	$('#bdinsertBtn'+index).css('visibility','hidden');
	$('#bdCancleBtn'+index).css('visibility','hidden');
	$('#pBodyWeight'+index).css('display','');
	$('#pBodyHeight'+index).css('display','');
}	 

function bdEditFinish(index){ 
	
	var weight = $("#bodyWeight"+index).val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	var height = $("#bodyHeight"+index).val().replaceAll("??", "⁇").replaceAll("&","＆").replaceAll("%","％")
	.replaceAll("+","＋").replaceAll("\\", "￦");
	
	var params = "weight="+$("#bodyWeight"+index).val()+"&b_user="+$("#b_user"+index).val()+
	"&height="+$("#bodyHeight"+index).val()+"&bnum="+$("#bnum"+index).val()+"&bdate="+$("#bdate"+index).val();
  //console.log(params);

	$.ajax({
		type:"post",
		url:"updateBody.do",
		data:params,
		dataType:"json",
		success:function(args){
			$('#bdEditBtn'+index).css('visibility','');
			$('#bdDeleteBtn'+index).css('visibility','');
			$('#bodyWeight'+index).attr('type','hidden');
			$('#bodyHeight'+index).attr('type','hidden');
			$('#bdinsertBtn'+index).css('visibility','hidden');
			$('#bdCancleBtn'+index).css('visibility','hidden');
			$('#pBodyWeight'+index).css('display','');
			$('#pBodyHeight'+index).css('display','');
			
			console.log("index: " + index);
			$("#pBodyWeight"+index).text(args[0].weight);
			$("#pBodyHeight"+index).text(args[0].height);
			
		}
	})
}

function bdDelete(index, bnum){ 
	result = confirm("해당 기록을 삭제하시겠어요?");
	if (result == true) {
		var params = "bnum="+bnum;
		console.log(index, bnum);
		$.ajax({
			type:"post",
			url:"deleteBody.do",
			data:params,
			dataType:"json",
			success:function(data){ 
				
				//var body = document.querySelector("#body"+index);
				//console.log("이태호"+body);
				
					//body.remove(); // 데이터 삭제
					$("#body"+index).remove();
				
			}
		});
	
	} else {
		return;
	}
}


//=================================================== myPage.jsp===================================================
function ChangeProfile(){
	window.open("ChangeProfile.jsp","프로필사진변경","width=800px,height=600px");
}

function updateBtn(id1,id2){ // 정보변경 버튼 클릭시 등록폼이 보이게하는 기능
	//console.log(id1+" : "+id2);
	$("#"+id1).addClass('displNone');
	$("#"+id2).removeClass('displNone');
	
}	 

function updateCancleBtn(id1,id2){ // 취소버튼 클릭시 등록폼이 사라지게하는 기능

	$("#"+id1).removeClass('displNone');
	$("#"+id2).addClass('displNone');
}	 


//=================================================== changeProfile.jsp===================================================


$(function() {		//사진미리보기 js
    $("#filename").on('change', function(){
        readURL(this);
    });
});
function readURL(input) {
    if (input.files && input.files[0]) {
       var reader = new FileReader();
       reader.filename = input.files[0].name;
       reader.onload = function (e) {
    	   console.log(e.target.filename);
    	   $('#uploadfilename').attr('value', e.target.filename); 
    	   $('#preImage').attr('src', e.target.result);
       }
       reader.readAsDataURL(input.files[0]);
    }
}



//=================================================== signUp.jsp===================================================

function emptyID(){
	var id = document.getElementById("sid")

	// id를 입력하지 않았다면 alert창 띄움
	if (!id.value) {
		//console.log(id.value);
		alert('아이디를 입력해 주세요.');
		id.focus(); // 포커스 이동
		return false;
	}
	else{// 입력되면 id중복확인
		checkID(id); // 함수호출
	}

}
function checkID(id) { // 회원 가입 시 ID 중복 체크하는 함수
	console.log(id);	
	/* 		var id = document.getElementById("sid").value;
		var mail = document.getElementById("smail").value; */
	$.ajax({ 
		// [요청 데이터 경로]
		type: "GET", // 단순 정보 조회 시에는 GET, 정보가 너무 많거나 insert/update를 할때는 POST
		url: "checkID.do",	 // "checkID.ucdo?id="+id+"&mail="+mail,
		data:{// 위 컨트롤에 데이터 전송
			id : $("#sid").val(),
			
		},
		success: function(data) { 
			
			//console.log('adasdasd '+data.trim());
			//console.log(data.trim()=="false");
			
				if (data.trim()=="true") { // 중복 데이터가 없을 때, trim():문자열 공백제거
					
					alert("존재하는 ID입니다.");
					return;
			
				} else {
					// ID인증 후 이 테그를 없애기 위해 구현
					document.getElementById("confirm").remove(); 

					alert("사용 가능한 ID입니다.\n아이디를 바꾸고싶다면 새로고침을 눌러주세요!");
					document.getElementById("sid").readOnly = true;
				}

		},
		error: function(xhr) {
			console.log(xhr.status + " : " + xhr.errorText);			
			alert("에러발생!");
		}
	});
}

window.onload = function(){
		
//	form의 name(signUp)으로 → 내부 데이터를 변수에 가져옴 
	var join = document.join;
	 //console.log(join); 

//	[변수 셋팅]
	// 오류체크 대상
	var input = document.querySelectorAll('.check');

	// 오류ID -> 오류문구 표시할 곳
	var errorId = ["pw", "pwCheck", "name"];

	// 정규식 모음 		ID(5~15자 a~z, A~Z, 0~9, -, _ )		PW(10~20자 a~z, A~Z, 0~9,~!@#$%^&*()_-)	NAME(3~10자)
	//var RegExp = [/^[a-zA-Z0-9-_]{5,15}$/, /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}/, /^[.]{1,20}$/];
	var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}/; // a~Z, 0~9, ~!@, ~!@#$%^&*()_- 를 10~20자 이내 입력가능
	var nameLimit = /^[ㄱ-ㅎㅏ-ㅣ가-힣0-9a-zA-Z_-]{1,10}$/; // 한글, a-Z, 0~9 _ - 를 1~10자 이내 입력가능
	
	// 에러문구
	var errorStr = ["10~20자의 영문, 숫자와 특수기호 ~!@#$%^&*()_-만 사용 가능합니다.", "1~10자의 한글, 영문, 숫자 (_),(-)만 입력 가능합니다."];

	// 오류ID 구간 전체 불러오기 -> innerReset함수 활용변수
	var error = document.querySelectorAll('.signupt');
	console.log(error[0]);

//-------------------------------------------------------------------------------------------
	
	//console.log(input);
	//console.log(error);

//	오류문구 초기화 메서드
	function innerReset(error){
		for(var i = 0; i < error.length; i++){
			error[i].innerHTML = "";
		}
	}
	for(var i = 0; i < error.length; i++){
		console.log(input[i]);
	}
	/*
//	에러처리 함수
	function writingError(index){
		
		if (!RegExp[index].test(input[index].value)) { 
            document.getElementById(errorId[index]+"Error").innerHTML = errorStr[index];
        }
	}

	innerReset(error); 
	
	// onkeydown이벤트 및 에러함수 호출 
	join.id.onkeydown = writingError(0);
	join.pw.onkeydown = writingError(1);
	join.name.onkeydown = writingError(3);
*/
	innerReset(error);

	//비밀번호
	 join.pw.onkeyup = function(){
		 //innerReset(error);// 오류문구 초기화
		// var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}/;
		 error[0].innerHTML = "";
         if (!pwLimit.test(input[0].value)) {
            document.getElementById(errorId[0]+"Error").innerHTML = errorStr[0];
         }
         
	 }
	 //비밀번호 체크
	 join.pwCheck.onkeyup= function(){
		
		 //innerReset(error);// 오류문구 초기화
		 error[1].innerHTML = "";
		 if (join.pw.value != join.pwCheck.value) {
	         document.getElementById("pwCheckError").innerHTML = "비밀번호가 일치하지 않습니다.";
	     }
		 
	 }
	 // 성명
	 join.name.onkeyup = function(){
		 innerReset(error);// 오류문구 초기화
		 //var nameLimit = /^[ㄱ-ㅎㅏ-ㅣ가-힣0-9a-zA-Z_-]{1,10}$/;
		 error[2].innerHTML = "";
         if (!nameLimit.test(input[2].value)) {
            document.getElementById(errorId[2]+"Error").innerHTML = errorStr[1];
         }
         
	 }
	
	 
	//-------------------------------------------------------------------------------------------


//	submit시 오류 동작
	join.onsubmit = function() {
		 
		// 오류문구 초기화
		innerReset(error);
		
		  // input 값 비어짐 여부 확인
        for (var i = 0; i < input.length - 1; i++) { // -1 == submit제외 
           var nullStr = [" 비밀번호를", " 비밀번호 확인을", " 성함을"];
           if (!input[i].value) {
              document.getElementById(errorId[i]+"Error").innerHTML = nullStr[i]+ " 입력해 주세요.";
              input[i].focus(); // 포커스 이동
              return false; // 종료 (포커스 이동유지를 위해 false 종료)
              break;
           }
        }   
		
/*
		// 오류확인
		for(var i = 0; i < errorId.length; i++){
			// [오류 체크] pwCheck
			if(errorId[i] == 'pwCheckError'){
				if(join.pw.value != join.pwCheck.value){ // pw와 같지않다면 에러문구 추가
					document.getElementById(errorId[i]+"Error").innerHTML = "비밀번호가 일치하지 않습니다.";
					input[i].focus(); // 포커스 이동
					return false; // 종료 (포커스 이동유지를 위해 false 종료)
				}
			}// if문


			// [오류 체크] 전체(id, pw, name)
			if(!RegExp.test(input[i].value)){
				document.getElementById(errorId[i]+"Error").innerHTML = errorStr[i];
				input[i].focus(); // 포커스 이동
				return false; // 종료 (포커스 이동유지를 위해 false 종료)
			}	
		}//for
*/
		 // pw
		 if (!pwLimit.test(input[0].value)) {
            document.getElementById(errorId[0]+"Error").innerHTML = errorStr[0];
            join.pw.focus(); // 포커스 이동
            return false;
         }
         // pwCheck
         if (join.pw.value != join.pwCheck.value) {
            document.getElementById("pwCheckError").innerHTML = "비밀번호가 일치하지 않습니다.";
            join.pwCheck.focus(); // 포커스 이동
            return false;
         }
		 // 이름
	 	 if (!nameLimit.test(input[2].value)) { 
            document.getElementById(errorId[2]+"Error").innerHTML = errorStr[1];
            join.name.focus(); // 포커스 이동
            return false;
         }
		
	 	 if(document.getElementById("confirm")!=null){
	 		 alert('ID 중복체크를 해주세요. ');
	 		 return false;
	 	 }
	 	 
	}// join.submit
}
