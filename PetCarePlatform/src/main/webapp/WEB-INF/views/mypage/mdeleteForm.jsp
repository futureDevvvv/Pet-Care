<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
		.no_deco {
		text-decoration: none !important;
		font-size : 0.8rem !important;
		color: black;
	}
	#my_section {
		margin-top: -70px;
    	padding-bottom: 25px;
	}

	.blog_right_sidebar{
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.1)!important;
		border: 1px solid #e3e6f0;
    	border-radius: 0.35rem;
    	float: none !important; margin: 0 auto !important;
    	background-color: white;
    	width: 250px;
	}

	.partner_img{
		object-fit: cover;
		object-position:top;
		border-radius:50%;
		width: 180px !important;
		height: 180px !important;
		float: none;
		margin: 0 auto;
	}


	.widget_title{
		background: #0062ff !important;
	}


	#myinfo{
		font-size: 0.8rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
 		font-weight: 300;
	}


	#Mainname{
		font-size: 1.5rem !important;
		/* font-family: 'NanumBarunGothic'!important; */
		font-style: normal !important;
 		font-weight: 700 !important;
 		color:gray;
	}

	#menu_bold{
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
 		font-weight: 700;
 		color: black;
	}
	.swal2-content {
		display: none;
	}

	#password {
		height: 70px;
		width: 250px;
		padding: 0px;
		font-size: 24px;
		margin-left: -3px;
	}

	#confirm1,
	#confirm2 {
		width: 145px;
		height: 60px;
		margin: 10px;
		font-size: 30px;
	}

	#logreg-forms {
		width: 500px;
		height: 350px;
		background: #fff;
		box-shadow: 0 3px 6px 0px rgba(0, 0, 0, 0.16), 0 3px 6px 0px rgba(0, 0, 0, 0.23);
	}

	.head {
		color: #fff;
		font-size: 34px;
		font-weight: bold;
		height: 100px;
		padding: 30px 0;
		text-align: center;
		text-transform: uppercase;
		background: #0062ff;
	}
</style>

<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br>
					<br>
					<br>
					<h2></h2>
				</div>
			</div>
		</div>
	</section>
	<section id="my_section">
		<div class="container" style="max-width: 1350px;">
			<div class="row">
				<div class="col-lg-3">
					<h2 align="center">MyPage</h2>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="/upload/${member.pfile}"
								onerror="this.src='resources/upload/cat.jpg'" alt=""> <br>
							<br>
							<h4 id="Mainname">${member.name }???</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco"
									href="mconfirmPass">??? ?????? ????????????</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<p id="menu_bold">??? ?????? ??????</p>
								<li><a href="protocol"
									class="d-flex justify-content-between no_deco">
										<p>???????????? ????????????</p>
								</a></li>
								<li><a href="reservationSelect"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="myPay"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="mycounsel"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="myreport"
									class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
								</a></li>
								<li><a href="myfallow"
									class="d-flex justify-content-between no_deco">
										<p>?????????</p>
								</a></li>
								<br>
								<br>
								<p id="menu_bold">?????? ?????? ??????</p>
								<li><a href="mconfirmPass"
									class="d-flex justify-content-between no_deco">
										<p>?????? ?????? ??????</p>
								</a></li>
								<li><a href="logout"
									class="d-flex justify-content-between no_deco">
										<p>????????????</p>
								</a></li>
								<li><a href="mdeleteForm"
									class="d-flex justify-content-between no_deco">
										<p>????????????</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>
				<div class="col-lg-9 posts-list" style="margin-top: 15em;">
					<div class="col-lg-12 col-md-12 blog_details" style="margin-left: 10em;">
						<div id="logreg-forms">
							<div class="form-group">
								<div class="head">???????????? ??????</div>
								<div class="input-group-prepend" style="margin:55px 0 0 6em;">
									<span class="input-group-text bg-white px-4 border-md border-right-0" style="height: 70px;">
										<i class="fa fa-lock text-muted"></i>
									</span>
									<input type="hidden" id="m_id" name="m_id" value="${member.m_id }">
									<input type="password" id="password" name="password" value=""
										class="form-control bg-white border-left-0 border-md">
								</div>
								<button type="button" id="confirm1" class="btn btn-primary"
									onclick="confirmPass()" style="margin:0 -5px 0 100px;">????????????</button>
								<button type="button" id="confirm2" class="btn btn-primary"
									onclick="location.href='mainMypage'">??????</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<script type="text/javascript">
		function confirmPass() {
			var m_id = document.getElementById('m_id').value;
			var password = document.getElementById('password').value;
			$.ajax({
				method: 'POST',
				url: 'mconfirmPasscheck',
				data: {
					'm_id': m_id,
					'password': password
				},
				success: function (data) {
					if (data == 1) {
						location.href = 'mdelete'
					} else {
						Swal.fire('???????????????<br>?????? ??????????????????.');
					}
				},
				error: function () {}

			});
		}
	</script>
	<script>
		$(function () {
			$('input, select').on('focus', function () {
				$(this).parent().find('.input-group-text').css('border-color', '#80bdff');
			});
			$('input, select').on('blur', function () {
				$(this).parent().find('.input-group-text').css('border-color', '#ced4da');
			});
		});
	</script>
</body>

</html>