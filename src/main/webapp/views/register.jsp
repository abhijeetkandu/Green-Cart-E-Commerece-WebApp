<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-light d-flex align-items-center justify-content-center" style="min-height:100vh;">

<div class="container">

    <!-- ✅ ERROR MESSAGE TOP CENTER -->
    <%
        String error = (String) request.getAttribute("error");
        if(error != null){
    %>
        <div class="row justify-content-center mb-3">
            <div class="col-md-5">
                <div class="alert alert-danger text-center shadow">
                    <%= error %>
                </div>
            </div>
        </div>
    <%
        }
    %>

    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">Create Account</h4>
                </div>

                <div class="card-body">

                    <form action="<%=request.getContextPath()%>/regForm" method="post">

                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Confirm Password</label>
                            <input type="password" name="confpassword" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label d-block">You are a:</label>

                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="role" value="Customer" required>
                                <label class="form-check-label">Customer</label>
                            </div>

                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="role" value="Admin" required>
                                <label class="form-check-label">Admin</label>
                            </div>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary">
                                Register
                            </button>
                        </div>

                    </form>

                </div>

                <div class="card-footer text-center">
                    <small class="text-muted">
                        Already Registered?
                        <a href="<%=request.getContextPath()%>/views/login.jsp">
                            Login Here
                        </a>
                    </small>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>