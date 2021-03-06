<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>

<style>
	#my_section {
		margin-top: -70px;
    	padding-bottom: 25px;
	}

	#leftBubble:after {
		content: '';
		position: absolute;
		left: 0;
		top: 50%;
		width: 0;
		height: 0;
		border: 32px solid transparent;
		border-right-color: #d1d1d1;
		border-left: 0;
		border-top: 0;
		margin-top: -16px;
		margin-left: -32px;
	}

	.radioImg {
		width: 80px;
		height: 80px;
		border-radius: 70%;
		overflow: hidden;
	}

	#msgSubmit {
		color: #fff;
		background: #0062ff;
		border: 1px solid transparent;
		margin-left: 10px;
		width: 175px;
		font-size: 20px;
	}

	#msgSubmit:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}

	#terminate {
		float: right;
		margin: 10px 37px 0 0;
		width: 175px;
		height: 50px;
		font-size: 20px;
	}

/* 
	ul {
		padding: 16px 0;
		list-style: none;
	} */


	#csimg {
		width: 80px;
		height: 80px;
		object-fit: cover;
		border-radius: 70%;
		overflow: hidden;
		border: 2px solid rgb(46, 46, 46);
		margin-right: 5px;
	}

	#CounselMsg {
		width: 800px;
		height: 300px;
		border-radius: 10px;
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

	#myinfo {
		font-size: 0.8rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 300;
	}

	#Mainname {
		font-size: 1.5rem !important;
		/* font-family: 'NanumBarunGothic' !important; */
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#menu_bold {
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 700;
		color: black;
	}
</style>

