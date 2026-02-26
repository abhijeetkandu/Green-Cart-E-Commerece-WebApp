<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body class="bg-light d-flex align-items-center justify-content-center" style="height:100vh;">

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">

            <div class="card shadow-lg">
                <div class="card-header bg-dark text-white text-center">
                    <h4 class="mb-0">Admin Login</h4>
                </div>

                <div class="card-body">

                    <form action="<%=request.getContextPath()%>/adminLogin" method="post">

                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text"
                                   name="adminName"
                                   class="form-control"
                                   placeholder="Enter Username"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password"
                                   name="adminPass"
                                   class="form-control"
                                   placeholder="Enter Password"
                                   required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-dark">
                                Login
                            </button>
                        </div>

                    </form>

                </div>

                <div class="card-footer text-center">
                    <small class="text-muted">E-Commerce Admin Panel</small>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>