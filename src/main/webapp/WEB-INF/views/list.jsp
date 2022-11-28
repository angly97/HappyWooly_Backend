<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- jstl 사용하기 위한 코드 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 프로젝트의 context 경로를 편하게 사용하기 위한 코드 --%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<!-- 중앙 content start -->
	<!-- 중앙 최상단 div start -->
	<div class="container">
		<div style="height: 70px"></div>
		<h2 class="text-center mt-5 mb-3">아파트 매매 정보</h2>
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

			<div class="form-group col-md-2">
				<select class="form-select bg-dark text-light" id="year"></select>
			</div>
			<div class="form-group col-md-2">
				<select class="form-select bg-dark text-light" id="month">
					<option value="">매매월선택</option>
				</select>
			</div>
			<div class="form-group btn">
				<button type="button" id="list-btn" class="btn btn-outline-primary">
					아파트 매매정보 가져오기</button>
			</div>
		</div>

		<form id="searchHouseForm" action="${root }/main">
			<input type="hidden" name="action" value="searchHouse"> <input
				type="hidden" id="fsido" name="fsido"> <input type="hidden"
				id="fgugun" name="fgugun"> <input type="hidden" id="fdong"
				name="fdong"> <input type="hidden" id="fyear" name="fyear">
			<input type="hidden" id="fmonth" name="fmonth">
		</form>


	</div>
	<!-- 중앙 최상단 div end -->

	<!-- 지도 띄울 영역 -->
	<span id="span">
		<div id="map" style="width: 50%; height: 600px"></div>
		<div id="specific"
			style="width: 300px height: 100px;">
		</div>
	</span>
	
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9a4f59a3ef4296f594a75e632ce6dc1d&libraries=services"></script>

	<!-- Script 시작 -->

	<script>
    
      ///////////////////////// select box 설정 (지역, 매매기간) /////////////////////////
      let container = document.getElementById("map"); //  지도를 담을 영역의 DOM 레퍼런스
      let mapOption = {
        center: new kakao.maps.LatLng(37.501537, 127.039638), //  지도의 중심좌표
        level: 3, //  지도의 확대 레벨
      };

      let date = new Date();

      let map = new kakao.maps.Map(container, mapOption); //  지도 생성
      
      window.onload = function () {
        let yearEl = document.querySelector("#year");
        let yearOpt = `<option value="">매매년도선택</option>`;
        let year = date.getFullYear();
        for (let i = year; i > year - 20; i--) {
          yearOpt += `<option value="\${i}">\${i}년</option>`;
        }
        yearEl.innerHTML = yearOpt;

        // 브라우저가 열리면 시도정보 얻기.
       sendRequest("sido", "*00000000");
      };
      
     	
      document.querySelector("#year").addEventListener("change", function () {
        let month = date.getMonth() + 1;
        let monthEl = document.querySelector("#month");
        let monthOpt = `<option value="">매매월선택</option>`;
        let yearSel = document.querySelector("#year");
        let m = yearSel[yearSel.selectedIndex].value == date.getFullYear() ? month : 13;
        for (let i = 1; i < m; i++) {
          monthOpt += `<option value="\${i < 10 ? "0" + i : i}">\${i}월</option>`;
        }
        monthEl.innerHTML = monthOpt;
      });

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

      ///////////////////////// 아파트 매매 정보 /////////////////////////
      document.querySelector("#list-btn").addEventListener("click", function () {
    	  clickSearchBtn(1);
      });
      
      function clickSearchBtn(pgno){
          document.querySelector("#specific").style.display = 'block';
          
          map = new kakao.maps.Map(container, mapOption); //  지도 생성
          document.querySelector("#specific").innerHTML = "";
  		
          let sidoSel = document.querySelector("#sido");
          let gugunSel = document.querySelector("#gugun");
          let dongSel = document.querySelector("#dong");

          let sido = sidoSel[sidoSel.selectedIndex].text.trim();
          let gugun = gugunSel[gugunSel.selectedIndex].text.trim();
          let dong = dongSel[dongSel.selectedIndex].text.trim();
          
          let yearSel = document.querySelector("#year");
          let year = yearSel[yearSel.selectedIndex].value;
          let monthSel = document.querySelector("#month");
          let month = monthSel[monthSel.selectedIndex].value;
          
          document.querySelector("#fsido").value = sido;
          document.querySelector("#fgugun").value = gugun;
          document.querySelector("#fdong").value = dong;
          document.querySelector("#fyear").value = year;
          document.querySelector("#fmonth").value = month;
          
          
          fetch(`${root}/rest/apt?&sido=\${sido}&gugun=\${gugun}&dong=\${dong}&year=\${year}&month=\${month}`, {
          	method: "GET",
          	headers: {
        		"content-type" : "application/json;charset=utf-8"
          	}
          })
          .then((response) => response.json())
          .then((data) => {
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
		 document.querySelector("#specific").appendChild(pgDiv);
         
      }
      
      
      function makeList(result) {
        document.querySelector("#specific").innerHTML = "";
    	console.log(result);
        result.forEach((apt) => {

			let name = apt.aptName;	
            var coords = new kakao.maps.LatLng(apt.lat, apt.lng);
            
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
              map: map,
              position: coords,
              clickable: true,
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
              content:
                '<div style="width:150px;text-align:center;padding:6px 0;">' + apt.aptName + "</div>",
            });

            kakao.maps.event.addListener(marker, "mouseover", function () {
              //  마커 위에 인포윈도우를 표시합니다.
              infowindow.open(map, marker);
            });

            kakao.maps.event.addListener(marker, "mouseout", function () {
              //  마커 위에 인포윈도우를 표시합니다.
              infowindow.close(map, marker);
            });


            let price = apt.dealAmount.trim() + "만원";
            let area = apt.area;
			let buildYear = apt.buildYear;
			let tradeDate = apt.dealYear + "." + apt.dealMonth + "." + apt.dealDay;
			
			const div0 = document.createElement("div");
			const div1 = document.createElement("div");
			div1.className = 'nameClass';
			div1.innerHTML = "이름 : " + name;
			div1.addEventListener("click", ()=>{
	              makeSameAptList(result, price, name)
	            });

			
			const div2 = document.createElement("div");
			div2.innerHTML = "거래가격 : " + price;
			
			const div3 = document.createElement("div");
			div3.innerHTML = "전용면적 : " + area;
			
			const div4 = document.createElement("div");
			div4.innerHTML = "건축년도 : " + buildYear;
			
			const div5 = document.createElement("div");
			div5.innerHTML = "거래일 : " + tradeDate;
			
			const div6 = document.createElement("div");
			div6.innerHTML = "-----------------------------------------------";
			
			
			div0.appendChild(div1);
			div0.appendChild(div2);
			div0.appendChild(div3);
			div0.appendChild(div4);
			div0.appendChild(div5);
			div0.appendChild(div6);

			document.querySelector("#specific").appendChild(div0);

			
            kakao.maps.event.addListener(marker, "click", function () {
              document.querySelector("#specific").innerHTML = "";
              
              let pos = marker.getPosition();
              map.panTo(pos);

              const div0 = document.createElement("div");
              const div1 = document.createElement("div");
              div1.className = 'nameClass';
              div1.innerHTML = "이름 : " + name;
              const div2 = document.createElement("div");
              div2.innerHTML = "거래가격 : " + price;
              const div3 = document.createElement("div");
              div3.innerHTML = "전용면적 : " + area;
              const div4 = document.createElement("div");
              div4.innerHTML = "건축년도 : " + buildYear;
              const div5 = document.createElement("div");
              div5.innerHTML = "거래일 : " + tradeDate;

              div0.appendChild(div1);
              div0.appendChild(div2);
              div0.appendChild(div3);
              div0.appendChild(div4);
              div0.appendChild(div5);
              

              document.querySelector("#specific").appendChild(div0);
            });

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        });
      }
      

      function makeSameAptList(result, dongSel, aptName) {
        document.querySelector("#specific").innerHTML = "";

        result.forEach((apt) => {
			
        	if(apt.aptName == aptName) {
        	
        		let name = apt.aptName;	
            	var coords = new kakao.maps.LatLng(apt.lat, apt.lng);
               
               // 결과값으로 받은 위치를 마커로 표시합니다
               var marker = new kakao.maps.Marker({
                 map: map,
                 position: coords,
                 clickable: true,
               });

               // 인포윈도우로 장소에 대한 설명을 표시합니다
               var infowindow = new kakao.maps.InfoWindow({
                 content:
                   '<div style="width:150px;text-align:center;padding:6px 0;">' + apt.aptName + "</div>",
               });

               kakao.maps.event.addListener(marker, "mouseover", function () {
                 //  마커 위에 인포윈도우를 표시합니다.
                 infowindow.open(map, marker);
               });

               kakao.maps.event.addListener(marker, "mouseout", function () {
                 //  마커 위에 인포윈도우를 표시합니다.
                 infowindow.close(map, marker);
               });


               	let price = apt.dealAmount.trim() + "만원";
               	let area = apt.area;
   			   	let buildYear = apt.buildYear;
   				let tradeDate = apt.dealYear + "." + apt.dealMonth + "." + apt.dealDay;
   			
   				const div0 = document.createElement("div");
   				const div1 = document.createElement("div");
   				div1.className = 'nameClass';
	   			div1.innerHTML = "이름 : " + name;
	
	   			
	   			const div2 = document.createElement("div");
	   			div2.innerHTML = "거래가격 : " + price;
	   			
	   			const div3 = document.createElement("div");
	   			div3.innerHTML = "전용면적 : " + area;
	   			
	   			const div4 = document.createElement("div");
	   			div4.innerHTML = "건축년도 : " + buildYear;
	   			
	   			const div5 = document.createElement("div");
	   			div5.innerHTML = "거래일 : " + tradeDate;
	   			
	   			const div6 = document.createElement("div");
	   			div6.innerHTML = "-----------------------------------------------";
	   			
	   			div0.appendChild(div1);
	   			div0.appendChild(div2);
	   			div0.appendChild(div3);
	   			div0.appendChild(div4);
	   			div0.appendChild(div5);
	   			div0.appendChild(div6);
	
	   			document.querySelector("#specific").appendChild(div0);
		
	
	            kakao.maps.event.addListener(marker, "click", function () {
	              document.querySelector("#specific").innerHTML = "";
	              
	              let pos = marker.getPosition();
	              map.panTo(pos);
	
	              const div0 = document.createElement("div");
	              const div1 = document.createElement("div");
	              div1.className = 'nameClass';
	              div1.innerHTML = "이름 : " + name;
	              const div2 = document.createElement("div");
	              div2.innerHTML = "거래가격 : " + price;
	              const div3 = document.createElement("div");
	              div3.innerHTML = "전용면적 : " + area;
	              const div4 = document.createElement("div");
	              div4.innerHTML = "건축년도 : " + buildYear;
	              const div5 = document.createElement("div");
	              div5.innerHTML = "거래일 : " + tradeDate;
	
	              div0.appendChild(div1);
	              div0.appendChild(div2);
	              div0.appendChild(div3);
	              div0.appendChild(div4);
	              div0.appendChild(div5);
	
	              document.querySelector("#specific").appendChild(div0);
	            });

               	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
              	map.setCenter(coords);
        	}
       	});
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
