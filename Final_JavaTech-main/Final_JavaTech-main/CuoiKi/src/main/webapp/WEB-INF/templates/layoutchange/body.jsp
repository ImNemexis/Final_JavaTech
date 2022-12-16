<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="/assets/css/fontawesome.css">
<link rel="stylesheet" href="/assets/css/templatemo-sixteen.css">
<link rel="stylesheet" href="/assets/css/owl.css">
</head>
<body>
	<div class="banner header-text">
    <div class="owl-banner owl-carousel">
        <div class="banner-item-01">
            <div class="text-content">
                <h2>Sản phẩm mới nhất</h2>
            </div>
        </div>
        <div class="banner-item-02">
            <div class="text-content">
                <h2>Giá rẻ vô đối</h2>
            </div>
        </div>
        <div class="banner-item-03">
            <div class="text-content">
                <h2>Hàng chính hãng - yên tâm chất lượng</h2>
            </div>
        </div>
    </div>
</div>

<div class="latest-products">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h2>Sản phẩm mới</h2>
                    <a href="/Home/product${item.id}">Xem tất cả sản phẩm<i class="fa fa-angle-right"></i></a>
                </div>
            </div>
            <c:forEach var="item" items="${page.content}">
                <div class="col-md-3">
                    <div class="product-item">
                        <a href="#"><img src="/static/upload/${item.image}" width="500" height="200" alt=""></a>
                        <div class="down-content">
                            <a href="/Home/product/about/${item.id}"><h4>${item.name}</h4></a>
                            <a> Giá tiền:  ${item.price}</a>
                            <br>
                            <h7>Giảm còn: ${item.price-item.discount}</h7>
                            <p>${item.about}</p>
                            <ul class="stars">
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>
                            </br>
                            <a class="filled-button" href="/shoppingcart/add/${item.id}">Đặt hàng</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>