<!DOCTYPE html>
<%@ include file="includes/header.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admission Form - Ion Library</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        body {
            background: #f4f7fe;
        }
        .form-container {
            max-width: 700px;
            background: white;
            padding: 30px;
            margin: 50px auto;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>

<div class="form-container">

    <h4 class="mb-4 text-center">User Admission Form</h4>
    <form id="admissionForm">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group col-md-6">
                <label for="mobile">Mobile No</label>
                <input type="tel" class="form-control" id="mobile" name="mobile" pattern="[0-9]{10}" required>
            </div>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" name="address" rows="2" required></textarea>
        </div>

        <div class="form-row">
            <div class="form-group col-md-4">
                <label for="months">No of Months</label>
                <input type="number" class="form-control" id="months" name="months" min="1" required>
            </div>
            <div class="form-group col-md-4">
                <label for="amount">Amount</label>
                <input type="number" class="form-control" id="amount" name="amount" required>
            </div>
            <div class="form-group col-md-4">
                <label for="advance">Advance Amount</label>
                <input type="number" class="form-control" id="advance" name="advance" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="joinDate">Date of Joining</label>
                <input type="date" class="form-control" id="joinDate" name="joinDate" required>
            </div>
            <div class="form-group col-md-6">
                <label for="regDate">Date of Registration</label>
                <input type="date" class="form-control" id="regDate" name="regDate" required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="paymentMode">Payment Mode</label>
                <select class="form-control" id="paymentMode" name="paymentMode" required>
                    <option value="">Choose...</option>
                    <option value="Cash">Cash</option>
                    <option value="Card">Card</option>
                    <option value="Online">Online</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <label for="seatNo">Seat No</label>
                <input type="text" class="form-control" id="seatNo" name="seatNo" required>
            </div>
        </div>

        <button type="submit" class="btn btn-success">Submit Admission</button>
    </form>
</div>
<%@ include file="includes/footer.jsp" %>

<script>
    $("#admissionForm").on("submit", function(e) {
        e.preventDefault();
        if (this.checkValidity()) {
            const formData = $(this).serialize();
            $.post("/admission/save", formData, function(response) {
                alert("Admission saved successfully!");
                $("#admissionForm")[0].reset();
            }).fail(function() {
                alert("Failed to save admission.");
            });
        }
    });
</script>
</body>
</html>