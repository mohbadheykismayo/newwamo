﻿<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="crudneighbourhoods.aspx.cs" Inherits="waamowaste.crudneighbourhoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
     #datatable{
         font-size: 2em;
     }
         #waax{
        font-size: 2em;
    }
 </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <!-- Modal -->
<div class="modal fade" id="stockmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel1">Ku Dar waax , Kana Badal</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

  

<div class="card">
<div class="card-body">
<div class="row">
        <input id="id1" style="display:none"/>
<div class="col-lg-4 col-sm-6 col-12" id="dropee">
<div class="form-group">
<label> Xaafada</label>
<select class="select form-control" id="itemdrop">

</select>
       <small id="xafad1" class="text-danger"></small>
</div>
</div>
<div class="col-lg-4 col-sm-6 col-12" id="qtydropee">
<div class="form-group">
<label>Waax</label>
<input type="text" id="wax">
        <small id="wax1" class="text-danger"></small>
</div>
</div>



  


<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn1" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn1" class="btn btn-submit me-2" onclick="updateitemstock()">edit</a>
      <a href="javascript:void(0);" id="editbtn11" class="btn btn-submit me-2" onclick="updatewax()">edit</a>
    
<a href="javascript:void(0);" id="submitbtn1" class="btn btn-submit me-2" onclick="submitwax()">Submit</a>
<a href="categorylist.html" class="btn btn-cancel" data-bs-dismiss="modal">Cancel</a>
</div>
</div>
</div>
</div>

      </div>
     <%-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>--%>
    </div>
  </div>
</div>


<%--    this is the modal--%>

<!-- Modal -->
<div class="modal fade" id="catmodal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Ku Dar Xaafad</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
    <div class="page-header">
<div class="page-title">

</div>
</div>

<div class="card">
<div class="card-body">
<div class="row">
<div class="col-lg-6 col-sm-6 col-12">
<div class="form-group">
    <input hidden type="text" id="id">
<label>Magaca Xaafada</label>
<input type="text" id="catname">
    <small id="nameError" class="text-danger"></small>
</div>
</div>


<div class="col-lg-12">
        <a href="javascript:void(0);" id="deletebtn" class="btn btn-submit me-2" onclick="deletecategory()">delete</a>
    <a href="javascript:void(0);" id="editbtn" class="btn btn-submit me-2" onclick="updatexafad()">edit</a>
<a href="javascript:void(0);" id="submitbtn" class="btn btn-submit me-2" onclick="submitxafad()">Submit</a>
<a href="categorylist.html" class="btn btn-cancel" data-bs-dismiss="modal">Cancel</a>
</div>
</div>
</div>
</div>
      </div>
     <%-- <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Understood</button>
      </div>--%>
    </div>
  </div>
</div>


    <div class="row">
        <div class="col-lg-8 col-md-8">
            <div class="page-header">
<div class="page-title">
<h2 class="text-success">Xaafadaha List </h2>

</div>
<div class="page-btn">
<a href="#" class="btn btn-success" onclick="callmodal()">
<img src="assets/img/icons/plus.svg" class="me-1" alt="img">Add Xaafad
</a>
</div>
</div>

<div class="card">
<div class="card-body">




<div class="table-responsive">
<table class="table  " id="datatable">
<thead class=" text-white">
<tr class="text-white">

<th>Magaca Xaafada</th>


<th>Ficil</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
</div>
</div>
</div>
        </div>
         <div class="col-lg-8 col-md-8">
                         <div class="page-header">
<div class="page-title">
<h2 class="text-success"> Xaafadaha iyo Waaxyaha List </h2>

</div>
<div class="page-btn">
<a href="#" class="btn btn-success" onclick="callwaaxmodel()">
<img src="assets/img/icons/plus.svg" class="me-1" alt="img">Add waax
</a>
</div>
</div>

<div class="card">
<div class="card-body">




<div class="table-responsive">
<table class="table  " id="waax">
<thead>
<tr>

