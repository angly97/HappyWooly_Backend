<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>New Age - Start Bootstrap Theme</title>
<link rel="icon" type="image/x-icon" href="/assets/favicon.ico" />
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
<link href="/css/styles.css" rel="stylesheet" />
</head>
<body id="page-top">
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
					<li class="nav-item"><a class="nav-link me-lg-3" href="#free">자유글</a></li>
					<li class="nav-item"><a class="nav-link me-lg-3"
						href="#explore">주변탐방</a></li>
					<c:if test="${not empty loginUser }">
						<li class="nav-item"><a class="nav-link me-lg-3"
							href="/myarea">관심지역 설정</a></li>
						<li class="nav-item"><a class="nav-link me-lg-3" href="#">관심지역
								둘러보기</a></li>
					</c:if>
					<li class="nav-item"><a class="nav-link me-lg-3" href="http://localhost:8080">QnA</a></li>
				</ul>

				<c:if test="${empty loginUser }">
					<div>
						<!--회원가입 버튼-->
						<button id="signUp"
							class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0"
							data-bs-toggle="modal" data-bs-target="#signUpModal">
							<span class="d-flex align-items-center"> <i
								class="bi-chat-text-fill me-2"></i> <span class="small">Sign
									Up</span>
							</span>
						</button>
						<!--로그인 버튼-->
						<button id="login"
							class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0"
							data-bs-toggle="modal" data-bs-target="#feedbackModal">
							<span class="d-flex align-items-center"> <i
								class="bi-chat-text-fill me-2"></i> <span class="small">Login</span>
							</span>
						</button>
					</div>
				</c:if>


				<c:if test="${not empty loginUser }">
					<div style="display: flex">
						<!--회원정보 확인 버튼-->
						<button id="MyInfo"
							class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0"
							data-bs-toggle="modal" data-bs-target="#MyInfoModal">
							<span class="d-flex align-items-center"> <i
								class="bi-chat-text-fill me-2"></i> <span class="small">MyInfo</span>
							</span>
						</button>

						<!--로그아웃 버튼-->
						<form action="${root }/member/logout">
							<button type="submit" id="logout"
								class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0">
								<span class="d-flex align-items-center"> <i
									class="bi-chat-text-fill me-2"></i> <span class="small">Logout</span>
								</span>
							</button>
						</form>
					</div>
				</c:if>
			</div>

		</div>
		</div>
	</nav>


	<!-- Sign Up Modal-->
	<div class="modal fade" id="signUpModal" tabindex="-1"
		aria-labelledby="feedbackModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bg-gradient-primary-to-secondary p-4">
					<h5 class="modal-title font-alt text-white" id="feedbackModalLabel">SignUp</h5>
					<button class="btn-close btn-close-white" type="button"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body border-0 p-4">
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form id="contactForm" data-sb-form-api-token="API_TOKEN"
						action="${root }/member/signup" method="POST">
						<!-- id input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="signup-id" name="id" type="text"
								placeholder="Enter your id..." data-sb-validations="required" />
							<label for="id">ID</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">ID
								is required.</div>
						</div>
						<!-- pw input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="signup-pw" name="pw"
								type="password" placeholder="password"
								data-sb-validations="required,pw" /> <label for="password">Password</label>
							<div class="invalid-feedback"
								data-sb-feedback="password:required">Password is required.
							</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">
								Password is not valid.</div>
						</div>
						<!-- name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="signup-name" name="name"
								type="text" placeholder="Enter your name..."
								data-sb-validations="required" /> <label for="name">Name</label>
							<div class="invalid-feedback" data-sb-feedback="name:required">
								A name is required.</div>
						</div>

						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<!-- Submit Button-->
						<div class="d-grid">
							<button class="btn btn-primary rounded-pill btn-lg"
								id="registButton" type="submit" onclick="regist()">
								Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Login Modal-->
	<div class="modal fade" id="feedbackModal" tabindex="-1"
		aria-labelledby="feedbackModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bg-gradient-primary-to-secondary p-4">
					<h5 class="modal-title font-alt text-white" id="feedbackModalLabel">Login</h5>
					<button class="btn-close btn-close-white" type="button"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body border-0 p-4">
					<form id="contactForm" data-sb-form-api-token="API_TOKEN"
						action="${root }/member/login"  method="POST">
						<!-- id input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="id" name="id" type="text"
								placeholder="Enter your id..." data-sb-validations="required" />
							<label for="id">ID</label>
							<div class="invalid-feedback" data-sb-feedback="id:required">ID
								is required.</div>
						</div>
						<!-- pw address input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="pw" name="pw" type="password"
								placeholder="password" data-sb-validations="required,pw" /> <label
								for="password">Password</label>
							<div class="invalid-feedback"
								data-sb-feedback="password:required">Password is required.
							</div>
							<div class="invalid-feedback" data-sb-feedback="email:email">
								Password is not valid.</div>
						</div>

						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<!-- Submit Button-->
						<div class="d-grid">
							<button class="btn btn-primary rounded-pill btn-lg"
								id="login-btn" type="submit" onclick="login()">Login</button>
						</div>
					</form>
					<!--비번 찾기 버튼-->
					<div>
						<button id="pwFindButton">비밀번호 찾기</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- MyInfo Modal-->
	<div class="modal fade" id="MyInfoModal" tabindex="-1"
		aria-labelledby="MyInfoModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bg-gradient-primary-to-secondary p-4">
					<h5 class="modal-title font-alt text-white" id="MyInfoModalLabel">MyInfo</h5>
					<button class="btn-close btn-close-white" type="button"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body border-0 p-4">
					<!-- * * * * * * * * * * * * * * *-->
					<!-- * * SB Forms Contact Form * *-->
					<!-- * * * * * * * * * * * * * * *-->
					<!-- This form is pre-integrated with SB Forms.-->
					<!-- To make this form functional, sign up at-->
					<!-- https://startbootstrap.com/solution/contact-forms-->
					<!-- to get an API token!-->
					<form id="updateForm" data-sb-form-api-token="API_TOKEN"
						action="${root }/member" method="POST">
						<!-- id input-->
						
						<div class="form-floating mb-3">
							<input class="form-control" id="MyInfoid" name="id" type="text"
								placeholder="Enter your id..." data-sb-validations="required"
								value="${loginUser.getId() }" readonly /> <label for="id">ID</label>

						</div>
						<!-- pw input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="MyInfopw" name="pw"
								type="password" value="${loginUser.getPw() }"
								placeholder="password" data-sb-validations="required,pw" /> <label
								for="password">Password</label>

						</div>
						<!-- name input-->
						<div class="form-floating mb-3">
							<input class="form-control" id="MyInfoname" name="name"
								type="text" placeholder="Enter your name..."
								data-sb-validations="required" value="${loginUser.getName() }" />
							<label for="name">Full name</label>

						</div>

						<!-- Submit success message-->
						<!---->
						<!-- This is what your users will see when the form-->
						<!-- has successfully submitted-->
						<div class="d-none" id="submitSuccessMessage">
							<div class="text-center mb-3">
								<div class="fw-bolder">Form submission successful!</div>
								To activate this form, sign up at <br /> <a
									href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
							</div>
						</div>
						<!-- Submit error message-->
						<!---->
						<!-- This is what your users will see when there is-->
						<!-- an error submitting the form-->
						<div class="d-none" id="submitErrorMessage">
							<div class="text-center text-danger mb-3">Error sending
								message!</div>
						</div>
						<!-- Submit Button-->
						<div class="btns">
							<button class="btn btn-primary rounded-pill btn-lg"
								id="modifyButton" type="button" style="width: 40%">수정</button>
							<button class="btn btn-primary rounded-pill btn-lg"
								id="leaveButton" type="button" style="width: 40%">탈퇴</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<script>
		let msg = "${msg}";

		if (msg != "")
			alert(msg);
		
		document.querySelector("#modifyButton").addEventListener("click", e => {
			document.querySelector("#updateForm").submit();
		})
		
		document.querySelector("#leaveButton").addEventListener("click", e => {
			let form = document.querySelector("#updateForm");
			
			form.setAttribute("action", "${root }/member/${loginUser.getId()}");
			
			form.submit();
		})
		
	</script>