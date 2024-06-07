<%@page import="com.mycompany.resumesmongodbclass.models.CV"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset='utf-8'>
        <title>Resumes</title>
        <link rel="stylesheet" href="styles/dataTables.dataTables.css">
        <script src="scripts/jquery-3.7.1.min.js"></script>
        <script src="scripts/dataTables.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

        <style>
            .card:hover {
                transform: scale(1.05);
                transition: transform 0.2s ease-in-out;
            }

            .navbar-brand-img {
                width: 50px;
                height: auto;
            }

            .card-img {
                height: 190px;
                width: 286px;
            }
        </style>
    </head>
    <body class="d-flex flex-column min-vh-100">
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

        <main class="flex-fill container my-3 ">
            <h1 class="float-left">Resumes</h1>
            <a href="/ResumesMongoDBClass/index?actionCv=Create" class="btn btn-primary float-right">Create CV</a>
            <br>
            <%
                List<CV> cvs = (List<CV>) request.getAttribute("cvs");
                if (cvs != null && cvs.size() > 0) {
            %>
            <div class="container mt-5 pb-3 border">
                <div class="row d-flex flex-wrap">
                    <%
                        for (CV cv : cvs) {
                    %>
                    <div class="col-md-3 d-flex align-items-stretch">
                        <div class="card" style="width: 18rem; margin-top: 20px">
                            <img src="<%=cv.getPhoto()%>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%=cv.getName()%></h5>
                                <h6 class="card-title"><%=cv.getEmail()%></h6>
                                <h6 class="card-title"><%=cv.getPhone()%></h6>
                                <a class="btn btn-danger float-right" style="color: white" data-toggle="modal" data-target="#deleteModal<%=cv.getId()%>">Delete CV</a>
                                <a href="/ResumesMongoDBClass/index?id=<%=cv.getId()%>" class="btn btn-primary float-right">Show Details</a>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="deleteModal<%=cv.getId()%>" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
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
                                    <a  class="btn btn-dark mt-3 px-3 float-left" style="color: white" data-dismiss="modal" aria-label="Close"">Cancel</a>
                                    <a href="/ResumesMongoDBClass/index?id=<%=cv.getId()%>&actionCv=Delete" class="btn btn-danger mt-3 px-3 float-right">Delete</a>

                                </div>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>
                </div>
            </div>
            <%
                }
            %>

        </main>

        <footer class="m-200 mt-20 text-center bg-body-tertiary">
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
                Made by:
                <br>
                Jesus Estiven Torres Quintero - Ana Maria Granada Rodas
            </div>
        </footer>
        <script>new DataTable('#tblCvs');</script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>