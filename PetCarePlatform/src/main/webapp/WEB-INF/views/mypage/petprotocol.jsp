<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://cdn.jsdelivr.net/gh/ethereum/web3.js@1.0.0-beta.37/dist/web3.min.js"></script>
	<script src="template/js/diaLog.js"></script>
</head>
<style>
	#my_section {
		margin-top: -70px;
		padding-bottom: 25px;
	}

	.padding {
		padding: 5rem
	}

	#sidebar {
		width: 500px;
		float: none;
		margin-left: 12em;
		background-color: #fff;
		border: none;

	}

	.codep {
		color: #0062ff;
		background: #FFF;
		border: 1px solid transparent;
		font-size: 16px;
	}

	.codep:hover {
		color: #0062ff;
		border: 1px solid #0062ff;
		background: #fff;
	}

	.padding {
		padding: 5rem
	}

	.table th {
		text-align: center;
		font-size: 1.0rem;
		/* font-family: 'NanumBarunGothic'; */
		font-style: normal;
		font-weight: 500 !important;
		color: black;
		/* background-color: ghostwhite; */
	}

	.table {
		width: 100%;
		max-width: 100%;
		margin-bottom: 1rem;
		background-color: transparent;
	}

	.table-striped tbody tr:nth-of-type(odd) {
		background-color: #f9f9fd;
	}

	.table td {
		font-size: 16px;
		padding: .875rem 0.9375rem;
		text-align: center;
	}


	.no_deco {
		text-decoration: none !important;
		font-size: 0.8rem !important;
		color: black;
	}

	#main-side,
	#main-side1 {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem;
		float: none !important;
		margin: 0 auto !important;
		background-color: white;
		width: 250px;
	}

	.card {
		box-shadow: 0 .15rem 1.75rem 0 rgba(58, 59, 69, .1) !important;
		border: 1px solid #e3e6f0;
		border-radius: 0.35rem
	}

	.card-header {
		background: white;
		font-size: 1.0rem;
		font-style: normal;
		font-weight: 400;
		color: black;
	}

	.card-body {
		font-size: 1.0rem;
		font-style: normal;
		font-weight: 300;
		color: black;

	}

	.card-text {
		width: 200px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.widget_title {
		background: #0062ff !important;
	}

	#myinfo {
		font-size: 0.8rem;
		font-style: normal;
		font-weight: 300;
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
		font-style: normal !important;
		font-weight: 700 !important;
		color: gray;
	}

	#menu_bold {
		font-size: 1.0rem;
		font-style: normal;
		font-weight: 700;
		color: black;
	}

	input {
		display: inline-block;
	}

	.form-control {
		padding: 5px;
		width: 250px;
		display: inline-block;
		border-radius: 20px;
	}

	input:focus,
	textarea:focus {
		border: 3px solid;
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
				<div class="col-lg-9 posts-list">
					<div class="single-post row">
						<div class="col-lg-12 col-md-12 blog_details">
							<br><br>
							<div class="card">
								<div class="card-header">
									<div align="left">
										<i class="fa-solid fa-flag"></i>&nbsp;&nbsp;&nbsp;???????????? ????????????
									</div>
								</div>
								<div class="card-body">
									<div class="row">
										<div class="col-md-12" style="margin: 20px 0 0 -45px;">
											<div class="table-wrap">
												<button type="button" class="codep" style="margin: 0 30px 0 15em;"
													data-code="">??????</button>
												<button type="button" class="codep" style="margin-right: 30px;"
													data-code="100">??????</button>
												<button type="button" class="codep" style="margin-right: 30px;"
													data-code="101">??????</button>
												<button type="button" class="codep" style="margin-right: 30px;"
													data-code="102">??????</button>
												<button type="button" class="codep" style="margin-right: 30px;"
													data-code="103">???????????????</button>
												<button type="button" class="codep" style="margin-right: 30px;"
													id="block_chain">????????????????????????</button>
												<div id='blockChain' style="margin-left : 5px;margin-top : 10px ;text-align: center;"></div>
											</div>
										</div>
										<div class="table-wrap" style="width: 950px;margin-top: 20px;">
											<table class="table table-striped">
												<thead>
													<tr style="text-align: center;">
														<th>???????????? ??????</th>
														<th>?????????????????????</th>
														<th>?????????</th>
														<th>??????</th>
													</tr>
												</thead>
												<tbody id="myTable" style="text-align: center">
												</tbody>
											</table>
											<div class="blog_right_sidebar" id="sidebar">
												<form id="admDateForm" onsubmit="return false" onkeypress="eventkey();"
													onclick="pagingList();">
													<input type="hidden" name="code">
													<input type="hidden" name="pageNum" value="1">
													<aside class="single_sidebar_widget search_widget" style="display: flex;">
														<select id="key" name="key">
															<option value="all" selected="selected">??? ???</option>
														</select>
														<div class="input-group">
															<input type="text" class="form-control" id="data"name="data">
															<span class="input-group-btn">
																<button class="btn btn-default" type="submit">
																	<i class="fa fa-search"></i>
																</button>
															</span>
														</div>
													</aside>
												</form>
											</div>
											<div id="pagination"></div>
											<div>
												<form id="frm" action="" method="post"></form>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script type="text/javascript">
		//======================enter ???===================
		function eventkey() {
			if (event.keyCode == 13) {
				pagingList();
			} else {
				return false;
			}
		} //====================end enter ???================

		// ===================viewPmemberList : ????????? ???????????? List????????? ??????==========================
		let viewPmemberList = function (result) {
			$(".table").empty();

			$("#myTable").empty();
			$(".table").append(`<thead>
							<tr>
								<th>???????????? ??????</th>
								<th>?????????????????????</th>
								<th>?????????</th>
								<th>??????</th>
							</tr>
						</thead>
						<tbody id="myTable">
						</tbody>`)
			$.each(result, function (i) {
				console.log(result[i])
				$("#myTable").append("<tr><td>" +
					result[i].p_name +
					"</td><td>" +
					result[i].pm_name +
					"</td><td class='card-text'>" +
					result[i].content +
					"</td><td>" +
					result[i].startdate +
					"</td></tr>"
				);
			}) // end each.

		} //=========================end viewPmemberList : ????????? ???????????? List????????? ??????===============


		// ===========================?????? ??? ?????? + ????????? ??????==============================
		$(".codep").on('click', function () {
			var code = $(this).data('code');
			$('#admDateForm')[0].code.value = code
			$('#admDateForm')[0].pageNum.value = 1;
			pagingList();

		});

		function pagingList() {

			$("#blockChain").empty();
			var str = $('#admDateForm').serialize();
			console.log(str);
			$.ajax({
				url: 'PetServiceList',
				method: 'post',
				data: str,
				//contentType : 'application/json',
				success: function (result) {
					console.log("????????????????????? :" + result.list);
					console.log(result.list);
					console.log("????????????????????? : " + result.page);
					if (result.list == '') {
						$(".table").empty();
						$(".table").append(`<thead>
								<tr>
									<th>???????????? ??????</th>
									<th>?????????????????????</th>
									<th>?????????</th>
									<th>??????</th>
								</tr>
							</thead>
							<tbody id="myTable">
							</tbody>`)
						$("#myTable").empty();
						$("#myTable").append("<tr><td colspan='4' align='center'>???????????? ????????????.</td></tr>");
						// $(".table").empty();

					} else {
						viewPmemberList(result.list);
						viewPage(result.page);
					}

				}
			});
		} // end paginList()

		function viewPage(page) {
			console.log("page??? :" + JSON.stringify(page));

			var nav = `<nav class="blog-pagination justify-content-center d-flex">
			<ul class="pagination">`
			if (page.prev) {
				nav += `<li class="page-item">
				<a href="javascript:goPage(\${page.startPage-1})" class="page-link"
					aria-label="Previous">
					<span aria-hidden="true">
						<span class="fa fa-angle-left"></span>
					</span></a>
				</li>`
			}
			for (var i = page.startPage; i <= page.endPage; i++) {
				nav += `<li class="page-item ${page.pageNum eq num ? 'active' : '' }"><a
								href="javascript:goPage(\${i})" class="page-link">\${i }</a>
								</li>`
			}

			if (page.next) {
				nav += `<li class="page-item"><a href="javascript:goPage(\${page.endPage+1})"
					class="page-link" aria-label="Next">
				<span aria-hidden="true">
					<span class="fa fa-angle-right"></span>
				</span></a>
		</li>`

			}

			nav += `</ul></nav>`
			$('#pagination').html(nav);

		} // end viewPage(page)

		function goPage(pa) {
			console.log("pa ??? :" + pa);
			$('#admDateForm')[0].pageNum.value = pa;
			pagingList();
		}
		pagingList();
		// ===========================end ?????? ??? ?????? + ????????? ??????==============================


		// ==============================???????????? ===============================================
		$("#block_chain").on('click', function (event) {
			$(".table").empty();
			$("#blockChain").empty();
			$("#blockChain").append(`???????????? :  <select class="reservNo" onchange="reservNo(event)" size="1">
													<option value="" disabled selected>????????????</option>
													 	<c:forEach items="${reservation }" var="res">
													 		<option value="${res.r_no}">${res.r_no}</option>
													 	</c:forEach>`);
		});

		function myFunction() {
			var r_no = $("#r_no").val();
			console.log(r_no);
			diaLog.methods.diaLogSearch(r_no)
				.call()
				.then(function (result) {
					console.log(result);
				})
		}

		function reservNo(event) {
			var r_no = $(".reservNo option:selected").val();
			diaLog.methods.diaLogSearch(r_no)
				.call()
				.then(function (result) {
					console.log(result);

					if (result.d_name == '') {
						$(".table").empty();
						$(".table").append(`
		        	  				<thead>
										<tr>
											<th>??????</th>
											<th>??????</th>
											<th>??????</th>
											<th>???????????????</th>
											<th>???????????????</th>
										</tr>
									</thead>
									<tbody id="myTable">
										<tr>
											<td colspan ="5" align="center">?????? ??????????????? ????????????</td>
										</tr>
									</tbody>`);
					} else {
						$(".table").empty();
						$(".table").append(`
		        	  				<thead>
										<tr>
											<th>??????</th>
											<th>??????</th>
											<th>??????</th>
											<th>???????????????</th>
											<th>???????????????</th>
										</tr>
									</thead>
									<tbody id="myTable">
										<tr>
											<td>` + result.d_name + `</td>
											<td>` + result.result + `</td>
											<td>` + result.symptom + `</td>
											<td>` + result.w_date + `</td>
											<td>` + result.m_id + `</td>
										</tr>
									</tbody>`);
					}
				})
		}
	</script>
</body>

</html>