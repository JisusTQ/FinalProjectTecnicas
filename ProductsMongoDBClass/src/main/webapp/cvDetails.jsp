<%@page import="com.mycompany.resumesmongodbclass.models.CV"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CV Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
        %>
        <div class="container mt-5 ">
            <div class="row mb-4">
                <div class="col-md-4 text-center">
                    <img src="<%=cv.getPhoto()%>" class="rounded-circle img-fluid" alt="Foto de perfil">
                </div>
                <div class="col-md-8">
                    <h1><%=cv.getName()%></h1>
                    <p class="lead">Ingeniero de Software</p>
                    <p><strong>ID: </strong><%=cv.getId()%></p>
                    <p><strong>Email: </strong><%=cv.getEmail()%></p>
                    <p><strong>Phone: </strong><%=cv.getPhone()%></p>
                    <p><strong>Address: </strong><%=cv.getAddress()%></p>
                    <a class="btn btn-danger mt-3 px-3"  data-toggle="modal" data-target="#deleteModal">Delete CV</a>               
                    <a href="/ResumesMongoDBClass/index?id=<%=cv.getId()%>&actionCv=Edit" class="btn btn-primary mt-3 px-3">Edit CV</a>
                </div>
            </div>
            <div class="mb-4">
                <h2>Experience</h2>
                <div class="card mb-3">
                    <div class="card-body">
                        <p><%=cv.getExperience()%></p>
                    </div>
                </div>
            </div>

            <div class="mb-4">
                <h2>Skills</h2>
                <div class="card mb-3">
                    <div class="card-body">
                        <p><%=cv.getSkills()%></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Delete <%=cv.getName()%>'s CV</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h4>Are you sure?</h4>
                        <a  class="btn btn-dark mt-3 px-3 float-left" data-dismiss="modal" aria-label="Close"">Cancel</a>
                        <a href="/ResumesMongoDBClass/index?id=<%=cv.getId()%>&actionCv=Delete" class="btn btn-danger mt-3 px-3 float-right">Delete</a>

                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