<th> Xaafada</th>
    <th> Waaxda</th>

<th>Ficil</th>
</tr>
</thead>
<tbody>

</tbody>
</table>
</div>
</div>
</div>
 </div>
    </div>

    <script src="assets/js/jquery-3.6.0.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
<script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script>
        

        datadisplay();
        function datadisplay() {
            $.ajax({
                url: 'crudneighbourhoods.aspx/datadisplay',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)

                
                    $("#datatable tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var id = response.d[i].id;
                        var magaca = response.d[i].magaca;

                    



                        $("#datatable tbody").append(
                            "<tr>" +
                    
                            "<td>" + magaca + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + id + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + id + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>' +
                            "</td>" +
                            "</tr>"
                        );
                    }


                    // Initialize DataTable with search, pagination, and export buttons
                    $("#datatable").DataTable({
                        destroy: true,  // Destroy any existing instance before re-initializing
                        dom: 'Bfrtip',  // Define the placement of buttons and the search box
                        buttons: [
                            'excelHtml5',  // Export to Excel
                            'print'        // Print button
                        ],
                        paging: true,       // Enable pagination
                        pageLength: 10,     // Default number of rows per page
                        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                        responsive: true    // Make the table responsive
                    });
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

        function submitxafad() {
            // Clear previous error messages
            document.getElementById('nameError').textContent = "";
    



            var catname = $("#catname").val();

        

            // Validate the form values
            let isValid = true;

            if (catname.trim() === "") {
                document.getElementById('nameError').textContent = "Please enter the  name.";
                isValid = false;
            }






            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'crudneighbourhoods.aspx/addxaafad',
                    data: "{ 'catname':'" + catname + "'}",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'POST',
                    success: function (response) {
                        console.log(response);
                        if (response.d === 'true') {
                            Swal.fire(
                                'Successfully Saved!',
                                'You added a new Xaafad!',
                                'success'
                            );
                            $('#catmodal').modal('hide');
                            clearInputFields(); 
                            datadisplay();
                            getxafad();

                        } else {
                            // Handle errors in the response
                            Swal.fire({
                                icon: 'error',
                                title: 'Data Insertion Failed',
                                text: 'There was an error while inserting the data.',
                            });
                        }
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });

            }

            function clearInputFields() {
                // Replace these lines with code to clear the input fields
                $("#catname").val('');
          
            }
        }

        function updatexafad() {
            // Clear previous error messages
            document.getElementById('nameError').textContent = "";




            var catname = $("#catname").val();

            var id = $("#id").val();



            // Validate the form values
            let isValid = true;

            if (catname.trim() === "") {
                document.getElementById('nameError').textContent = "Please enter the  name.";
                isValid = false;
            }






            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'crudneighbourhoods.aspx/editxafad',
                    data: "{'id':'" + id + "','catname':'" + catname + "' }",

                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        console.log(response);
                        $('#catmodal').modal('hide');
                        Swal.fire(
                            'Successfully Updated !',
                            'You Updated a new Xaafad!',
                            'success'
                        )
                    
                        clearInputFields();
                        datadisplay();
                        getxafad();
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });

            }

            function clearInputFields() {
                // Replace these lines with code to clear the input fields
                $("#catname").val('');

            }
        }



        $("#datatable").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var name = row.find("td:nth-child(1)").text();
  
            $("#id").val(id);
            $("#catname").val(name);

     
            document.getElementById('submitbtn').style.display = 'none';
            document.getElementById('editbtn').style.display = 'inline-block';
            document.getElementById('deletebtn').style.display = 'none';
            
            $('#catmodal').modal('show');



        });
      




        $("#datatable").on("click", ".delete-btn", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");



            // Clear previous error messages

            Swal.fire({
                title: 'Ma Hubtaa ?',
                text: "Ma Rabtaa Inaad Delete Gareeneyso ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, start it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Execute the AJAX request only if the user confirms
                    $.ajax({
                        url: 'crudneighbourhoods.aspx/deletexafad',
                        data: "{'id':'" + id + "'}",
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        type: 'POST',
                        success: function (response) {
                            console.log(response);
                            if (response.d === 'true') {
                                Swal.fire(
                                    'Successfully Deleted!',
                                    'You Deleted a Xaafad!',
                                    'success'
                                );
                                $('#stockmodal').modal('hide');

                                datadisplay();
                            } else {
                                // Handle errors in the response
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Data Insertion Failed',
                                    text: 'There was an error while inserting the stock data: ' + response.d,
                                });
                            }
                        },
                        error: function (response) {
                            Swal.fire({
                                icon: 'error',
                                title: 'AJAX Error',
                                text: 'An error occurred during the AJAX request: ' + response.responseText,
                            });
                        }
                    });
                }
            });



        });



        function callmodal() {
            document.getElementById('submitbtn').style.display = 'inline-block';
            document.getElementById('editbtn').style.display = 'none';
            document.getElementById('deletebtn').style.display = 'none';
            $("#catname").val('');
            $('#catmodal').modal('show');

        }











        //waaxyaha



        waax();
        function waax() {
            $.ajax({
                url: 'crudneighbourhoods.aspx/waax',
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)


                    $("#waax tbody").empty();

                    for (var i = 0; i < response.d.length; i++) {
                        var xafada = response.d[i].xafada;
                        var waaxdi = response.d[i].waaxdi;
                        var SubNeighborhoodID = response.d[i].SubNeighborhoodID;


             

                        $("#waax tbody").append(
                            "<tr>" +

                            "<td>" + xafada + "</td>" +
                            "<td>" + waaxdi + "</td>" +
                            "<td>" +
                            '<a class="me-3 edit-button" data-id="' + SubNeighborhoodID + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + SubNeighborhoodID + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>' +
                            "</td>" +
                            "</tr>"
                        );
                    }
                    // Initialize DataTable with search, pagination, and export buttons
                    $("#waax").DataTable({
                        destroy: true,  // Destroy any existing instance before re-initializing
                        dom: 'Bfrtip',  // Define the placement of buttons and the search box
                        buttons: [
                            'excelHtml5',  // Export to Excel
                            'print'        // Print button
                        ],
                        paging: true,       // Enable pagination
                        pageLength: 10,     // Default number of rows per page
                        lengthMenu: [[10, 25, 50, -1], [10, 25, 50, "All"]],
                        responsive: true    // Make the table responsive
                    });

                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }


        function callmodal() {
            document.getElementById('submitbtn').style.display = 'inline-block';
            document.getElementById('editbtn').style.display = 'none';
            document.getElementById('deletebtn').style.display = 'none';
            $("#catname").val('');
            $('#catmodal').modal('show');

        }


        function callwaaxmodel() {
            $('#stockmodal').modal('hide');
            document.getElementById('submitbtn1').style.display = 'inline-block';
            document.getElementById('editbtn1').style.display = 'none';
            document.getElementById('editbtn11').style.display = 'none';
            document.getElementById('deletebtn1').style.display = 'none';
            $("#wax").val('');
            $("#itemdrop").val('');
            $('#stockmodal').modal('show');

        }










        getxafad();

        function getxafad() {
            $.ajax({
                type: "POST",
                url: "crudneighbourhoods.aspx/getxafad",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var itemdrop = $("[id*=itemdrop]");
                    itemdrop.empty().append('<option selected="selected" value="0">Please select</option>');
                    $.each(r.d, function () {
                        itemdrop.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }




        function submitwax() {
            // Clear previous error messages
            document.getElementById('wax1').textContent = "";

            document.getElementById('xafad1').textContent = "";

            var xafad = $("#itemdrop").val();
            var wax = $("#wax").val();


            // Validate the form values
            let isValid = true;

            if (wax.trim() === "") {
                document.getElementById('wax1').textContent = "Please enter the  waax.";
                isValid = false;
            }

      




            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'crudneighbourhoods.aspx/addwax',
                    data: "{ 'wax':'" + wax + "', 'xafad':'" + xafad + "'}",
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    type: 'POST',
                    success: function (response) {
                        console.log(response);
                        if (response.d === 'true') {
                            Swal.fire(
                                'Successfully Saved!',
                                'You added a new wax!',
                                'success'
                            );
                            $('#stockmodal').modal('hide');
                            clearInputFields();
                            datadisplay();
                            waax();

                        } else {
                            // Handle errors in the response
                            Swal.fire({
                                icon: 'error',
                                title: 'Data Insertion Failed',
                                text: 'There was an error while inserting the data.',
                            });
                        }
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });

            }

            function clearInputFields() {
                // Replace these lines with code to clear the input fields
                $("#catname").val('');

            }
        }




        $("#waax").on("click", ".edit-button", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");


            var name = row.find("td:nth-child(2)").text();

            $("#id1").val(id);
            $("#wax").val(name);

            document.getElementById('submitbtn1').style.display = 'none';
            document.getElementById('editbtn1').style.display = 'none';
            document.getElementById('editbtn11').style.display = 'inline-block';
            document.getElementById('deletebtn1').style.display = 'none';

            $('#stockmodal').modal('show');



        });









        function updatewax() {
      


            // Clear previous error messages
            document.getElementById('wax1').textContent = "";

            document.getElementById('xafad1').textContent = "";

            var xafad = $("#itemdrop").val();
            var wax = $("#wax").val();
            var id = $("#id1").val();


            // Validate the form values
            let isValid = true;

            if (wax.trim() === "") {
                document.getElementById('wax11').textContent = "Please enter the  waax.";
                isValid = false;
            }




            // If all validations pass, proceed with AJAX call
            if (isValid) {

                $.ajax({
                    url: 'crudneighbourhoods.aspx/editwax',
                    data: "{'id':'" + id + "','wax':'" + wax + "','xafad':'" + xafad + "' }",

                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        console.log(response);
                        $('#stockmodal').modal('hide');
                        Swal.fire(
                            'Successfully Updated !',
                            'You Updated a new waax!',
                            'success'
                        )

                        clearInputFields();
                        datadisplay();

                        waax();
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });

            }

            function clearInputFields() {
                // Replace these lines with code to clear the input fields
                $("#wax").val('');
                $("#itemdrop").val('');
                

            }
        }









        $("#waax").on("click", ".delete-btn", function (event) {
            event.preventDefault(); // Prevent default behavior

            var row = $(this).closest("tr");
            var id = $(this).data("id");



            // Clear previous error messages

            Swal.fire({
                title: 'Ma Hubtaa ?',
                text: "Ma Rabtaa Inaad Delete Gareeneyso ?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes, start it!'
            }).then((result) => {
                if (result.isConfirmed) {
                    // Execute the AJAX request only if the user confirms
                    $.ajax({
                        url: 'crudneighbourhoods.aspx/deletewaax',
                        data: "{'id':'" + id + "'}",
                        contentType: 'application/json; charset=utf-8',
                        dataType: 'json',
                        type: 'POST',
                        success: function (response) {
                            console.log(response);
                            if (response.d === 'true') {
                                Swal.fire(
                                    'Successfully Deleted!',
                                    'You Deleted a waax!',
                                    'success'
                                );
                                $('#stockmodal').modal('hide');

                                datadisplay();

                                waax();
                            } else {
                                // Handle errors in the response
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Data Insertion Failed',
                                    text: 'There was an error while inserting the stock data: ' + response.d,
                                });
                            }
                        },
                        error: function (response) {
                            Swal.fire({
                                icon: 'error',
                                title: 'Lama Tuuri Karo',
                                text: 'An error occurred during the AJAX request: ',
                            });
                        }
                    });
                }
            });



        });



    </script>
</asp:Content>
