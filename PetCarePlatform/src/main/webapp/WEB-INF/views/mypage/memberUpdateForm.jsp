<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
	#my_section {
		margin-top: -70px;
		padding-bottom: 25px;
	}

	#main-form h3,
	input {
		display: inline-block;
	}

	.form-control {
		padding: 5px;
		width: 250px;
		display: inline-block;
		border-radius: 20px;
	}

	#successUpdate {
		color: #fff;
		background: #0062ff;
		border: 1px solid transparent;
	}

	#successUpdate:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}

	#cancel {
		width: 113px;
		height: 42px;
		padding: 0 30px;
		font-size: .8em;
		text-align: center;
		font-weight: 500;
	}

	input:focus,
	textarea:focus {
		border: 3px solid;
	}

	.no_deco {
		text-decoration: none !important;
		font-size: 0.8rem !important;
		color: black;
	}

	.blog_right_sidebar {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		float: none !important;
		margin: 0 auto !important;
		background-color: white;
		width: 250px;
	}

	.partner_img {
		object-fit: cover;
		object-position: top;
		border-radius: 50%;
		width: 180px !important;
		height: 180px !important;
		float: none;
		margin: 0 auto;
	}

	#Mainname {
		font-size: 1.5rem !important;
		/* font-family: 'NanumBarunGothic' !important; */
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#myinfo {
		font-size: 0.8rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 300;
	}

	#menu_bold {
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 700;
		color: black;
	}

	.card {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		padding: 20px;
	}
	.card-header{
		background: white;
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 400;
		color: black;
		width: 797px;
		margin: -17px 0 20px -20px;
		padding-left: 15px;
	}
	.control-width {
		width: 160px;
		display: inline-block;
	}
	i{
		color: black;
	}
</style>

