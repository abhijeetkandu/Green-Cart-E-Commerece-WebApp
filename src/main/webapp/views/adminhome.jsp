<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String admin = (String) session.getAttribute("admin");
    if(admin == null){
        response.sendRedirect(request.getContextPath()+"/views/adminlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-dark bg-dark">
    <div class="container">
        <span class="navbar-brand mb-0 h1">Admin Dashboard</span>
        <a href="<%=request.getContextPath()%>/views/home.jsp" class="btn btn-outline-light">
            View Website
        </a>
    </div>
</nav>

<div class="container mt-5">

    <div class="card shadow-lg">
        <div class="card-header bg-success text-white">
            <h4 class="mb-0">Add New Product</h4>
        </div>

        <div class="card-body">

            <form action="<%=request.getContextPath()%>/addProduct"
                  method="post"
                  enctype="multipart/form-data">

                <div class="row">

                    <div class="col-md-6 mb-3">
                        <label class="form-label">Product Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Price</label>
                        <input type="number" name="price" class="form-control" required>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Quantity</label>
                        <input type="number" name="quantity" class="form-control" required>
                    </div>

                </div>

                <hr>

                <h5 class="mb-3">Upload Product Images</h5>

                <div class="row">

                    <% for(int i=1;i<=8;i++){ %>

                        <div class="col-md-3 mb-3">
                            <label class="form-label">Image <%= i %></label>
                            <input type="file" name="image<%= i %>" class="form-control">
                        </div>

                    <% } %>

                </div>

                <div class="text-end mt-4">
                    <button type="submit" class="btn btn-success btn-lg">
                        Add Product
                    </button>
                </div>

            </form>

        </div>
    </div>

</div>

</body>
</html> 