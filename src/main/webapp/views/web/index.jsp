<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 1/9/2021
  Time: 8:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/template/web" var="url"/>

<!-- Start slider -->
<section id="aa-slider">
    <div class="aa-slider-area">
        <div id="sequence" class="seq">
            <div class="seq-screen">
                <ul class="seq-canvas">
                    <!-- single slide item -->
                    <li>
                        <div class="seq-model">
                            <img data-seq src="${url}/images/slide_1.jpg" alt="Men slide img"/>
                        </div>
                        <div class="seq-title">
                            <span data-seq>Giảm giá lên đến ${productListHotDiscount.get(0).getDiscount()}%</span>
                            <h2 data-seq>Các Loại Hạt Bổ Dưỡng</h2>
                            <p data-seq>Các loại hạt tại của hàng luôn luôn được tuyển chọn,và các mặt hàng luôn đảm bảo
                                chất lượng.</p>
                            <a data-seq href="${pageContext.request.contextPath}/web/product"
                               class="aa-shop-now-btn aa-secondary-btn">Xem Sản Phẩm</a>
                        </div>
                    </li>
                    <!-- single slide item -->
                    <li>
                        <div class="seq-model">
                            <img data-seq src="${url}/images/slide_2.jpg" alt="Wristwatch slide img"/>
                        </div>
                        <div class="seq-title">
                            <span data-seq>Giảm giá lên đến 20%</span>
                            <h2 data-seq>Rau Củ Quả Xanh Sạch</h2>
                            <p data-seq>Rau củ quả được trồng đảm bảo không thuốc hóa học , đảm bảo chất lương xanh sạch
                                và an toàn.</p>
                            <a data-seq href="${pageContext.request.contextPath}/web/product"
                               class="aa-shop-now-btn aa-secondary-btn">Xem Sản Phẩm</a>
                        </div>
                    </li>
                    <!-- single slide item -->
                    <li>
                        <div class="seq-model">
                            <img data-seq src="${url}/images/slide_3.jpg" alt="Women Jeans slide img"/>
                        </div>
                        <div class="seq-title">
                            <span data-seq>Giảm giá lên đến 33%</span>
                            <h2 data-seq>Trái Cây Ngon Ngọt</h2>
                            <p data-seq>Trái cây tại cửa hàng đa dạng về loại hàng, luôn đảm bảo tính an toàn và chất
                                lượng lên hàng đầu.</p>
                            <a data-seq href="${pageContext.request.contextPath}/web/product"
                               class="aa-shop-now-btn aa-secondary-btn">Xem Sản Phẩm</a>
                        </div>
                    </li>
                    <!-- single slide item -->
                    <li>
                        <div class="seq-model">
                            <img data-seq src="${url}/" alt="Shoes slide img"/>
                        </div>
                        <div class="seq-title">
                            <span data-seq>Giảm giá lên đến 25%</span>
                            <h2 data-seq>Mật Ong Và Tinh Dầu</h2>
                            <p data-seq>Là 2 sản phẩm mới bên cửa hàng của chúng tôi,sản phẩm đã được kiểm định
                                và cấp phép về an toàn.</p>
                            <a data-seq href="${pageContext.request.contextPath}/web/product"
                               class="aa-shop-now-btn aa-secondary-btn">Xem Sản Phẩm</a>
                        </div>
                    </li>
                </ul>
            </div>
            <!-- slider navigation btn -->
            <fieldset class="seq-nav" aria-controls="sequence" aria-label="Slider buttons">
                <a type="button" class="seq-prev" aria-label="Previous"><span class="fa fa-angle-left"></span></a>
                <a type="button" class="seq-next" aria-label="Next"><span class="fa fa-angle-right"></span></a>
            </fieldset>
        </div>
    </div>
</section>
<!-- End slider -->

