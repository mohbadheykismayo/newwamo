<%@ Page Title="" Language="C#" MasterPageFile="~/theUser.Master" AutoEventWireup="true" CodeBehind="userreport.aspx.cs" Inherits="waamowaste.userreport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


            <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="assets/css/custom.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" />
    
    <style>
        .font-weight-bold {
    font-weight: bold;
}

        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .page-header {
            padding: 20px;
            text-align: center;
            background-color: #007bff;
            color: white;
            margin-bottom: 20px;
            border-radius: 5px;
        }
        .action-buttons {
            display: flex;
       justify-content: space-between;
            margin-bottom: 15px;
        }
        .action-buttons .btn {
            margin-right: 10px;
        }
        .table-responsive {
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
        }
        .table thead th {
            background-color:#0a7df0;
            color: white;
           text-align: center;
        }
        .table tbody td {
            text-align: center;
            vertical-align: middle;
        }
        .edit-button img, .delete-btn img {
            cursor: pointer;
            transition: transform 0.3s;
        }
        .edit-button img:hover, .delete-btn img:hover {
            transform: scale(1.1);
        }
        .dataTables_wrapper .dataTables_filter input {
            border-radius: 20px;
            padding: 5px 15px;
            border: 1px solid #007bff;
        }
        .dataTables_wrapper .dataTables_length select {
            border-radius: 20px;
            padding: 5px;
            border: 1px solid #007bff;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            border-radius: 50%;
            border: none;
            padding: 8px;
            background-color: #049162;
            color: white;
            margin: 2px;
            transition: background-color 0.3s;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
            background-color: #0056b3;
        }
        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background-color: #049162;
            color: white;
        }
        /* Style the Select2 container to be more prominent */
.select2-container--bootstrap-5 .select2-selection--single {
    height: 38px; /* Matches typical form-control height */
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
}

.select2-container--bootstrap-5 .select2-selection__rendered {
    line-height: 36px; /* Centers text vertically */
    color: #495057;
}

.select2-container--bootstrap-5 .select2-selection__arrow {
    height: 38px;
    top: 0;
    right: 10px;
}

/* Optional: Increase search input padding for better appearance */
.select2-search--dropdown .select2-search__field {
    padding: 8px;
    border: 1px solid #ced4da;
}

    </style>

<style>
  /* Modal Styles for #tabModal */
  #tabModal .modal-lg {
      max-width: 95vw;
      height: auto;
  }
  .is-invalid {
    border-color: red;
}


  #tabModal .modal-content {
      border-radius: 15px;
      box-shadow: 0 15px 50px rgba(0, 0, 0, 0.3);
      background-color: #f9f9f9;
      height: 90vh; /* Make modal occupy 90% of the viewport height */
  }

  #tabModal .modal-header {
      background: linear-gradient(45deg, #007bff, #6610f2);
      color: white;
      padding: 1.5rem;
      border-bottom: none;
      border-top-left-radius: 15px;
      border-top-right-radius: 15px;
  }

  #tabModal .modal-title {
      font-size: 2rem;
      font-weight: 700;
  }

  #tabModal .modal-body {
      padding: 0;
      height: 100%;
      display: flex;
      flex-direction: column;
  }

  /* Tabs Styling */
  #tabModal .nav-tabs {
      margin: 1rem;
  }

  #tabModal .nav-tabs .nav-link {
      color: #007bff;
      font-weight: 600;
      border-radius: 30px;
      padding: 0.75rem 1.5rem;
  }

  #tabModal .nav-tabs .nav-link.active {
      background-color: #007bff;
      color: white;
      border-radius: 30px;
      box-shadow: 0 5px 15px rgba(0, 123, 255, 0.5);
  }

  /* Responsive Content Container */
  #tabModal .tab-content {
      flex-grow: 1;
      overflow: hidden;
  }

  /* Table Styles */
  #tabModal .table-responsive {
      height: 100%;
      display: flex;
      justify-content: center;
      align-items: center;
  }

  #tabModal .table {
      width: 100%;
      height: 100%;
      margin: 0;
      overflow-y: auto;
  }

  #tabModal .table th, #tabModal .table td {
      padding: 1rem;
      text-align: center;
  }


  #tabModal .table thead {
      background-color: #007bff;
      color: white;
      font-weight: 700;
  }


  /* Map Container */
  #map-container {
      width: 100%;
      height: 100%;
      overflow: hidden;
  }
  /* Map Container */
