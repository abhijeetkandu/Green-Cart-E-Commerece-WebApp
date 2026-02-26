<%@page import="java.util.*,java.sql.*,com.ecommerce.model.DbConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Cart</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>

<body class="bg-light">

<div class="container mt-5">

    <h2 class="text-center mb-4">🛒 Your Shopping Cart</h2>

    <div class="text-center mb-3">
        <a href="<%=request.getContextPath()%>/views/home.jsp"
           class="btn btn-outline-primary">
            Continue Shopping
        </a>
    </div>

<%
    Map<String, Integer> cart =
            (Map<String, Integer>) session.getAttribute("cart");

    if (cart == null || cart.isEmpty()) {
%>

        <div class="alert alert-warning text-center">
            Your Cart is Empty
        </div>

<%
    } else {

        double total = 0;
        int totalQty = 0;

        Connection conn = DbConnection.getConnection();
%>

    <div class="card shadow">
        <div class="card-body">

            <!-- Table Header -->
            <div class="row fw-bold text-center border-bottom pb-2 mb-3 bg-light">
                <div class="col-md-4">Product Name</div>
                <div class="col-md-3">Product Price</div>
                <div class="col-md-5">Product Quantity</div>
            </div>

<%
        for (Map.Entry<String, Integer> item : cart.entrySet()) {

            String name = item.getKey();
            int qty = item.getValue();

            PreparedStatement ps = conn.prepareStatement(
                    "SELECT price FROM products WHERE name=?"
            );
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();

            double price = 0;

            if (rs.next()) {
                price = rs.getDouble("price");
                total += price * qty;
                totalQty += qty;   // ✅ Total Quantity add
            }

            rs.close();
            ps.close();
%>

            <div class="row align-items-center mb-3 text-center">

                <div class="col-md-4">
                    <strong><%= name %></strong>
                </div>

                <div class="col-md-3">
                    ₹ <%= String.format("%.2f", price) %>
                </div>

                <div class="col-md-5">
                    <form action="<%=request.getContextPath()%>/updateQuantity"
                          method="post"
                          class="d-inline">

                        <input type="hidden"
                               name="productName"
                               value="<%= name %>">

                        <button class="btn btn-danger btn-sm"
                                type="submit"
                                name="action"
                                value="decrease">-</button>

                        <span class="mx-2 fw-bold"><%= qty %></span>

                        <button class="btn btn-success btn-sm"
                                type="submit"
                                name="action"
                                value="increase">+</button>
                    </form>
                </div>

            </div>

            <hr>

<%
        }

        conn.close();
%>

            <!-- TOTAL SECTION -->
            <div class="text-end mt-4 border-top pt-3">
                <h5>Total Quantity:
                    <span class="text-primary"><%= totalQty %></span>
                </h5>

                <h4>Total Price:
                    <span class="text-success">
                        ₹ <%= String.format("%.2f", total) %>
                    </span>
                </h4>
            </div>

            <div class="text-end">
                <a href="<%=request.getContextPath()%>/views/checkout.jsp"
                   class="btn btn-primary mt-2">
                    Proceed to Checkout
                </a>
            </div>

        </div>
    </div>

<%
    }
%>

</div>

</body>
</html>