<!-- Start Promo section -->
<section id="aa-promo">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-promo-area">
                    <div class="row">
                        <!-- promo left -->
                        <div class="col-md-5 no-padding">
                            <div class="aa-promo-left">
                                <div class="aa-promo-banner">

                                    <img
                                            src="${pageContext.request.contextPath}/template/web/images/products/img-test/${productListHotDiscount.get(0).getAnh_CuonSach()}"
                                         alt="${productListHotDiscount.get(0).getTen_CuonSach()}">
                                    <div class="aa-prom-content aa-product-img">
                                        <span>Giảm giá ${productListHotDiscount.get(0).getDiscount()}%</span>
                                        <h4>${productListHotDiscount.get(0).getTen_CuonSach()}</h4>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- promo right -->
                        <div class="col-md-7 no-padding">
                            <div class="aa-promo-right">
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner aa-product-img">
                                        <img src="${pageContext.request.contextPath}/template/web/images/products/img-test/${productListHotDiscount.get(1).getAnh_CuonSach()}"
                                             alt="${productListHotDiscount.get(1).getTen_CuonSach()}">
                                        <div class="aa-prom-content">
                                            <span>Giảm giá ${productListHotDiscount.get(1).getDiscount()}%</span>
                                            <h4>${productListHotDiscount.get(1).getTen_CuonSach()}</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner">
                                        <img src="${pageContext.request.contextPath}/template/web/images/products/img-test/${productListHotDiscount.get(2).getAnh_CuonSach()}"
                                             alt="${productListHotDiscount.get(2).getTen_CuonSach()}">
                                        <div class="aa-prom-content">
                                            <span>Giảm giá ${productListHotDiscount.get(2).getDiscount()}%</span>
                                            <h4>${productListHotDiscount.get(2).getTen_CuonSach()}</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner">
                                        <img src="${pageContext.request.contextPath}/template/web/images/products/img-test/${productListHotDiscount.get(3).getAnh_CuonSach()}"
                                             alt="${productListHotDiscount.get(3).getTen_CuonSach()}">
                                        <div class="aa-prom-content">
                                            <span>Giảm giá ${productListHotDiscount.get(3).getDiscount()}%</span>
                                            <h4>${productListHotDiscount.get(3).getTen_CuonSach()}</h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="aa-single-promo-right">
                                    <div class="aa-promo-banner">
                                        <img src="${pageContext.request.contextPath}/template/web/images/products/img-test/${productListHotDiscount.get(4).getAnh_CuonSach()}"
                                             alt="${productListHotDiscount.get(4).getTen_CuonSach()}">
                                        <div class="aa-prom-content">
                                            <span>Giảm giá ${productListHotDiscount.get(4).getDiscount()}%</span>
                                            <h4>${productListHotDiscount.get(4).getTen_CuonSach()}</h4>
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
<!-- / Promo section -->
<!-- Products section -->
<section id="aa-product">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row">
                    <div class="aa-product-area">
                        <div class="aa-product-inner">
                            <!-- start prduct navigation -->
                            <ul class="nav nav-tabs aa-products-tab">
                                <li class="active"><a href="#" data-toggle="tab">Sản phẩm bán chạy</a></li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!-- Start men product category -->
                                <div class="tab-pane fade in active">
                                    <ul class="aa-product-catg">
                                        <!-- start single product item -->
                                        <c:forEach items="${product_hotList}" var="product" end="7">
                                            <li>
                                                <figure>
                                                    <a class="aa-product-img" href="${pageContext.request.contextPath}/web/productDetail?id=${product.getCuonSachEntity().getMa_CuonSach()}&Cate=${product.getCuonSachEntity().getMa_DauSach()}"><img
                                                            src="${pageContext.request.contextPath}/template/web/images/products/img-test/${product.getCuonSachEntity().getAnh_CuonSach()}"
                                                            alt="polo shirt img"></a>
                                                        <%--                                                        ${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}--%>
                                                    <a class="aa-add-card-btn" href="${pageContext.request.contextPath}/web/product/AddtoCart?product-id=${product.getCuonSachEntity().getMa_CuonSach()}"><span
                                                            class="fa fa-shopping-cart"></span>Thêm vào giỏ hàng</a>
                                                        <%--                                                        ${pageContext.request.contextPath}/view/client/add-cart?product-id=${product.id}--%>
                                                    <figcaption>
                                                        <h4 class="aa-product-title"><a
                                                                href=" ${pageContext.request.contextPath}/web/productDetail?id=${product.getCuonSachEntity().getMa_CuonSach()}&Cate=${product.getCuonSachEntity().getMa_DauSach()}">${product.getCuonSachEntity().getTen_CuonSach() }</a>
                                                        </h4>
                                                            <%--                                                            ${pageContext.request.contextPath}/view/client/product-detail?id=${product.id}--%>

                                                        <c:choose>
                                                            <c:when test="${product.getCuonSachEntity().getDiscount() == 0}">
                                                                <span class="aa-product-price"><fmt:formatNumber
                                                                        type="number" maxFractionDigits="3"
                                                                        value="${product.getCuonSachEntity().getGiabia()}"/> VNĐ</span><span
                                                                    class="aa-product-price"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:forEach items="${productList_km}" var="product_km">
                                                                    <c:if test="${product_km.ma_CuonSach == product.getCuonSachEntity().getMa_CuonSach()}">
                                                                        <span class="aa-product-price"><fmt:formatNumber
                                                                                type="number" maxFractionDigits="3"
                                                                                value="${product_km.giabia}"/> VNĐ</span>
                                                                        <span class="aa-product-price"><del><fmt:formatNumber
                                                                                type="number" maxFractionDigits="3"
                                                                                value="${product.getCuonSachEntity().getGiabia()}"/> VNĐ</del></span>
                                                                    </c:if>
                                                                </c:forEach>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </figcaption>
                                                </figure>
                                                <c:if test="${product.getCuonSachEntity().getDiscount() != 0}">
                                                    <!-- product badge -->
                                                    <span class="aa-badge aa-sale">- ${product.getCuonSachEntity().getDiscount()}%</span>
                                                </c:if>
                                            </li>
                                        </c:forEach>
                                        <!-- start single product item -->
                                    </ul>

                                </div>
                                <!-- / men product category -->
                                <!-- start women product category -->

                                </ul>

                            </div>
                            <!-- / sports product category -->
                            <!-- start electronic product category -->

                            <!-- / electronic product category -->
                        </div>
                        <div class="more-product">
                            <a class="aa-browse-btn" href="${pageContext.request.contextPath}/web/product">Xem Tất Cả
                                Sản Phẩm <span class="fa fa-long-arrow-right"></span></a>
                        </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- / Products section -->
