<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5 text-center">
    
    <div class="card shadow p-4">
        
        <h2 class="text-success mb-3">✅ Order Placed Successfully!</h2>
        
        <p class="lead">
            Thank you for shopping with <strong>Green Cart</strong> 🌿
        </p>
        
        <a href="<%=request.getContextPath()%>/views/home.jsp"
           class="btn btn-success mt-3">
            Back to Home
        </a>
        
    </div>
    
</div>

</body>
</html>