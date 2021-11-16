
// 내가 만든 js페이지

// 사용자 확인시 동작기능
function checkAlert(uri, text) {
	result = confirm(text);
	if (result == true) {
		location.href = uri;
	} else {
		return;
	}
}   
//=================================================== main.jsp===================================================

function insertBody(){ // 등록버튼 클릭시 등록폼이 보이게하는 기능

	$('#inBodyDiv').css('display','');
	$('#inBodyBtn').css('visibility','hidden');
}	 


function insertUpdateBtn(id1,id2){ // 등록버튼 클릭시 등록폼이 보이게하는 기능
	$('#'+id1).addClass('displNone');
	$('#'+id2).removeClass('displNone');
}

function insertUpdateCancleBtn(id1,id2){ // 취소버튼 클릭시 등록폼이 사라지게하는 기능
	$('#'+id1).removeClass('displNone');
	$('#'+id2).addClass('displNone');
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
			
			console.log(args[0].ddate);
			console.log(args[0].breakfastCalorie);
			console.log(args[0].lunchCalorie);
			console.log(args[0].dinerCalorie);
			console.log(args[0].anotherCalorie);
			console.log(args[0].dayCalorie);			
			
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






function checkID(id, mail, type) { // 회원 가입 시 ID 중복 체크하는 함수
	console.log(id);
	console.log(mail);
	/* 		var id = document.getElementById("sid").value;
		var mail = document.getElementById("smail").value; */
	$.ajax({ 
		// [요청 데이터 경로]
		type: "GET", // 단순 정보 조회 시에는 GET, 정보가 너무 많거나 insert/update를 할때는 POST
		url: "checkID.ucdo",	 // "checkID.ucdo?id="+id+"&mail="+mail,
		data:{// 위 컨트롤에 데이터 전송
			id : $("#ssid").val(),
			mail : $("#smail").val()
		},
		success: function(data) { 
			var uri = "codeSend.ucdo?id="+id.value+"&mail="+mail.value+"&type="+type;
			//console.log('adasdasd '+data.trim());
			//console.log(data.trim()=="false");

			if(type == 'signUp'){
				if (data.trim()=="false") { // 중복 데이터가 없을 때, trim():문자열 공백제거
					alert("사용 가능한 ID입니다.\n잠시후 이메일 인증 팝업창이 실행됩니다.");
				} else {
					alert("존재하는 ID입니다.");
					return;
				}
			}
			else if(type == 'infoHelp'){
				if (data.trim()=="true") { // 중복 데이터가 없을 때, trim():문자열 공백제거
					alert("이메일 확인이 완료되었습니다.\n잠시후 이메일 인증 팝업창이 실행됩니다.");
				} else {
					alert("존재하지 않은 이메일입니다.");
					return;
				}
			}
			
			window.open(uri, '인증처리 페이지', 'width=800, height=700');
		},
		error: function(xhr) {
			console.log(xhr.status + " : " + xhr.errorText);
			console.log("uri : " + uri);
			alert("에러발생!");
		}
	});
}
function emptyID(type){
	var id = document.getElementById("ssid")
	var mail = document.getElementById("smail")

	// id를 입력하지 않았거나, 이메일을 선택하지 않았다면 alert창 띄움
	if (!id.value || mail.value == "이메일 선택") {
		console.log(mail.value);
		alert('아이디 혹은 이메일을 입력해 주세요.');
		id.focus(); // 포커스 이동
		return false;
	}
	else{// 입력되면 id중복확인
		checkID(id, mail, type); // 함수호출
	}

}