<!-- banner section -->
<!-- popular section -->

<!-- / popular section -->
<!-- Support section -->
<section id="aa-support">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-support-area">
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-truck"></span>
                            <h4>MIỄN PHÍ VẬN CHUYỂN</h4>
                            <P>Chúng tôi đã áp dụng gói miễn phí vận chuyển cho đơn hàng trên 280.000VNĐ.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-clock-o"></span>
                            <h4>GIAO HÀNG NHANH</h4>
                            <P>Chúng tôi đảm bảo hàng đến tay khách hàng nhanh và đảm bảo sản phẩm an toàn.</P>
                        </div>
                    </div>
                    <!-- single support -->
                    <div class="col-md-4 col-sm-4 col-xs-12">
                        <div class="aa-support-single">
                            <span class="fa fa-phone"></span>
                            <h4>HỖ TRỢ 24/7</h4>
                            <P>Hỗ trợ tư vấn và đặt hàng mọi lúc mọi nơi, đảm bảo thời gian cho khách hàng.</P>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Support section -->
<!-- Testimonial -->
<section id="aa-testimonial">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-testimonial-area">
                    <ul class="aa-testimonial-slider">
                        <!-- single slide -->
                        <c:if test="${reviewEntities.size()-1 >= 0}">
                            <li>
                                <div class="aa-testimonial-single">
                                    <img class="aa-testimonial-img" src="${url}/images/avatar.jpg" alt="avatar 1">
                                    <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                    <p>${reviewEntities.get(reviewEntities.size()-1).getBinhluan()}</p>
                                    <div class="aa-testimonial-info">
                                        <p>${reviewEntities.get(reviewEntities.size()-1).getCustomerEntity().getHoten_Customer()}</p>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                        <!-- single slide -->
                        <c:if test="${reviewEntities.size()-2 >= 0}">

                            <li>
                                <div class="aa-testimonial-single">
                                    <img class="aa-testimonial-img" src="${url}/images/avater-2.jpg" alt="avatar 2">
                                    <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                    <p>${reviewEntities.get(reviewEntities.size()-2).getBinhluan()}
                                    <p>
                                        <div class="aa-testimonial-info">
                                    <p>${reviewEntities.get(reviewEntities.size()-2).getCustomerEntity().getHoten_Customer()}</p>
                                </div>
                            </li>
                            </li>
                        </c:if>
                        <!-- single slide -->
                        <c:if test="${reviewEntities.size()-3 >= 0}">
                            <li>
                                <div class="aa-testimonial-single">
                                    <img class="aa-testimonial-img" src="${url}/images/avatar.jpg" alt="avatar 1">
                                    <span class="fa fa-quote-left aa-testimonial-quote"></span>
                                    <p>${reviewEntities.get(reviewEntities.size()-3).getBinhluan()}</p>
                                    <div class="aa-testimonial-info">
                                        <p>${reviewEntities.get(reviewEntities.size()-3).getCustomerEntity().getHoten_Customer()}</p>
                                    </div>
                                </div>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- / Testimonial -->

<!-- Latest Blog -->
<section id="aa-latest-blog">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="aa-latest-blog-area">
                    <h2>TIN TỨC</h2>
                    <div class="row">
                        <!-- single latest blog -->
                        <c:forEach items="${boardnewlist}" var="boardnew" end="2">
                            <div class="col-md-4 col-sm-4">
                                <div class="aa-latest-blog-single">
                                    <figure class="aa-blog-img">
                                        <a href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}"><img
                                                src="${pageContext.request.contextPath}/view/client/assets/images/news/${boardnew.image_link}"
                                                alt="Tin tức ${boardnew.title}"></a>
                                        <figcaption class="aa-blog-img-caption">
                                            <span href="#"><i class="fa fa-clock-o"></i>${boardnew.created}</span>
                                        </figcaption>
                                    </figure>
                                    <div class="aa-blog-info">
                                        <h3 class="aa-blog-title"><a
                                                href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}">${boardnew.title}</a>
                                        </h3>
                                        <p class="desc-boardnews">${boardnew.content}</p>
                                        <a href="${pageContext.request.contextPath}/view/client/news-list-detail?id=${boardnew.id}"
                                           class="aa-read-mor-btn">Xem thêm<span class="fa fa-long-arrow-right"></span></a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