<body>
	<script>
		//?????? ?????? ?????? ?????????
		var empJ = /\s/g;
		//????????? ?????????
		var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
		// ???????????? ?????????
		var pwJ = /^[A-Za-z0-9]{4,12}$/;
		// ?????? ?????????
		var nameJ = /* /^[???-???]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/; */ RegExp(/^[???-???]{2,4}$/);
		// ????????? ?????? ?????????
		var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		// ????????? ?????? ?????????
		var phoneJ = /^01([016789])([0-9]{3,4})([0-9]{4})$/;
		// ????????? ???????????????
		var emailJ = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		var birthJ = false;
		var address = $('#mem_detailaddress');

		$(document).ready(function () {
			/* ????????? ???????????? */
			$('form').on('submit', function () {
				var inval_Arr = new Array(6).fill(false);
				if ($('#idCheck').val() === 'NO') {
					alert("????????? ??????????????? ????????????.");
					inval_Arr[0] = false;
					return false;
				} else if ($('#idCheck').val() === 'YES') {
					inval_Arr[0] = true;
				}
				if ($("#password").val() != $("#password1").val()) {
					alert("??????????????? ???????????? ????????????.");
					$("#password").val('');
					$("#password1").val('');
					$("#password").focus();
					inval_Arr[1] = false;
					return false;
				} else {
					inval_Arr[1] = true;
				}

				// ?????? ?????????
				if (nameJ.test($('#name').val())) {
					inval_Arr[2] = true;
				} else {
					inval_Arr[2] = false;
					alert('????????? ???????????????.');
					return false;
				}


				// ??????????????? ?????????
				if (phoneJ.test($('#tel').val())) {
					console.log(phoneJ.test($('#tel').val()));
					inval_Arr[3] = true;
				} else {
					inval_Arr[3] = false;
					alert('????????? ????????? ???????????????.');
					return false;
				}
				//????????? ???????????????
				if (emailJ.test($('#m_id').val())) {
					inval_Arr[4] = true;
				} else {
					inval_Arr[4] = false;
					alert('???????????? ???????????????.');
					return false;
				}
				return true;
			});

			$('#password').blur(function () {
				if (pwJ.test($('#password').val())) {
					console.log('true');
					$('#pw_check').text('');
				} else {
					console.log('false');
					$('#pw_check').text('4~12?????? ?????? , ???????????? ?????? ???????????????.');
					$('#pw_check').css('color', 'red');
				}
			});

			//1~2 ???????????? ?????? ??????
			$('#password1').blur(function () {
				if ($('#password').val() != $(this).val()) {
					$('#pw1_check').text('??????????????? ???????????? ????????????.');
					$('#pw1_check').css('color', 'red');
				} else {
					$('#pw1_check').text('');
				}
			});

			//????????? ???????????? ???????????? ????????? ??????
			$("#name").blur(function () {
				if (nameJ.test($(this).val())) {
					console.log(nameJ.test($(this).val()));
					$("#name_check").text('');
				} else {
					$('#name_check').text('?????? 2~4??? ????????? ???????????????. (????????????, ?????? ?????? ??????)');
					$('#name_check').css('color', 'red');
				}
			});

			//????????? ???????????????
			$("#m_id").blur(function () {
				if (emailJ.test($(this).val())) {
					console.log(emailJ.test($(this).val()));
					$("#m_id_check").text('');
				} else {
					$('#m_id_check').text('????????????????????? ???????????????.');
					$('#m_id_check').css('color', 'red');
				}
			});


			// ????????????
			$('#tel').blur(function () {
				if (phoneJ.test($(this).val())) {
					console.log(phoneJ.test($(this).val()));
					$("#tel_check").text('');
				} else {
					$('#tel_check').text('?????????????????? ?????????????????? ');
					$('#tel_check').css('color', 'red');
				}
			});

		});
	</script>

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
					<div class="blog_right_sidebar" id="main-side">
						<aside class="single_sidebar_widget author_widget">
							<img class="partner_img" src="/upload/${member.pfile}"
								onerror="this.src='resources/upload/cat.jpg'" alt=""> <br>
							<br>
							<h4 id="Mainname">${member.name }???</h4>
							<div class="br"></div>
							<div id="myinfo">
								<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="mconfirmPass">??? ??????
									????????????</a>
							</div>
						</aside>
					</div>
					<br>
					<div class="blog_right_sidebar" id="main-side1">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">My menu</h4>
							<ul class="list cat-list">
								<p id="menu_bold">??? ?????? ??????</p>
								<li><a href="protocol" class="d-flex justify-content-between no_deco">
										<p>???????????? ????????????</p>
									</a></li>
								<li><a href="reservationSelect" class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
									</a></li>
								<li><a href="myPay" class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
									</a></li>
								<li><a href="mycounsel" class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
									</a></li>
								<li><a href="myreport" class="d-flex justify-content-between no_deco">
										<p>?????? ??????</p>
									</a></li>
								<li><a href="myfallow" class="d-flex justify-content-between no_deco">
										<p>?????????</p>
									</a></li>
								<br>
								<br>
								<p id="menu_bold">?????? ?????? ??????</p>
								<li><a href="mconfirmPass" class="d-flex justify-content-between no_deco">
										<p>?????? ?????? ??????</p>
									</a></li>
								<li><a href="logout" class="d-flex justify-content-between no_deco">
										<p>????????????</p>
									</a></li>
								<li><a href="mdeleteForm" class="d-flex justify-content-between no_deco">
										<p>????????????</p>
									</a></li>
							</ul>
						</aside>
					</div>
				</div>

				<div class="col-lg-9 posts-list" style="margin-top: 72px;">
					<form action="memberUpdate" enctype="multipart/form-data" method="post">
						<div id="main-form" style="width: 800px;">
							<div class="card">
							<div class="card-header">
								<i class="fa-solid fa-bell"></i>&nbsp;&nbsp;???????????????
							</div>
								<div class="form-group">
									<div class="control-width"><i class="fas fa-user"></i>
										<h3 style="font-weight: bolder;">???&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;???</h3>
									</div>
									<input type="text" id="name" name="name" class="form-control" value="${member.name}"required>
									<div id="name_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fas fa-id-card"></i>
										<h3 style="font-weight: bolder;">?????????</h3>
									</div>
									<input type="email" style="border: none" id="m_id" name="m_id" class="form-control"
										value="${member.m_id}" readonly>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa fa-unlock-alt"></i>
										<h3 style="font-weight: bolder;">????????????</h3>
									</div>
									<input type="password" id="password" name="password" class="form-control"
										placeholder="4~12?????? ?????? , ???????????? ?????? ???????????????." style="width: 350px;">
									<div id="pw_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa fa-unlock-alt"></i>
										<h3 style="font-weight: bolder;">???????????? ?????????</h3>
									</div>
									<input type="password" id="password1" name="password1" class="form-control" required
										style="width: 350px;">
									<div id="pw1_check"></div>
								</div>
								<div class="form-group">
									<div class="control-width"><i class="fa-solid fa-mobile-screen"></i>
										<h3 style="font-weight: bolder;">????????????</h3>
									</div>
									<input type="tel" id="tel" name="tel" class="form-control" value="${member.tel}"
										placeholder="('-'?????? ????????? ??????????????????)" maxlength="13">
									<div id="tel_check"></div>
								</div>
								<div class="form-group">
									<i class="far fa-id-badge"></i>
									<h3 style="font-weight: bolder;">????????? ??????</h3>
									<div class="input-group col-xs-12">
										<input class="file-upload-browse btn btn-primary" type="file" id="file"name="file">
									</div>
								</div>

								<div align="right">
									<button type="submit" id="successUpdate" class="genric-btn info radius">????????????</button>
									<button type="button" id="cancel" class="btn btn-secondary btn-lg"
										onclick="location.href='mainMypage'">??????</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<script>
		function addFile() {
			var input = $('<input>').attr({
				'name': 'multiFileList',
				'type': 'file'
			});

			$('#ffile').append(input);
		}
	</script>
</body>

</html>