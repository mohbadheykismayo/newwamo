<%@ Page Title="" Language="C#" MasterPageFile="~/theUser.Master" AutoEventWireup="true" CodeBehind="userdashbourd.aspx.cs" Inherits="waamowaste.userdashbourd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <style>
    #paymentChart {
        background: linear-gradient(to right, #f0f2f5, #ffffff);
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 12px;
        padding: 20px;
    }
</style>
<style>
    body {
        background: #f3f4f6;
        font-family: 'Roboto', sans-serif;
        color: #333;
    }

    .card {
        border-radius: 12px;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .card:hover {
        transform: translateY(-5px);
        box-shadow: 0px 10px 15px rgba(0, 0, 0, 0.2);
    }

    .card-header {
        border-bottom: none;
        border-radius: 12px 12px 0 0;
    }

    #mapSearchInput {
        border-radius: 8px 0 0 8px;
    }

    #searchMapBtn {
        border-radius: 0 8px 8px 0;
    }

    #mapContainer {
        box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
    }

        .action-buttons {
        display: flex;
   justify-content: space-between;
        margin-bottom: 15px;
    }
    .action-buttons .btn {
        margin-right: 10px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">





<div class="container-fluid">

    <!-- Row 2: Map Search Section -->
    <div class="row g-4 mt-4">
        <div class="col-12">
            <div class="card shadow-lg border-0">
                <div class="card-header bg-success text-white text-center">
                    <h5 class="mb-0">Search Locations</h5>
                </div>
                <div class="card-body">
                    <div class="input-group">
        


                          <select class="form-control   select2-enhanced" id="selectHouse">
      <option value="">Select a house</option>
      <!-- Dynamic house options will be populated here -->
  </select>
                        <button class="btn btn-success" id="searchMapBtn">Search</button>
                    </div>
                    <div id="mapContainer" class="mt-4" style="height: 400px; width: 100%; background: #e9ecef; border-radius: 8px;">
                        <!-- Map will be rendered here -->
                             <iframe class="map-responsive" src="https://www.google.com/maps/embed?pb=!1m17!1m12!1m3!1d759.7649610407138!2d42.53952416468832!3d-0.3587674345167579!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m2!1m1!2zMMKwMjEnMzEuNyJTIDQywrAzMicyMi4yIkU!5e1!3m2!1sen!2sso!4v1729019983702!5m2!1sen!2sso"  style="width: 100%; height: 100%; border: 0;"    allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

        <script src="assets/js/jquery-3.6.0.min.js"></script>
 <%--   <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>--%>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="assets/plugins/select2/js/select2.min.js"></script>







<script>
    $(document).ready(function () {
        // Load house data with AJAX and initialize Select2 with enhanced styles
        $.ajax({
            type: "POST",
            url: "paymentga.aspx/getdate",
            data: '{}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (r) {
                var getdate = $("#selectHouse");
                getdate.empty().append('<option selected="selected" value="0">Please select</option>');

                // Populate select with options
                $.each(r.d, function () {
                    getdate.append($("<option></option>").val(this['Value']).html(this['Text']));
                });

                // Initialize Select2 with a theme and custom placeholder
                getdate.select2({
                    placeholder: "Search for a house",
                    allowClear: true,
                    theme: "bootstrap-5", // Use Bootstrap theme if available
                    width: '100%'  // Makes sure the select fits inside the form
                });
            },
            error: function () {
                console.error('Error fetching house data.');
            }
        });
    });







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




    document.addEventListener('DOMContentLoaded', function () {
        // Fetch data from the server
        fetch('dashbourd.aspx/GetPaymentData', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
        })
            .then(response => response.json())
            .then(data => {
                const chartData = data.d.map(item => ({
                    label: item.MonthYear,
                    value: item.TotalAmountPerMonth
                }));

                const labels = chartData.map(item => item.label);
                const values = chartData.map(item => item.value);

                // Create gradient background
                const ctx = document.getElementById('paymentChart').getContext('2d');
                const gradient = ctx.createLinearGradient(0, 0, 0, 400);
                gradient.addColorStop(0, 'rgba(75, 192, 192, 0.8)');
                gradient.addColorStop(1, 'rgba(75, 192, 192, 0.2)');

                // Initialize the chart
                new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Total Payments',
                            data: values,
                            backgroundColor: gradient,
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 2,
                            borderRadius: 10,
                            hoverBackgroundColor: 'rgba(54, 162, 235, 0.8)',
                            hoverBorderColor: 'rgba(54, 162, 235, 1)'
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: {
                                display: true,
                                labels: {
                                    font: {
                                        size: 14,
                                        family: 'Arial, sans-serif',
                                    },
                                    color: '#333',
                                }
                            },
                            datalabels: {
                                anchor: 'end',
                                align: 'top',
                                formatter: (value) => `$${value.toLocaleString()}`,
                                font: {
                                    size: 12,
                                    weight: 'bold',
                                    family: 'Arial, sans-serif',
                                },
                                color: '#333',
                            }
                        },
                        scales: {
                            x: {
                                grid: {
                                    display: false,
                                },
                                ticks: {
                                    font: {
                                        size: 12,
                                    },
                                    color: '#555',
                                }
                            },
                            y: {
                                grid: {
                                    color: 'rgba(200, 200, 200, 0.3)',
                                    drawBorder: false,
                                },
                                ticks: {
                                    font: {
                                        size: 12,
                                    },
                                    color: '#555',
                                    callback: (value) => `$${value.toLocaleString()}`,
                                }
                            }
                        },
                        layout: {
                            padding: 20,
                        }
                    },
                    plugins: [ChartDataLabels]
                });
            });
    });






    $(document).ready(function () {
        $.ajax({
            url: 'dashbourd.aspx/users',
            data: {},
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json',
            success: function (response) {
                // Assuming your response structure
                var rowCount = response.d;

                // Update the element where you want to display the count
                $("#employees").text(rowCount);


            },
            error: function (response) {
                alert(response.responseText);
            }
        });

    });





    $(document).ready(function () {
        $.ajax({
            url: 'dashbourd.aspx/houses',
            data: {},
            dataType: 'json',
            type: 'POST',
            contentType: 'application/json',
            success: function (response) {
                // Assuming your response structure
                var rowCount = response.d;

                // Update the element where you want to display the count
                $("#houses").text(rowCount);


            },
            error: function (response) {
                alert(response.responseText);
            }
        });

    });



</script>
</asp:Content>
