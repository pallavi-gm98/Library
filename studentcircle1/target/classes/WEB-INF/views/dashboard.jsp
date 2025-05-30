<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Library Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            background: #f4f7fe;
        }
        #sidebar {
            height: 100vh;
            background-color: #ffffff;
            box-shadow: 2px 0 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        #sidebar.collapsed {
            transform: translateX(-100%);
        }
        #toggleSidebar {
            cursor: pointer;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }
        .menu-icon {
            font-size: 24px;
            margin: 10px;
        }
        .card h6 {
            font-weight: 600;
        }
        .modal-custom {
            display: none;
            position: fixed;
            z-index: 1050;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }
        .modal-content-custom {
            background-color: #fff;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 50%;
            border-radius: 5px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%@ include file="includes/header.jsp" %>
<div class="d-flex">
    <div id="sidebar" class="p-3">
        <%@ include file="includes/leftmenu.jsp" %>
    </div>

    <div class="flex-fill">
        <div class="d-flex justify-content-between align-items-center p-3">
            <span id="toggleSidebar" class="menu-icon">&#9776;</span>
            <h5>Welcome, <span class="text-success"> Library</span></h5>
            <div>
                <button class="btn btn-success" id="openAdmission">+Admission</button>
                
                 <button class="btn btn-success" id="openRecipt">+Recipt</button>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row text-center">
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Active Members</h6>
                        <h3 id="activeMembers">0</h3>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Expired Members</h6>
                        <h3 id="expiredMembers">0</h3>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Total Members</h6>
                        <h3 id="totalMembers">0</h3>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Unpaid Bills</h6>
                        <h3 id="unpaidBills">0</h3>
                    </div>
                </div>
            </div>

            <div class="row text-center">
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Freeze Members</h6>
                        <h3 id="freezeMembers">0</h3>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Time Slot</h6>
                        <h3 id="timeSlot">0</h3>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Total Due</h6>
                        <h3 id="totalDue">0</h3>
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <div class="card p-3">
                        <h6>Total Expenses</h6>
                        <h3 id="totalExpenses">0</h3>
                    </div>
                </div>
            </div>

            <div class="card p-3 mb-4">
                <h5>Income Report</h5>
                <canvas id="incomeChart" height="100"></canvas>
            </div>
        </div>
    </div>
</div>
<%@ include file="includes/footer.jsp" %>

<!-- Admission Modal -->
<div id="admissionModal" class="modal-custom">
    <div class="modal-content-custom">
        <span class="close" id="closeAdmission">&times;</span>
        <h4>New Admission</h4>
        <form id="admissionForm">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile No</label>
                <input type="text" class="form-control" id="mobile" name="mobile" required pattern="[0-9]{10}">
            </div>
           
            <div class="form-group">
                <label for="months">No. of Months</label>
                <input type="number" class="form-control" id="months" name="months" required>
            </div>
            <div class="form-group">
                <label for="amount">Total Amount</label>
                <input type="number" class="form-control" id="amount" name="amount" required>
            </div>
            <div class="form-group">
                <label for="doj">Date of Joining</label>
                <input type="date" class="form-control" id="doj" name="doj" required>
            </div>
            <div class="form-group">
                <label for="dor">Date of Registration</label>
                <input type="date" class="form-control" id="dor" name="dor" required>
            </div>
            <div class="form-group">
                <label for="advance">Advance Amount</label>
                <input type="number" class="form-control" id="advance" name="advance">
            </div>
            <div class="form-group">
                <label for="paymentMode">Payment Mode</label>
                <select class="form-control" id="paymentMode" name="paymentMode">
                    <option value="Cash">Cash</option>
                    <option value="Personal">Personal</option>
                    <option value="UPI">UPI</option>
                </select>
            </div>
            <div class="form-group">
                <label for="seatNo">Seat No</label>
                <input type="text" class="form-control" id="seatNo" name="seatNo" required>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>


<!-- Reciept Modal -->
<div id="recieptModal" class="modal-custom">
    <div class="modal-content-custom">
        <span class="close" id="closeRecipt">&times;</span>
        <h4>Reciept Deatils</h4>
        <form id="admissionForm">
        
           <div class="form-group">
                <label for="seatNo">Seat No</label>
                <input type="text" class="form-control" id="seatNo" name="seatNo" required>
            </div>
            
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile No</label>
                <input type="text" class="form-control" id="mobile" name="mobile" required pattern="[0-9]{10}">
            </div>
            <div class="form-group">
                <label for="months">No. of Months</label>
                <input type="number" class="form-control" id="months" name="months" required>
            </div>
            <div class="form-group">
                <label for="amount">Total Amount</label>
                <input type="number" class="form-control" id="amount" name="amount" required>
            </div>
            <div class="form-group">
                <label for="doj">Date of Joining</label>
                <input type="date" class="form-control" id="doj" name="doj" required>
            </div>
            <div class="form-group">
                <label for="dor">Date of renewal</label>
                <input type="date" class="form-control" id="dor" name="dor" required>
            </div>
            <div class="form-group">
                <label for="advance">Advance Amount</label>
                <input type="number" class="form-control" id="advance" name="advance">
            </div>
            <div class="form-group">
                <label for="paymentMode">Payment Mode</label>
                <select class="form-control" id="paymentMode" name="paymentMode">
                    <option value="Cash">Cash</option>
                    <option value="Personal">Personal</option>
                    <option value="UPI">UPI</option>
                </select>
            </div>
           
            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#toggleSidebar').on('click', function () {
            $('#sidebar').toggleClass('collapsed');
        });

        $.get('/dashboard/data', function (data) {
            $('#activeMembers').text(data.activeMembers);
            $('#expiredMembers').text(data.expiredMembers);
            $('#totalMembers').text(data.totalMembers);
            $('#unpaidBills').text(data.unpaidBills);
            $('#freezeMembers').text(data.freezeMembers);
            $('#timeSlot').text(data.timeSlot);
            $('#totalDue').text('₹' + data.totalDue);
            $('#totalExpenses').text('₹' + data.totalExpenses);

            new Chart(document.getElementById('incomeChart'), {
                type: 'line',
                data: {
                    labels: data.income.labels,
                    datasets: [{
                        label: 'INR',
                        data: data.income.values,
                        borderColor: '#4CAF50',
                        fill: false
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: { beginAtZero: true }
                    }
                }
            });
        });

        $("#openAdmission").click(function () {
            $("#admissionModal").fadeIn();
        });

        $("#closeAdmission").click(function () {
            $("#admissionModal").fadeOut();
        });

        $("#openRecipt").click(function () {
            $("#recieptModal").fadeIn();
        });

        $("#closeRecipt").click(function () {
            $("#recieptModal").fadeOut();
        });

        $("#admissionForm").on("submit", function (e) {
            e.preventDefault();
            alert("Admission form submitted successfully!");
            $("#admissionModal").fadeOut();
        });
    });
</script>
</body>
</html>
