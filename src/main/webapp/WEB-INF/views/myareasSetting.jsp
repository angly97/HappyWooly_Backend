<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" /> 
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>구해줘 Home</title>
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Google fonts-->
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Newsreader:ital,wght@0,600;1,600&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,500;0,600;0,700;1,300;1,500;1,600;1,700&amp;display=swap"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,400;1,400&amp;display=swap"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top shadow-sm"
		id="mainNav">
		<div class="container px-5">
			<a class="navbar-brand fw-bold" href="./index.jsp">구해줘 Home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="bi-list"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
					<li class="nav-item"><a class="nav-link me-lg-3"
						href="#features">공지사항</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3" href="#news">오늘의
							뉴스</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3 post-login"
						href="#free">자유글</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3 post-login"
						href="#explore">주변탐방</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3 post-login"
						href="#interest">관심지역 설정</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3 post-login"
						href="#interest_explore">관심지역 둘러보기</a></li>
				</ul>
				<c:if test="${empty loginUser }">
				<button id="signUp"
					class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0 pre-login"
					data-bs-toggle="modal" data-bs-target="#signUpModal">
					<span class="d-flex align-items-center"> <i
						class="bi-chat-text-fill me-2"></i> <span class="small">Sign
							Up</span>
					</span>
				</button>
				<button id="login"
					class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0 pre-login"
					data-bs-toggle="modal" data-bs-target="#feedbackModal">
					<span class="d-flex align-items-center"> <i
						class="bi-chat-text-fill me-2"></i> <span class="small">Login</span>
					</span>
				</button>
				</c:if>
			</div>
		</div>
	</nav>

	<!-- 중앙 content start -->
	<!-- 중앙 최상단 div start -->
	<div class="container">
		<div style="height: 70px"></div>
		<h2 class="text-center mt-5 mb-3">관심지역 설정하기</h2>
		<div class="row col-md-12 justify-content-center mb-2">
			<div class="form-group col-md-2">
				<select class="form-select text-light" id="sido"
					style="background-color: rgb(79, 93, 247);">
					<option value="">시도선택</option>
				</select>
			</div>
			<div class="form-group col-md-2">
				<select class="form-select text-light" id="gugun"
					style="background-color: rgb(79, 93, 247);">
					<option value="">구군선택</option>
				</select>
			</div>
			<div class="form-group col-md-2">
				<select class="form-select text-light" id="dong"
					style="background-color: rgb(79, 93, 247);">
					<option value="">동선택</option>
				</select>
			</div>
			<div class="form-group btn">
				<button type="button" id="list-btn" class="btn btn-outline-primary">
					관심지역 추가하기</button>
			</div>

			<form id="searchHouseForm" action="${root }/rest/myarea">
				<input type="hidden" name="action" value="settingMyArea"> 
				<input type="hidden" id="fsido" name="sido">
				<input type="hidden" id="fgugun" name="gugun">
				<input type="hidden" id="fdong" name="dong">
			</form>
		</div>
		<div id="myareas">
			<table class="table table-hover" id="myarea-list">
			<thead>
				<th>시도</th><th>구군</th><th>동</th>
			</thead>

			</table>
		</div>
	
	
	<!-- 중앙 최상단 div end -->
	
	

	<!-- Script 시작 -->
	<script>
    
      ///////////////////////// select box 설정 (지역, 매매기간) ////////////////////////
      window.onload = function () {
        // 브라우저가 열리면 시도정보 얻기.
       sendRequest("sido", "*00000000");
      };
      
      
      ///////////////////////// 관심지역 /////////////////////////
      document.querySelector("#list-btn").addEventListener("click", function () {
    	  clickSearchBtn(1);
      });
      
      function clickSearchBtn(pgno){
          document.querySelector("#myarea-list").style.display = 'block';
          
          document.querySelector("#myarea-list").innerHTML = "";
  		
          let sidoSel = document.querySelector("#sido");
          let gugunSel = document.querySelector("#gugun");
          let dongSel = document.querySelector("#dong");

          let sido = sidoSel[sidoSel.selectedIndex].text.trim();
          let gugun = gugunSel[gugunSel.selectedIndex].text.trim();
          let dong = dongSel[dongSel.selectedIndex].text.trim();
          
          
          fetch(`${root}/rest/myarea`, {
          	method: "POST",
          	headers: {
        		"content-type" : "application/json;charset=utf-8"
          	},
          	body: JSON.stringify({
          		"memberId": "${loginUser.getId()}",
          		"sido":sido,
          		"gugun":gugun,
          		"dong":dong
          	})
          })
          .then((response) => response.json())
          .then((data) => {
        	  console.log(data);
        	  makeList(data);
          })	  
      }
      
      

      function makePaginator(pgCnt){
          const pgDiv = document.createElement("div");
          
          let pgCode = `        
          	<nav aria-label="Page navigation example">
              	<ul class="pagination">
              	<li class="page-item">
                		<a class="page-link" href="#" aria-label="Previous">
                  	<span aria-hidden="true">&laquo;</span>
                  	<span class="sr-only">Previous</span>
                		</a>
              	</li>
              `;
         
    	 let pgSize = Math.ceil(pgCnt/4);
         for(let idx=0; idx<pgSize; idx++){
      	   pgCode += `<li class="page-item"><a class="page-link" href="#" onclick=clickSearchBtn(\${idx+1})>\${idx+1}</a></li>`;
         }
         
         pgCode += `
              	<li class="page-item">
                		<a class="page-link" href="#" aria-label="Next">
                  	<span aria-hidden="true">&raquo;</span>
                  	<span class="sr-only">Next</span>
                		</a>
              	</li>
            		</ul>
           	</nav>
          	 `;
        
         pgDiv.innerHTML = pgCode;
		 //document.querySelector("#specific").appendChild(pgDiv);
         
      }
      
      
     
      function makeList(result) {
    	  console.log("11111")
    	  let table = document.querySelector("#myareas");
    	  table.innerHTML = "<tbody>";
    	
        result.forEach((area) => {

      	  table.innerHTML += "<tr><td>"+area.sido+"</td><td>"+area.gugun+"</td><td>"+area.dong+"</td></tr><br>";
        });
        
   	  table.innerHTML += "</tbody>";
      }
      
      
     
      
      // 시 군 동 설정하는 박스

      // 시도가 바뀌면 구군정보 얻기.
      document.querySelector("#sido").addEventListener("change", function () {
        if (this[this.selectedIndex].value) {
          let regcode = this[this.selectedIndex].value.substr(0, 2) + "*00000";
          sendRequest("gugun", regcode);
        } else {
          initOption("gugun");
          initOption("dong");
        }
      });

      // 구군이 바뀌면 동정보 얻기.
      document.querySelector("#gugun").addEventListener("change", function () {
        if (this[this.selectedIndex].value) {
          let regcode = this[this.selectedIndex].value.substr(0, 5) + "*";
          sendRequest("dong", regcode);
        } else {
          initOption("dong");
        }
      });

      function sendRequest(selid, regcode) {
        const url = "https://grpc-proxy-server-mkvo6j4wsq-du.a.run.app/v1/regcodes";
        let params = "regcode_pattern=" + regcode + "&is_ignore_zero=true";
        fetch(`\${url}?\${params}`)
          .then((response) => response.json())
          .then((data) => addOption(selid, data));
      }

      function addOption(selid, data) {
        let opt = ``;
        initOption(selid);
        switch (selid) {
          case "sido":
            opt += `<option value="">시도선택</option>`;
            data.regcodes.forEach(function (regcode) {
              opt += `
              <option value="\${regcode.code}">\${regcode.name}</option>
              `;
            });
            break;
          case "gugun":
            opt += `<option value="">구군선택</option>`;
            for (let i = 0; i < data.regcodes.length; i++) {
              if (i != data.regcodes.length - 1) {
                if (
                  data.regcodes[i].name.split(" ")[1] == data.regcodes[i + 1].name.split(" ")[1] &&
                  data.regcodes[i].name.split(" ").length !=
                    data.regcodes[i + 1].name.split(" ").length
                ) {
                  data.regcodes.splice(i, 1);
                  i--;
                }
              }
            }
            let name = "";
            data.regcodes.forEach(function (regcode) {
              if (regcode.name.split(" ").length == 2) name = regcode.name.split(" ")[1];
              else name = regcode.name.split(" ")[1] + " " + regcode.name.split(" ")[2];
              opt += `
              <option value="\${regcode.code}">\${name}</option>
              `;
            });
            break;
          case "dong":
            opt += `<option value="">동선택</option>`;
            let idx = 2;
            data.regcodes.forEach(function (regcode) {
              if (regcode.name.split(" ").length != 3) idx = 3;
              opt += `
              <option value="\${regcode.code}">\${regcode.name.split(" ")[idx]}</option>
              `;
            });
        }
        document.querySelector(`#\${selid}`).innerHTML = opt;
      }

      function initOption(selid) {
        let options = document.querySelector(`#\${selid}`);
        options.length = 0;
        let len = options.length;
        for (let i = len - 1; i >= 0; i--) {
          options.remove(i);
        }
      }

    </script>
	<!-- Script end -->
	<!-- 중앙 content end -->

	<!-- Footer-->
	<footer class="bg-black text-center py-5">
		<div class="container px-5">
			<div class="text-white-50 small">
				<div class="mb-2">&copy; Your Website 2022. All Rights
					Reserved.</div>
				<a href="#!">Privacy</a> <span class="mx-1">&middot;</span> <a
					href="#!">Terms</a> <span class="mx-1">&middot;</span> <a href="#!">FAQ</a>
			</div>
		</div>
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>
