<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.ecommerce.model.DbConnection" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Map<String, Integer> cart
            = (Map<String, Integer>) session.getAttribute("cart");

    if (cart == null) {
        cart = new HashMap<>();
        session.setAttribute("cart", cart);
    }

// Stock message
    String stockMessage = (String) session.getAttribute("stockMessage");
    String stockProductName = (String) session.getAttribute("stockProductName");

// Clear after showing once
    session.removeAttribute("stockMessage");
    session.removeAttribute("stockProductName");

    Connection conn = DbConnection.getConnection();
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM products");
    ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Green Cart</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
              rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"/>

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"/>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

        <style>
            body {
                background: #f8f9fa;
            }
            .card img {
                height: 220px;
                object-fit: cover;
            }
            .owl-nav{
                position: absolute;
                top: 50%;
                width:100%;
                display:flex;
                justify-content: space-between;
                transform: translateY(-50%);
            }
            .owl-nav button{
                background: rgba(0,0,0,0.5) !important;
                color: white !important;
                border-radius: 50% !important;
                width: 35px;
                height: 35px;
            }
        </style>
    </head>

    <body>


        <nav class="navbar navbar-expand-lg navbar-dark bg-success">
            <div class="container">
                <a class="navbar-brand fw-bold d-flex align-items-center" href="#">
                    <img src="https://cdn-icons-png.flaticon.com/512/3081/3081559.png"
                         width="35"
                         height="35"
                         class="me-2">
                    Green Cart
                </a>

                <div>
                    <a href="<%=request.getContextPath()%>/views/adminlogin.jsp" 
                       class="btn btn-dark me-2">
                        Admin
                    </a>
                    <a href="cart.jsp" class="btn btn-warning">
                        Cart (<%= cart.size()%>)
                    </a>
                </div>
            </div>
        </nav>

        <div class="container mt-4">


            <div class="row">

                <%
                    while (rs.next()) {

                        int pid = rs.getInt("id");
                        String name = rs.getString("name");
                        double price = rs.getDouble("price");
                        int qty = cart.getOrDefault(name, 0);
                %>

                <div class="col-md-3 mb-4">
                    <div class="card shadow h-100">

                        <div class="owl-carousel product-carousel">

                            <%
                                PreparedStatement imgPs = conn.prepareStatement(
                                        "SELECT image_url FROM product_images WHERE product_id=?");
                                imgPs.setInt(1, pid);
                                ResultSet imgRs = imgPs.executeQuery();

                                boolean hasImage = false;

                                while (imgRs.next()) {
                                    hasImage = true;
                                    String imgPath = imgRs.getString("image_url");
                            %>

                            <div>
                                <img src="<%=request.getContextPath()%>/<%=imgPath%>"
                                     class="card-img-top">
                            </div>

                            <%
                                }

                                if (!hasImage) {
                            %>
                            <div>
                                <img src="https://via.placeholder.com/300x220"
                                     class="card-img-top">
                            </div>
                            <%
                                }

                                imgRs.close();
                                imgPs.close();
                            %>

                        </div>

                        <div class="card-body text-center">
                            <h5><%= name%></h5>
                            <p class="text-success fw-bold">₹ <%= price%></p>
                            <%
                                if (stockMessage != null && stockProductName != null
                                        && stockProductName.equals(name)) {
                            %>

                            <div class="alert alert-danger py-1 text-center small">
                                <%= stockMessage%>
                            </div>

                            <%
                                }
                            %>
                            <form action="<%=request.getContextPath()%>/updateQuantity"
                                  method="post">

                                <input type="hidden"
                                       name="productName"
                                       value="<%= name%>">

                                <% if (qty == 0) { %>

                                <button class="btn btn-success w-100"
                                        type="submit"
                                        name="action"
                                        value="increase">
                                    Add To Cart
                                </button>

                                <% } else {%>

                                <div class="d-flex justify-content-center align-items-center">
                                    <button class="btn btn-danger btn-sm"
                                            type="submit"
                                            name="action"
                                            value="decrease">-</button>

                                    <span class="mx-3 fw-bold"><%= qty%></span>

                                    <button class="btn btn-success btn-sm"
                                            type="submit"
                                            name="action"
                                            value="increase">+</button>
                                </div>

                                <% } %>

                            </form>
                        </div>

                    </div>
                </div>

                <%
                    }

                    rs.close();
                    ps.close();
                    conn.close();
                %>

            </div>
        </div>

        <script>
            $(document).ready(function () {
                $('.product-carousel').owlCarousel({

                    items: 1,
                    loop: true,
                    nav: true,
                    dots: true,
                    autoplay: true,
                    autoplayTimeout: 2000
                });
            });
        </script>

    </body>
</html>