<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<form:form action="/Admin/Table/Save" modelAttribute="pd" method="post" enctype="multipart/form-data" >
 
    <div class="form-group">
        <label>Name</label>
        <form:input type="password" class="form-control" path="name"
                    placeholder="Enter password" />
    </div>
    <label>Photo</label>
    <input type="file" class="form-control" name="photo"
           accept="image/png,image/jpeg" />

    <div class="form-group">
        <label>Quantity</label>
        <form:input type="text" class="form-control" path="quantity"
                    placeholder="Quantity" />
    </div>
    <div class="form-group">
        <label>Price</label>
        <form:input type="number" class="form-control" path="price"
                    placeholder="price" />
    </div>
    <div class="form-group">
        <label>About</label>
        <form:input type="text" class="form-control" path="about"
                    placeholder="About" />
    </div>

    <div class="form-group">
        <label>Discount</label>
        <form:input type="text" class="form-control" path="discount"
                    placeholder="Discount" />
    </div>
  


    <div class="form-group">
        <label>available</label>
        <form:input type="text" class="form-control"
                   path="available"/>
    </div>
    <div class="form-group">
        <label>category id</label>
        <form:input type="text" class="form-control"
                     path="category.id"/>
    </div>

    <form:button type="submit" class="btn btn-primary">Submit</form:button>
    <form:button type="reset" class="btn btn-primary">Cancel</form:button>
    <a href="/Admin/Table/Save" class="btn btn-primary">Display Account</a>
    <h>${message}</h>
</form:form>