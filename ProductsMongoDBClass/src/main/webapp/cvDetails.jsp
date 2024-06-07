<%-- 
    Document   : productDetails
    Created on : 16/05/2024, 7:25:02 p. m.
    Author     : Usuario
--%>

<%@page import="com.mycompany.productsmongodbclass.models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <%
            Product product = (Product) request.getAttribute("product");
        %>
        <div class="container">
            <div class="row">
                <div class="col-3"></div>
                <div class="col-6">
                    <form method="POST" action="SvProductsMongoDB" class="border px-3 py-3 mt-5 rounded">
                        <div class="row align-items-center">
                            <div class="col-2">
                                <label for="inputId" class="form-label">Id</label>
                                <input type="text" class="form-control" id="inputId" name="inputId" value="<%=product.getId()%>" aria-describedby="Id">
                            </div>
                            <div class="col-10">
                                <label for="inputTitle" class="form-label">Title</label>
                                <input type="text" class="form-control" id="inputTitle" name="inputTitle" value="<%=product.getTitle()%>" aria-describedby="Title ">
                            </div>
                        </div>
                        <div class="row align-items-center mt-3">
                            <div class="col-4">
                                <label for="inputPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="inputPrice" name="inputPrice" value="<%=product.getPrice()%>" aria-describedby="Price ">
                            </div>
                            <div class="col-4">
                                <label for="inputDiscount" class="form-label">Discount</label>
                                <input type="number" class="form-control" id="inputDiscount" name="inputDiscount" value="<%=product.getDiscountPercentage()%>" aria-describedby="Discount">
                            </div>
                            <div class="col-4">
                                <label for="inputRating" class="form-label">Rating</label>
                                <input type="number" class="form-control" id="inputRating" name="inputRating" value="<%=product.getRating()%>" aria-describedby="Rating">
                            </div>
                        </div>
                        <div class="row align-items-center mt-3">
                            <div class="col-6">
                                <label for="inputBrand" class="form-label">Brand</label>
                                <input type="text" class="form-control" id="inputBrand" name="inputBrand" value="<%=product.getBrand()%>" aria-describedby="Brand ">
                            </div>
                            <div class="col-6">
                                <label for="inputCategory" class="form-label">Category</label>
                                <input type="text" class="form-control" id="inputCategory" name="inputCategory" value="<%=product.getCategory()%>" aria-describedby="Brand">
                            </div>
                        </div>
                        <div class="row align-items-center mt-3">
                            <div class="col-12">
                                <label for="inputDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="inputDescription" name="inputDescription"><%=product.getDescription()%></textarea>
                            </div>
                        </div>
                        <div class="row align-items-center mt-3 px-2">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">Save</button>
                        </div>
                        <div class="row align-items-center mt-1 px-2">
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">Delete</button>
                         </div>
                        <div class="row align-items-center mt-1 px-2">
                            <a class="btn btn-secondary" href="/ProductsMongoDBClass/index" role="button">Cancel</a>
                        </div>

                        <!-- Modal Edit products -->
                        <div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="editModalLabel">Edit Products</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Quiere editar el producto?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Modal delete products -->
                        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="deleteModalLabel">Delete Products</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        Quiere eliminar el producto?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                        <a class="btn btn-danger" href="/ProductsMongoDBClass/index?idProduct=<%=product.getId()%>&actionProduct=Delete" role="button">Delete</a>
                                    </div>
                                </div>
                            </div>
                        </div>

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
