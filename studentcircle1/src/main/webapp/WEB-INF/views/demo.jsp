<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Ion Library</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <style>
        body {
            background: #f4f7fe;
            margin: 0;
        }
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            width: 200px;
            height: 100vh;
            background-color: #343a40;
            padding-top: 60px;
            color: white;
        }
        .sidebar a {
            display: block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            cursor: pointer;
        }
        .sidebar a:hover {
            background-color: #495057;
        }
        .header {
            position: fixed;
            top: 0;
            left: 200px;
            height: 60px;
            width: calc(100% - 200px);
            background-color: #6c757d;
            color: white;
            padding: 15px;
        }
        .content {
            margin-left: 200px;
            margin-top: 60px;
            padding: 20px;
        }
        .footer {
            text-align: center;
            padding: 10px;
            background-color: #e9ecef;
            position: fixed;
            bottom: 0;
            left: 200px;
            width: calc(100% - 200px);
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
            margin: 10% auto;
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

<div class="sidebar">
    <a href="#">Dashboard</a>
    <a id="openAdmission">Admissions</a>
    <a id="openReceipt">Receipts</a>
    <a href="#">Users</a>
    <a href="#">Settings</a>
</div>

<div class="header">
    <h5>Ion Library - Admin Panel</h5>
</