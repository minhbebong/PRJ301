<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.text.DecimalFormat"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="shortcut icon" href="views/frontend/img/favicon.png" type="image/png" />
<link rel="stylesheet" href="views/frontend/css/reset.css">
<link rel="stylesheet" href="views/frontend/css/all.min.css">
<link rel="stylesheet" href="views/frontend/css/grid.css">
<link rel="stylesheet" href="views/frontend/css/common.css">
<link rel="stylesheet" href="views/frontend/css/home.css">
<link rel="stylesheet" href="views/frontend/css/products.css">
<link rel="stylesheet" href="views/frontend/css/responsive.css">
<title>Thời trang Enda</title>
</head>
<body>

	<%@include file="Header.jsp"%>

	<div class="bg-banner">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<h3 class="bg-banner-title">Tìm kiếm sản phẩm</h3>
				</div>
			</div>
		</div>
	</div>

	<div class="main__content">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<div class="row main__content--inner">
						<div class="main__content-products">
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="main__content--heading">
									<h3 class="main__content--heading-title">Danh sách Sản phẩm</h3>
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12">
								<div class="row products__list">
									<c:forEach var="product" items="${products}">
										<%
											DecimalFormat formatter = new DecimalFormat("###,###,###");
										%>
										<div class="col-lg-3 col-md-3 col-sm-6 col-no-padding">
											<div class="products__item">
												<div class="products__item--img">
													<a
														href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
														<img src="Contents/Image/Product/${product.image}">
													</a>
													<div class="products__item--actions">
														<div class="products__item--actions-cart">
															<a href="<%=request.getContextPath()%>/CartServlet?command=addCart&ProductID=${product.productID }"
																class="products__item--actions-link" id="button-bag">
																<i class="fa fa-shopping-bag"></i>
															</a>
														</div>
														<div class="products__item--actions-detail">
															<a class="products__item--actions-link"
																href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
																<i class="far fa-clone"></i>
															</a>
														</div>
													</div>
												</div>
												<div class="products__item--info">
													<h3 class="products__item--info-name">
														<a class="products__item--info-link"
															href="<%=request.getContextPath()%>/DetailProductServlet?id=${product.productID }">
															${product.productName} </a>
													</h3>
													<p class="products__item--info-price">
														<span> <fmt:setLocale value="vi-VN" /> <fmt:formatNumber
																value="${product.price}" type="currency" />
														</span>
													</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="Footer.jsp"%>


	<script src="views/frontend/js/jquery-3.5.1.min.js"></script>
	<script src="views/frontend/js/all.min.js"></script>
	<script src="views/frontend/js/main.js"></script>
</body>
</html>