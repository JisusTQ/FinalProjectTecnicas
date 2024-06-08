<%@page import="com.mycompany.resumesmongodbclass.models.CV"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CV Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/ResumesMongoDBClass/index">Home <span class="sr-only"></span></a>
                    </li>
                </ul>
            </div>
        </nav>
        <%
            CV cv = (CV) request.getAttribute("cv");
            boolean isEdit = (cv != null);
        %>
        <div class="container">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <form method="POST" action="SvResumesMongoDB" class="border px-3 py-3 mt-5 rounded">


                        <div class="mb-3 flex" >
                            <h5 class="modal-title text-center">CV Form</h5>
                        </div>
                        <input type="hidden" name="action" value="<%= isEdit ? "Edit" : "Create"%>">
                        <% String errorMessage = (String) request.getAttribute("errorMessage"); %>
                        <% if (errorMessage != null && !errorMessage.isEmpty()) {%>
                        <div class="alert alert-danger" role="alert">
                            <%= errorMessage%>
                        </div>
                        <% }%>
                        <% if (!isEdit) {%>
                        <div class="form-group mb-3">
                            <label for="inputId">Id <span style="color:red">*</span></label>
                            <input type="text" class="form-control" id="inputId" name="inputId" placeholder="Enter ID" required>
                        </div>
                        <% } else {%>
                        <input type="hidden" name="inputId" value="<%= cv.getId()%>">
                        <% }%>
                        <div class="form-group mb-3">
                            <label for="inputName">Name <span style="color:red">*</span></label>
                            <input type="text" class="form-control" id="inputName" name="inputName" placeholder="Enter name" value="<%= isEdit ? cv.getName() : ""%>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputEmail">Email address <span style="color:red">*</span></label>
                            <input type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="Enter email" value="<%= isEdit ? cv.getEmail() : ""%>" required>
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputPhone">Mobile <span style="color:red">*</span></label>
                            <input type="text" class="form-control" id="inputPhone" name="inputPhone" placeholder="Enter phone number" value="<%= isEdit ? cv.getPhone() : ""%>" pattern="\d{10,15}" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputAddress">Address <span style="color:red">*</span></label>
                            <input type="text" class="form-control" id="inputAddress" name="inputAddress" placeholder="Enter address" value="<%= isEdit ? cv.getAddress() : ""%>" required>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputPhoto">Photo URL <span style="color:red">*</span></label>
                            <input type="url" class="form-control" id="inputPhoto" name="inputPhoto" placeholder="Enter photo URL" value="<%= isEdit ? cv.getPhoto() : ""%>" required>
                        </div>  
                        <div class="form-group mb-3">
                            <label for="inputExperience">Experience <span style="color:red">*</span></label>
                            <textarea class="form-control" id="inputExperience" name="inputExperience" placeholder="Write about your laboral experience" id="TextareaExperience" style="height: 100px"></textarea>
                        </div>
                        <div class="form-group mb-3">
                            <label for="inputSkills">Skills <span style="color:red">*</span></label>
                            <textarea class="form-control" id="inputSkills" name="inputSkills" placeholder="Write about your professional skills" id="TextareaSkills" style="height: 100px"></textarea>
                        </div>
                        <a href="<%= isEdit ? "/ResumesMongoDBClass/index?id=" + cv.getId() : "/ResumesMongoDBClass/index"%>" class="btn btn-dark">Close</a>
                        <button type="submit" class="btn btn-primary float-right">Submit</button>
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    </body>
</html>