<body>
	<section class="department-area" style="padding: 30px 0 30px;">
		<div class="container">
			<div class="col-lg-6 offset-lg-3">
				<div class="section-top text-center">
					<br><br><br>
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
					<c:if test="${mId ne null }">
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget author_widget">
								<img class="partner_img" src="resources/upload/${mInfo.pfile}"
									onerror="this.src='resources/upload/cat.jpg'" style="width: 210px; height: 167px;">
								<br><br>
								<h4 id="Mainname">${mInfo.name }???</h4>
								<div class="br"></div>
								<div id="myinfo">
									<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="mconfirmPass">??? ??????????????????</a>
								</div>
							</aside>
						</div>
						<br>
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget post_category_widget">
								<h4 class="widget_title">My menu</h4>
								<ul class="list cat-list nanumbarungothic">
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
									<br><br>
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
					</c:if>
					<c:if test="${pId ne null }">
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget author_widget">
								<img class="partner_img" src="resources/upload/${pInfo.pfile}"
									onerror="this.src='resources/upload/pet.PNG'" style="width: 210px; height: 167px;">
								<br><br>
								<h4 id="Mainname">${pInfo.name }???</h4>
								<div class="br"></div>
								<div id="myinfo">
									<i class="fa-solid fa-pen"></i>&nbsp;<a class="no_deco" href="confirmPass">??? ??????????????????</a>
								</div>
							</aside>
						</div><br>
						<div class="blog_right_sidebar">
							<aside class="single_sidebar_widget post_category_widget">
								<h4 class="widget_title">My menu</h4>
								<ul class="list cat-list nanumbarungothic">
									<p id="menu_bold">??? ?????? ??????</p>
									<li><a href="reservationSetting" class="d-flex justify-content-between">
											<p>???????????? ??????</p>
										</a></li>
									<li><a href="preservationSelect" class="d-flex justify-content-between">
											<p>?????? ??????</p>
										</a></li>
									<li><a href="pMemDiaList" class="d-flex justify-content-between">
											<p>?????? ??????</p>
										</a></li>
									<li><a href="pMembenefit" class="d-flex justify-content-between">
											<p>?????? ??????</p>
										</a></li>
									<li><a href="pmemcounsel" class="d-flex justify-content-between">
											<p>?????? ??????</p>
										</a></li>
									<li><a href="pmemreport" class="d-flex justify-content-between">
											<p>?????? ??????</p>
										</a></li>
									<br><br>
									<p id="menu_bold">?????? ?????? ??????</p>
									<li><a href="confirmPass" class="d-flex justify-content-between no_deco">
											<p>?????? ?????? ??????</p>
										</a></li>
									<li><a href="logout" class="d-flex justify-content-between">
											<p>????????????</p>
										</a></li>
									<li><a href="pmdeleteForm" class="d-flex justify-content-between">
											<p>????????????</p>
										</a></li>
								</ul>
							</aside>
						</div>
					</c:if>
				</div>
				<div class="col-lg-9 posts-list"
					style="border: 1px solid #f3f3f3; padding: 50px; border-radius: 5px; margin-top: 71px;">
					<div class="col-lg-12 col-md-12 blog_details">
						<div>
							<div style="margin-bottom: 20px;">
								<c:if test="${mId ne null }">
									<h2 style="padding-left: 35px;">
										<span>
											<img id="csimg"style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
												class="profile" src="resources/upload/${pInfo.pfile }"
												onError="this.src='resources/qna/???????????????2.png'"></span>
										<span>${pInfo.name}</span>&nbsp;<span>
											<c:if test="${pInfo.code == 100}">
												<c:out value="?????????" />
											</c:if>
											<c:if test="${pInfo.code == 101}">
												<c:out value="?????????" />
											</c:if>
											<c:if test="${pInfo.code == 102}">
												<c:out value="?????????" />
											</c:if>
											<c:if test="${pInfo.code == 103}">
												<c:out value="?????????" />
											</c:if>
										</span>?????? 1:1 ??????
									</h2>
								</c:if>
								<c:if test="${pId ne null }">
									<h2 style="text-align: center; margin-right: 7em;">
										<span><img id="csimg"
												style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
												class="profile" src="resources/upload/${mInfo.pfile }"
												onError="this.src='resources/qna/???????????????2.png'"></span> <span>
											<c:out value="${mInfo.name }" />????????? 1:1 ???????????????.</span>
									</h2>
								</c:if>
							</div>
							<!-- ???????????? ?????? -->
							<c:if test="${detail.pet_no != 0 || detail.pet_no eq null }">
								<div style="float: right; margin-top: -120px; margin-right: 32px; padding: 20px;">
									<table style="color: black">
										<tr>
											<td rowspan="3">
												<img style="width: 80px; height: 80px; object-fit: cover; border-radius: 70%; overflow: hidden; border: 2px solid rgb(46, 46, 46); margin-right: 5px;"
													class="profile" src="resources/upload/${petInfo.pfile }"
													onError="this.src='resources/qna/???????????????2.png'"></td>
											<td style="font-weight: bold;">
												<c:if test="${petInfo.code ==501 }">
													<c:out value="?????????" />
												</c:if>
												<c:if test="${petInfo.code ==502 }">
													<c:out value="?????????" />
												</c:if>
												<c:if test="${petInfo.code ==503 }">
													<c:out value="??????" />
												</c:if>
												<c:if test="${petInfo.code ==504 }">
													<c:out value="?????????" />
												</c:if>
												<c:if test="${petInfo.code ==505 }">
													<c:out value="??????" />
												</c:if>
												<c:if test="${petInfo.code ==506 }">
													<c:out value="??????" />
												</c:if>
												<c:if test="${petInfo.code ==507 }">
													<c:out value="??????" />
												</c:if>
												<c:if test="${petInfo.code ==508 }">
													<c:out value="?????????" />
												</c:if>
												<c:if test="${petInfo.code ==509 }">
													<c:out value="?????????" />
												</c:if>
												<c:if test="${petInfo.code ==510 }">
													<c:out value="??????" />
												</c:if>
												<c:if test="${petInfo.code ==511 }">
													<c:out value="??????" />
												</c:if>
											</td>
										</tr>
										<tr>
											<td>??????&nbsp;:&nbsp;&nbsp;${petInfo.name }</td>
										</tr>
										<tr>
											<td>?????????&nbsp;:&nbsp;${petInfo.weight }&nbsp;kg</td>
										</tr>
									</table>
								</div>
							</c:if>

							<!-- ?????? ?????? -->
							<div id="chatbody" style="border: 1px solid #d3d3d3; background-color: white; margin: 30px; padding: 30px; color: black; height: 750px; border-radius: 5px; overflow: auto;">
								<c:forEach items="${csDetail }" var="detail">
									<!-- ?????? ????????? ?????? -->
									<c:if test="${mId ne null }">
										<!-- ?????? ????????? -->
										<c:if test="${detail.p_id eq detail.sender }">
											<div class="other">${pInfo.name }</div>
											<div>
												<div class="leftBubble"
													style="background-color: #d1d1d1; padding: 10px; margin-right : 100px; border-radius: 10px; display: inline-block;">
													${detail.content }</div>
												<div class="other">${detail.w_date }</div>
											</div>
										</c:if>
										<!-- ?????? -->
										<c:if test="${detail.m_id eq detail.sender }">
											<div align="right">
												<div class="mine"
													style="background-color: #38a4ff; padding: 10px; margin-left : 100px; border-radius: 10px; display: inline-block; color : white;">
													${detail.content }</div>
												<div class="mine">${detail.w_date }</div>
											</div>
										</c:if>
									</c:if>
									<!-- ????????? ????????? ?????? -->
									<c:if test="${pId ne null }">
										<!-- ?????? ????????? -->
										<c:if test="${detail.m_id eq detail.sender }">
											<div class="other">${mInfo.name }</div>
											<div>
												<div class="leftBubble" style="background-color: #d1d1d1; padding: 10px; margin-right : 100px; border-radius: 10px; display: inline-block;">
													${detail.content }</div>
												<div class="other">${detail.w_date }</div>
											</div>
										</c:if>
										<!-- ?????? -->
										<c:if test="${detail.p_id eq detail.sender }">
											<div align="right">
												<div class="mine" style="background-color: #38a4ff; padding: 10px; margin-left : 100px; border-radius: 10px; display: inline-block; color : white;">
													${detail.content }</div>
												<div class="mine">${detail.w_date }</div>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
							<c:if test="${oneCs.code == '302' || oneCs.code == '301' }">
								<div style="display : flex; margin-top: -15px;">
									<input type="text" id="CounselMsg" name="CounselMsg" class="form-control"
										placeholder="???????????? ??????????????????" style="width : 640px; height : 50px; margin-left : 30px;">
									<button type="button" id="msgSubmit" class="genric-btn info-border radius" name="msgSubmit">??????</button>
								</div>
							</c:if>
							<c:if test="${oneCs.code == '303' }">
								<div style="background-color: rgb(220, 220, 220); text-align: center; border-radius: 10px; width: 200px; height: 60px; padding-top: 18px; margin-left: 20em; color : black;">
									<p style="font-size: 16px; font-family: sans-serif;">????????? ?????????????????????.</p>
								</div>
							</c:if>
							<input type="hidden" id="pet_no" name="pet_no" value="${oneCs.pet_no }">
							<input type="hidden" id="p_no" name="p_no" value="${oneCs.c_no }">
							<input type="hidden" id="m_id" name="m_id" value="${oneCs.m_id }">
							<input type="hidden" id="p_id" name="p_id" value="${oneCs.p_id }">
							<c:if test="${mId ne null}">
								<input type="hidden" id="sender" name="sender" value="${mId }">
							</c:if>
							<c:if test="${pId ne null }">
								<input type="hidden" id="sender" name="sender" value="${pId }">
							</c:if>
							<c:if test="${oneCs.code == '302' || oneCs.code == '301' }">
								<button type="button" id="terminate" name="terminate"
									class="genric-btn success">????????????</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
		$(document).ready(function () {

			$('#CounselMsg').keypress(function (event) {
				var keycode = (event.keyCode ? event.keyCode : event.which);
				if (keycode == '13') {
					send();
				}
				event.stop(propagation);
			});
			$('#msgSubmit').click(function () {
				send();
			})
		});

		function send() {
			var msg = $("#CounselMsg").val();
			console.log(msg);

			if (msg != null) {
				$.ajax({
					method: "POST",
					url: "newCsAns",
					data: {
						p_no: $("#p_no").val(),
						m_id: $("#m_id").val(),
						p_id: $("#p_id").val(),
						content: $("#CounselMsg").val(),
						code: $("#code").val(),
						sender: $("#sender").val(),
						pet_no: $("#pet_no").val()
					},
					success: function () {
						location.reload();
						var objDiv = document.getElementById("chatbody");
						objDiv.scrollTop = objDiv.scrollHeight;
					},
					error: function () {
						alert('???????????? ???????????? ???????????????.');
					}
				})
			}
		}

	    /*?????? ??????*/
		$(function () {
			$("#terminate").click(function () {
				if (Swal.fire({
						title: "????????? ???????????? ??? ??????<br> ???????????? ?????? ??? ????????????. <br>?????? ?????????????????????????",
						showCancelButton: true,
						confirmButtonColor: '#3085d6', // confrim ?????? ?????? ?????? ??????
						cancelButtonColor: '#d33',
						confirmButtonText: '????????????', // confirm ?????? ????????? ?????? 
						cancelButtonText: '??????',
					}).then(result => {
						if (result.isConfirmed) {
							$.ajax({
								method: "GET",
								url: "CodeUdt",
								data: {
									p_no: $("#p_no").val(),
								},
								success: function () {
									Swal.fire('????????? ?????????????????????.');
									location.reload();
								},
								error: function () {
									Swal.fire('????????? ??????????????????.');
								}
							})

						}

					})) {
				}
			})
		})
	</script>
</body>

</html>