#map-container1 {
    width: 100%;
    height: 100%;
    overflow: hidden;
}

#map-container2 {
    width: 100%;
    height: 100%;
    overflow: hidden;
}

  #map {
      width: 100%;
      height: 100%;
  }


  /* Map iframe responsive */
  .map-responsive iframe {
      width: 100%;
      height: 100%;
      border: 0;
  }



      #datatable th {

        color: #ffffff !important; /* Force text color for print */

    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


            <div class="container-fluid">
        <div class="page-header bg-success">
            <h1>User Report   Section</h1>
        </div>
        <div class="action-buttons">
      

            <div>
                                  <!-- Total Amount Card -->
  </div>

            <div>
                <button class="btn btn-success" onclick="printTable()">Print </button>

            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-hover" id="datatable">
                <thead class="text-white">
                    <tr   class="text-white">
                        <th>Fullname</th>
                        <th>House Number</th>
                        <th>Neighborhood</th>
                        <th>Sub-Neighborhood</th>
                        <th>Phone Number</th>
                             <th>Employee Name</th>
              
                        <th>Amount</th>
               
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>


    <h1 style="display:none" id="waxda"></h1>

    
    <script src="assets/js/jquery-3.6.0.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>--%>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="assets/plugins/select2/js/select2.min.js"></script>
    

    <script>
        function printTable() {
            event.preventDefault();
            var table = $('#datatable').DataTable(); // Access the DataTable instance
            var data = table.rows({ search: 'applied' }).data(); // Get rows currently displayed in the table

            //// Retrieve header values
            //var location = document.getElementById("wax").innerText;
            //var date = document.getElementById("dte").innerText;
            //var status = document.getElementById("st").innerText;

            // Create a printable HTML template
            var printContent = `
        <html>
        <head>
            <title>Printable Report</title>
            <style>
                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    margin: 0;
                    padding: 0;
                    color: #333;
                }
                .header {
                    text-align: center;
                    padding: 15px;
                    background-color: #f1f1f1;
                    margin-bottom: 10px;
                    border-bottom: 2px solid #007bff;
                }
                .header h3 {
                    margin: 5px 0;
                    font-size: 16px; /* Smaller heading size */
                    color: #007bff;
                }
                .header .sub-text {
                    font-size: 14px;
                    color: #555;
                }
                table {
                    width: 90%;
                    margin: 20px auto;
                    border-collapse: collapse;
                    font-size: 10px; /* Smaller font for table content */
                    background: white;
                }
                th, td {
                    padding: 5px 8px; /* Smaller padding */
                    text-align: left;
                    border: 1px solid #ddd; /* Visible table lines */
                }
                th {
                    background-color: #007bff;
                    color: white;
                    font-weight: bold;
                    font-size: 12px; /* Smaller header text */
                }
                tr:nth-child(even) {
                    background-color: #f9f9f9;
                }
                tr:hover {
                    background-color: #f1f1f1;
                }
                .footer {
                    text-align: center;
                    font-size: 12px;
                    color: #666;
                    margin-top: 30px;
                }
            </style>
        </head>
        <body>
            <div class="header">
   
            </div>
            <table>
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>House Number</th>
                        <th>Neighborhood Name</th>
                        <th>SubNeighborhood Name</th>
                        <th>Contact Number</th>
                          <th>Employee Name</th>
                        <th>Due Amount</th>
                    </tr>
                </thead>
                <tbody>`;

            // Loop through the DataTable data and add rows
            for (var i = 0; i < data.length; i++) {
                printContent += `
            <tr>
                <td>${data[i][0]}</td>
                <td>${data[i][1]}</td>
                <td>${data[i][2]}</td>
                <td>${data[i][3]}</td>
                <td>${data[i][4]}</td>
                <td>${data[i][5]}</td>
                   <td>${data[i][6]}</td>
            </tr>`;
            }

            printContent += `
                </tbody>
            </table>
            <div class="footer">
                <hr>
                <p>Generated by Waamp_ Waste</p>
                <p>&copy; ${new Date().getFullYear()} KismayoICT. All rights reserved.</p>
            </div>
        </body>
        </html>`;
            // Open a new window to print the content
            var printWindow = window.open('', '', 'height=600,width=800');
            printWindow.document.write(printContent);
            printWindow.document.close();
            printWindow.print();
        }














        datadisplay1();
        function datadisplay1() {
            var id = document.getElementById('Label8').textContent;

            $.ajax({
                url: 'userpayments.aspx/datadisplay',
                data: "{'id':'" + id + "'}",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)
                    var datatable = $('#datatable').DataTable();
                    datatable.clear();
                    for (var i = 0; i < response.d.length; i++) {
                        var NeighborhoodName = response.d[i].NeighborhoodName;
                        var SubNeighborhoodName = response.d[i].SubNeighborhoodName;
                        var HouseNumber = response.d[i].HouseNumber;
                        var IsActive = response.d[i].IsActive;
                        var fullname = response.d[i].fullname;
                        var number = response.d[i].number;
                        var HouseID = response.d[i].HouseID;


                        var amount = response.d[i].amount;
                        var DueAmount = response.d[i].DueAmount;
                        var PaymentStatusID = response.d[i].PaymentStatusID;

                        var shaqaale = response.d[i].shaqaale;

                        if (Math.abs(DueAmount) < 0.01) {
                            DueAmount = "Paid";
                        }
                        // Determine the text color and bold for Paid
                        var dueAmountClass = (DueAmount === "Paid") ? "text-success font-weight-bold" : "text-danger";









                        datatable.row.add([
                            fullname,
                            HouseNumber,
                            NeighborhoodName,
                            SubNeighborhoodName,
                            number,
                            shaqaale,
                            `<span class="${dueAmountClass}">${DueAmount}</span>`,
                            '<a class="me-3 edit-button" data-id="' + HouseNumber + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + HouseNumber + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>'
                        ]).draw();
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });
        }

























        //       datadisplay();
        //function datadisplay() {
        //    $.ajax({
        //        url: 'paymentga.aspx/datadisplay',
        //        dataType: "json",
        //        type: 'POST',
        //        contentType: "application/json",
        //        success: function (response) {
        //            console.log(response); // Debug: Log the response

        //            // Clear the DataTable
        //            var datatable = $('#datatable').DataTable();
        //            datatable.clear();

        //            // Check if data is empty
        //            if (response.d.length === 0) {
        //                // Add a row with empty cells (same number of columns as the table)
        //                datatable.row.add([
        //                    '', '', 'No records to display', '', '', '', ''  // Empty cells plus message, 6 columns
        //                ]).draw();
        //            } else {
        //                // Populate the DataTable with new data
        //                for (var i = 0; i < response.d.length; i++) {
        //                    var NeighborhoodName = response.d[i].NeighborhoodName;
        //                    var SubNeighborhoodName = response.d[i].SubNeighborhoodName;
        //                    var HouseNumber = response.d[i].HouseNumber;
        //                    var fullname = response.d[i].fullname;
        //                    var number = response.d[i].number;
        //                    var DueAmount = response.d[i].DueAmount;
        //                    var shaqaale = response.d[i].shaqaale;







        //                    if (Math.abs(DueAmount) < 0.01) {
        //                        DueAmount = "Paid";
        //                    }
        //                    var dueAmountClass = (DueAmount === "Paid") ? "text-success font-weight-bold" : "text-danger";


        //                    datatable.row.add([
        //                        fullname,
        //                        HouseNumber,
        //                        NeighborhoodName,
        //                        SubNeighborhoodName,
        //                        number,
        //                        shaqaale,
        //                        `<span class="${dueAmountClass}">${DueAmount}</span>`
        //                    ]).draw();
        //                }
        //            }
        //        },
        //        error: function (response) {
        //            alert(response.responseText);
        //        }
        //    });
        //}




        $("#date1").on("change", function () {
            const selectedDate = $(this).val(); // Get the selected date
            $("#dte").text(selectedDate ? selectedDate : "None"); // Update the display
        });









        $("#stt").on("change", function () {
            const id1 = $(this).val(); // Get the selected date
            var id = document.getElementById('Label8').textContent;
            alert(id);


            $.ajax({
                url: 'userreport.aspx/datadisplay',
                data: "{'id':'" + id + "', 'id1':'" + id1 + "'}",
                dataType: "json",
                type: 'POST',
                contentType: "application/json",
                success: function (response) {
                    console.log(response)
                    var datatable = $('#datatable').DataTable();
                    datatable.clear();
                    for (var i = 0; i < response.d.length; i++) {
                        var NeighborhoodName = response.d[i].NeighborhoodName;
                        var SubNeighborhoodName = response.d[i].SubNeighborhoodName;
                        var HouseNumber = response.d[i].HouseNumber;
                        var IsActive = response.d[i].IsActive;
                        var fullname = response.d[i].fullname;
                        var number = response.d[i].number;
                        var HouseID = response.d[i].HouseID;


                        var amount = response.d[i].amount;
                        var DueAmount = response.d[i].DueAmount;
                        var PaymentStatusID = response.d[i].PaymentStatusID;

                        var shaqaale = response.d[i].shaqaale;

                        if (Math.abs(DueAmount) < 0.01) {
                            DueAmount = "Paid";
                        }
                        // Determine the text color and bold for Paid
                        var dueAmountClass = (DueAmount === "Paid") ? "text-success font-weight-bold" : "text-danger";









                        datatable.row.add([
                            fullname,
                            HouseNumber,
                            NeighborhoodName,
                            SubNeighborhoodName,
                            number,
                            shaqaale,
                            `<span class="${dueAmountClass}">${DueAmount}</span>`,
                            '<a class="me-3 edit-button" data-id="' + HouseNumber + '">' +
                            '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                            '</a>' +
                            '<a class="me-3 delete-btn" data-id="' + HouseNumber + '">' +
                            '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                            '</a>'
                        ]).draw();
                    }
                },
                error: function (response) {
                    alert(response.responseText);
                }
            });


















            $("#st").text(selectedText);
        });






















        getxafad();

        function getxafad() {
            $.ajax({
                type: "POST",
                url: "myincome.aspx/getxafad",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var itemdrop = $("[id*=waxid]");
                    itemdrop.empty().append('<option selected="selected" value="">Xaafadaha Dhan</option>');
                    $.each(r.d, function () {
                        itemdrop.append($("<option></option>").val(this['Value']).html(this['Text']));
                    });
                }
            });
        }















        $(document).ready(function () {
            $('#waxid').change(function () {
                var id = $(this).val();
                const selectedText = $("#waxid option:selected").text();
                $("#wax").text(selectedText);
                $("#waxda").text(id);
                $.ajax({
                    url: 'myincome.aspx/datadisplay',
                    data: "{'id':'" + id + "'}",
                    dataType: "json",
                    type: 'POST',
                    contentType: "application/json",
                    success: function (response) {
                        console.log(response)



                        $("#datatable tbody").empty();

                        var datatable = $('#datatable').DataTable();
                        datatable.clear();
                        for (var i = 0; i < response.d.length; i++) {
                            var NeighborhoodName = response.d[i].NeighborhoodName;
                            var SubNeighborhoodName = response.d[i].SubNeighborhoodName;
                            var HouseNumber = response.d[i].HouseNumber;
                            var IsActive = response.d[i].IsActive;
                            var fullname = response.d[i].fullname;
                            var number = response.d[i].number;
                            var HouseID = response.d[i].HouseID;
                            var shaqaale = response.d[i].shaqaale;
                            

                            var amount = response.d[i].amount;
                            var DueAmount = response.d[i].DueAmount;
                            var PaymentStatusID = response.d[i].PaymentStatusID;

                            if (Math.abs(DueAmount) < 0.01) {
                                DueAmount = "Paid";
                            }
                            // Determine the text color and bold for Paid
                            var dueAmountClass = (DueAmount === "Paid") ? "text-success font-weight-bold" : "text-danger";


                            datatable.row.add([
                                fullname,
                                HouseNumber,
                                NeighborhoodName,
                                SubNeighborhoodName,
                                number,
                                shaqaale,
                                `<span class="${dueAmountClass}">${DueAmount}</span>`,
                                '<a class="me-3 edit-button" data-id="' + HouseNumber + '">' +
                                '<img src="assets/img/icons/edit.svg" alt="Edit">' +
                                '</a>' +
                                '<a class="me-3 delete-btn" data-id="' + HouseNumber + '">' +
                                '<img src="assets/img/icons/delete.svg" alt="Delete">' +
                                '</a>'
                            ]).draw();
                        }
                    },
                    error: function (response) {
                        alert(response.responseText);
                    }
                });




                $.ajax({
                    type: "POST",
                    url: "myincome.aspx/money",
                    data: "{'id':'" + id + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r);
                        var earnings = r.d;

                        // Check if values are valid numbers and convert if necessary
                        var TotalAmount = parseFloat(earnings[0].TotalAmount) || 0;
                        var TotalDueAmount = parseFloat(earnings[0].TotalDueAmount) || 0;
                        var TotalDifference = parseFloat(earnings[0].TotalDifference) || 0;

                        // Update the HTML elements with formatted numbers
                        $("#ta").text('$' + TotalAmount.toFixed(2));
                        $("#td").text('$' + TotalDueAmount.toFixed(2));
                        $("#tdiff").text('$' + TotalDifference.toFixed(2));
                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });


























                $.ajax({
                    type: "POST",
                    url: "myincome.aspx/previousmoney",
                    data: "{'id':'" + id + "'} ",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (r) {
                        console.log(r);
                        var earnings = r.d;

                        // Check if values are valid numbers and convert if necessary
                        var TotalCurrentMonth = parseFloat(earnings[0].TotalCurrentMonth) || 0;
                        var TotalPreviousMonth = parseFloat(earnings[0].TotalPreviousMonth) || 0;
















                        // Update the HTML elements with formatted numbers
                        $("#lacag1").text('$' + TotalPreviousMonth.toFixed(2));
                        $("#lacag2").text('$' + TotalCurrentMonth.toFixed(2));

                    },
                    error: function (xhr, status, error) {
                        console.error(xhr.responseText);
                    }
                });



            });
        });








        displaymoney2();
        function displaymoney2() {
            $.ajax({
                type: "POST",
                url: "myincome.aspx/displaymoney2",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    console.log(r);
                    var earnings = r.d;

                    // Check if values are valid numbers and convert if necessary
                    var TotalCurrentMonth = parseFloat(earnings[0].TotalCurrentMonth) || 0;
                    var TotalPreviousMonth = parseFloat(earnings[0].TotalPreviousMonth) || 0;
















                    // Update the HTML elements with formatted numbers
                    $("#lacag1").text('$' + TotalPreviousMonth.toFixed(2));
                    $("#lacag2").text('$' + TotalCurrentMonth.toFixed(2));
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }











        displaymoney();
        function displaymoney() {
            $.ajax({
                type: "POST",
                url: "myincome.aspx/displaymoney",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    console.log(r);
                    var earnings = r.d;

                    // Check if values are valid numbers and convert if necessary
                    var TotalAmount = parseFloat(earnings[0].TotalAmount) || 0;
                    var TotalDueAmount = parseFloat(earnings[0].TotalDueAmount) || 0;
                    var TotalDifference = parseFloat(earnings[0].TotalDifference) || 0;

                    // Update the HTML elements with formatted numbers
                    $("#ta").text('$' + TotalAmount.toFixed(2));
                    $("#td").text('$' + TotalDueAmount.toFixed(2));
                    $("#tdiff").text('$' + TotalDifference.toFixed(2));
                },
                error: function (xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        }


        //$(document).ready(function () {
        //    $('#stt').change(function () {
        //        var id = $(this).val();

        //        $.ajax({
        //            url: 'myincome.aspx/datadisplay2',
        //            data: "{'id':'" + id + "'}",
        //            dataType: "json",
        //            type: 'POST',
        //            contentType: "application/json",
        //            success: function (response) {
        //                console.log(response)



        //                $("#datatable tbody").empty();

        //                var datatable = $('#datatable').DataTable();
        //                datatable.clear();
        //                for (var i = 0; i < response.d.length; i++) {
        //                    var NeighborhoodName = response.d[i].NeighborhoodName;
        //                    var SubNeighborhoodName = response.d[i].SubNeighborhoodName;
        //                    var HouseNumber = response.d[i].HouseNumber;
        //                    var IsActive = response.d[i].IsActive;
        //                    var fullname = response.d[i].fullname;
        //                    var number = response.d[i].number;
        //                    var HouseID = response.d[i].HouseID;


        //                    var amount = response.d[i].amount;
        //                    var DueAmount = response.d[i].DueAmount;
        //                    var PaymentStatusID = response.d[i].PaymentStatusID;



        //                    datatable.row.add([
        //                        fullname,
        //                        HouseNumber,
        //                        NeighborhoodName,
        //                        SubNeighborhoodName,
        //                        number,
        //                        DueAmount,
        //                        '<a class="me-3 edit-button" data-id="' + HouseNumber + '">' +
        //                        '<img src="assets/img/icons/edit.svg" alt="Edit">' +
        //                        '</a>' +
        //                        '<a class="me-3 delete-btn" data-id="' + HouseNumber + '">' +
        //                        '<img src="assets/img/icons/delete.svg" alt="Delete">' +
        //                        '</a>'
        //                    ]).draw();
        //                }
        //            },
        //            error: function (response) {
        //                alert(response.responseText);
        //            }
        //        });

        //     });
        //});














        //$(document).ready(function () {
        //    $('#searchbtn').on('click', function () {
        //        // Get values from input fields
        //        var date = $('#date1').val();       // Date input
        //        var status = $('#stt').val();       // Status input (dropdown or text)
        //        var waxda = $('#waxda').text();      // SubNeighborhoodID (dropdown or input)
        //        const selectedText = $("#waxid option:selected").text();



















































        //        // Get the current date
        //        var currentDate = new Date();

        //        // Extract the current month (1-based, so we add 1)
        //        var paymentMonth = currentDate.getMonth() + 1;

        //        // Extract the current year
        //        var paymentYear = currentDate.getFullYear();



        //        // Build data object
        //        var data = {
        //            paymentMonth: paymentMonth,
        //            paymentYear: paymentYear,
        //            status: status || null,       // Use null if status is empty
        //            waxda: waxda || null          // Use null if waxda is empty
        //        };

        //        console.log(data);

        //        // AJAX call to fetch data
        //        $.ajax({
        //            url: 'myincome.aspx/datadisplay6', // WebMethod URL
        //            data: JSON.stringify(data),        // Convert data object to JSON
        //            dataType: "json",                  // Expected data format from server
        //            type: 'POST',                      // POST method
        //            contentType: "application/json",   // Content type
        //            success: function (response) {

        //                console.log(response); // Debug: Log the response

        //                // Clear the DataTable
        //                var datatable = $('#datatable').DataTable();
        //                datatable.clear();

        //                // Check if data is empty
        //                if (response.d.length === 0) {
        //                    // Add a row with empty cells (same number of columns as the table)
        //                    datatable.row.add([
        //                        '', '', 'No records to display', '', '', '', ''  // Empty cells plus message, 6 columns
        //                    ]).draw();
        //                } else {
        //                    // Populate the DataTable with new data
        //                    for (var i = 0; i < response.d.length; i++) {
        //                        var NeighborhoodName = response.d[i].NeighborhoodName;
        //                        var SubNeighborhoodName = response.d[i].SubNeighborhoodName;
        //                        var HouseNumber = response.d[i].HouseNumber;
        //                        var fullname = response.d[i].fullname;
        //                        var number = response.d[i].number;
        //                        var DueAmount = response.d[i].DueAmount;
        //                        var shaqaale = response.d[i].shaqaale;
                                






        //                        if (Math.abs(DueAmount) < 0.01) {
        //                            DueAmount = "Paid";
        //                        }
        //                        var dueAmountClass = (DueAmount === "Paid") ? "text-success font-weight-bold" : "text-danger";


        //                        datatable.row.add([
        //                            fullname,
        //                            HouseNumber,
        //                            NeighborhoodName,
        //                            SubNeighborhoodName,
        //                            number,
        //                            shaqaale,
        //                            `<span class="${dueAmountClass}">${DueAmount}</span>`
        //                        ]).draw();
        //                    }
        //                }
        //            },
        //            error: function (xhr, status, error) {
        //                console.error("Error occurred: ", status, error); // Log errors for debugging
        //                console.error("AJAX Error: ", status, error);
        //                Swal.fire("Error", "Failed to fetch data. Please try again.", "error"); // SweetAlert2 for user-friendly alerts
        //            }
        //        });



        //    });
        //});

    </script>
</asp:Content>
