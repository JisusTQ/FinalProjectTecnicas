<%@page import="com.mycompany.resumesmongodbclass.models.CV"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CV Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%
            CV cv = (CV) request.getAttribute("cv");
            boolean isEdit = (cv != null);
        %>
        <div class="container">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <form method="POST" action="SvResumesMongoDB" class="border px-3 py-3 mt-5 rounded">
                        <input type="hidden" name="action" value="<%= isEdit ? "Edit" : "Create" %>">
                        <div class="form-group mb-3">
                            <label for="inputId">Id</label>
                            <input type="integer" class="form-control" id="inputId" name="inputId" aria-describedby="emailHelp" placeholder="Enter email" value="<%= isEdit ? cv.getId() : 0 %>">
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputName">Name</label>
                            <input type="text" class="form-control" id="inputName" name="inputName" placeholder="Enter name" value="<%= isEdit ? cv.getName() : "" %>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputEmail">Email address</label>
                            <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="Enter email" value="<%= isEdit ? cv.getEmail() : "" %>" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputPhone">Phone</label>
                            <input type="text" class="form-control" id="inputPhone" name="inputPhone" placeholder="Enter phone number" value="<%= isEdit ? cv.getPhone() : "" %>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputAddress">Address</label>
                            <input type="text" class="form-control" id="inputAddress" name="inputAddress" placeholder="Enter address" value="<%= isEdit ? cv.getAddress() : "" %>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputPhoto">Photo URL</label>
                            <input type="text" class="form-control" id="inputPhoto" name="inputPhoto" placeholder="Enter photo URL" value="<%= isEdit ? cv.getPhoto() : "" %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary my-3">Submit</button>
                    </form>
                </div>
                <div class="col-3"></div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
