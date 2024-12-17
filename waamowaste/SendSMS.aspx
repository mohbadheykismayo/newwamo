<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="SendSMS.aspx.cs" Inherits="waamowaste.SendSMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
            <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="assets/css/custom.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <link href="assets/plugins/select2/css/select2.min.css" rel="stylesheet" />
     <style>
        /* Background styling */
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            font-family: 'Poppins', sans-serif;
            color: #333;
        }

        /* Centered form styling */
        .form-container {
            max-width: 450px;
            margin: 80px auto;
            padding: 30px;
            background: #ffffff;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            text-align: center;
        }

        .form-container h2 {
            font-size: 24px;
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }

        .form-container p {
            font-size: 14px;
            color: #666;
            margin-bottom: 30px;
        }

        /* Input field styling */
        .form-control {
            border-radius: 30px;
            border: 2px solid #4facfe;
            padding: 10px 20px;
            font-size: 16px;
        }

        .form-control:focus {
            border-color: #00f2fe;
            box-shadow: 0 0 5px rgba(0, 242, 254, 0.5);
        }

        /* Button styling */
        .custom-button {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 18px;
            font-weight: bold;
            border-radius: 30px;
            transition: all 0.3s ease;
        }

        .custom-button:hover {
            background: linear-gradient(to right, #00f2fe, #4facfe);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 242, 254, 0.5);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 <div class="container">
        <div class="form-container">
            <h2>Send SMS</h2>
            <p>Send personalized SMS messages with ease.</p>
            <form id="smsForm">
                <div class="form-group">
                    <textarea id="messageInput" class="form-control" placeholder="Type your message here..." rows="4"></textarea>
                </div>
                <button type="button" id="sendSMSButton" class="btn custom-button btn-block">Send SMS</button>
            </form>
        </div>
    </div>

        <script src="assets/js/jquery-3.6.0.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script>--%>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <script src="assets/plugins/select2/js/select2.min.js"></script>
    
    <script>
        $(document).ready(function () {
            $("#sendSMSButton").click(function () {
                // Get the base message from the input
                var baseMessage = $("#messageInput").val();

                // Example: Retrieve recipient data dynamically (replace with actual logic)
                var recipients = [
                    { Name: "Mohamed Badhey", PhoneNumber: "+252614112537" }
                    //{ Name: "asha", PhoneNumber: "+252616990973" },
                    //{ Name: "nima", PhoneNumber: "+252615255771" }
                ];

                // Make an AJAX call to the WebMethod
                $.ajax({
                    type: "POST",
                    url: "SendSMS.aspx/SendPersonalizedMessages",
                    data: JSON.stringify({ recipients: recipients, baseMessage: baseMessage }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert(response.d); // Display the server response
                    },
                    error: function (xhr, status, error) {
                        alert("An error occurred: " + error);
                    }
                });
            });
        });

    </script>
</asp:Content>


















































