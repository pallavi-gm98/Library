<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management System</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Full height of the viewport */
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
        }
        .header {
            background-color: #99AF4C; /* Green background */
            color: white; /* White text */
            padding: 15px;
            text-align: center;
            font-size: 24px; /* Header font size */
        }
        .container {
            display: flex;
            flex: 1; /* Allow the container to grow */
        }
        .sidebar {
            width: 250px;
            background-color: #4CAF50; /* Green background */
            padding: 15px;
            color: white; /* White text */
        }
        .sidebar h2 {
            font-size: 24px; /* Increased font size */
            margin: 0;
            padding: 10px 0;
            text-align: center;
        }
        .menu-item {
            margin: 15px 0;
        }
        .menu-item a {
            display: block;
            padding: 10px;
            text-decoration: none;
            color: white; /* White text */
            font-size: 18px; /* Increased font size */
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth transition */
        }
        .menu-item a:hover {
            background-color: #45a049; /* Darker green on hover */
        }
        .submenu {
            display: none;
            margin-left: 15px;
        }
        .menu-item:hover .submenu {
            display: block;
        }
        .submenu a {
            padding: 8px 10px;
            font-size: 16px; /* Slightly smaller font size for submenus */
            background-color: #3e8e41; /* Darker green for submenus */
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s; /* Smooth transition */
        }
        .submenu a:hover {
            background-color: #367c39; /* Even darker green on hover */
        }
        .main-content {
            flex: 1; /* Allow main content to grow */
            padding: 20px;
            margin-left: 20px; /* Space between sidebar and content */
        }
        .footer {
            background-color: #99AF4C; /* Green background */
            color: white; /* White text */
            text-align: center;
            padding: 10px;
            width: 100%;
        }
    </style>
</head>
<body>

<div class="header">
    Student Management System
</div>

<div class="container">
    <div class="sidebar">
        <h2>Menu</h2>
        <div class="menu-item">
            <a href="#">1st Year</a>
            <div class="submenu">
                <a href="#">P-Cycle</a>
                <a href="#">C-Cycle</a>
            </div>
        </div>
        <div class="menu-item">
            <a href="#">2nd Year</a>
            <div class="submenu">
                <a href="#">3-Sem</a>
                <a href="#">4-Sem</a>
            </div>
        </div>
        <div class="menu-item">
            <a href="#">3rd Year</a>
            <div class="submenu">
                <a href="#">5-Sem</a>
                <a href="#">6-Sem</a>
            </div>
        </div>
        <div class="menu-item">
            <a href="#">4th Year</a>
            <div class="submenu">
                <a href="#">7-Sem</a>
                <a href="#">8-Sem</a>
            </div>
        </div>
    </div>

    <div class="main-content">
        <h1>Welcome to the Course Management System</h1>
        <p>Select a year from the left menu to view subjects.</p>
    </div>
</div>

<div class="footer">
    &copy; 2025 pallavishaivas All rights reserved
    </div>