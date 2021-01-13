<%--
  Created by IntelliJ IDEA.
  User: HIEU
  Date: 11/24/2020
  Time: 2:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<c:url value = "/template/web" var="url"/>

<footer id="aa-footer">
    <!-- footer bottom -->
    <div class="aa-footer-top">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-footer-top-area">
                        <div class="row">
                            <div class="col-md-4 col-sm-6">
                                <div class="aa-footer-widget">
                                    <a href="${pageContext.request.contextPath}/"><img src="${url}/images/new/logofooter.png" alt="logo img" width="185px"></a>
                                    <ul class="aa-footer-nav">

                                        <li><p style="color:#888; text-align: justify; width: 95%">Là nơi chuyên buôn bán tất cả các mặt hàng về nông sản chất lượng. Chúng tôi luôn đặt tiêu chí về chất lượng và uy tín lên hàng đầu.</p></li>
<%--                                        <li><img src="${pageContext.request.contextPath}/view/client/assets/images/dadangky.png" alt="logo img" width="40%"></li>--%>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="aa-footer-widget">
                                    <div class="aa-footer-widget">
                                        <h3>HỖ TRỢ KHÁCH HÀNG</h3>
                                        <ul class="aa-footer-nav">
                                            <li><a href="${pageContext.request.contextPath}/view/client/order">Hướng dẫn đặt hàng</a></li>
                                            <li><a href="${pageContext.request.contextPath}/view/client/payment">Hướng dẫn thanh toán</a></li>
                                            <li><a href="${pageContext.request.contextPath}/view/client/security">Chính sách bảo mật thông tin</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <div class="aa-footer-widget">
                                    <div class="aa-footer-widget">
                                        <h3>LIÊN HỆ</h3>
                                        <address>
                                            <p>IT18 - Đại học Sư phạm Kĩ Thuật - Q.Thủ Đức - TP HCM</p>
                                            <p><span class="fa fa-phone"></span>010.999.9999</p>
                                            <p><span class="fa fa-envelope"></span>bookstore@gmail.com</p>
                                        </address>
                                        <div class="aa-footer-social">
                                            <a href="https://www.facebook.com/"><span class="fab fa-facebook"></span></a>
                                            <a href="https://www.youtube.com/"><span class="fab fa-youtube"></span></a>
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
    <!-- footer-bottom -->
    <div class="aa-footer-bottom">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="aa-footer-bottom-area">
                        <p>@Copyright 2020 BookStore.com</p>
                        <div class="aa-footer-payment">
                            <span class="fab fa-cc-mastercard"></span>
                            <span class="fab fa-cc-visa"></span>
                            <span class="fab fa-paypal"></span>
                            <span class="fab fa-cc-discover"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>


