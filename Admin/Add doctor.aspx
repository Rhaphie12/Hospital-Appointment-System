﻿<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Add doctor.aspx.vb" Inherits="Hospital_Appointment_System.Add_doctor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add new Doctor - Dashboard</title>
    <link href="/CSS/Dashboard.css" rel="stylesheet" />

    <link
        rel="shortcut icon"
        href="/hospital-appointment-system (1).png"
        type="image/x-icon" />
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous" />
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .btn {
            background-color: #001F3F;
            color: white;
        }

            .btn:hover {
                background-color: #001F3F;
                color: white;
            }

        .header {
            position: relative;
            width: 100%;
            height: 50px; /* Adjust as needed */
        }

        .table-primary {
            background-color: #b3d7ff !important; /* Light blue highlight */
        }

        .table-primary:hover { 
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h4 id="selectedUsername" runat="server"></h4>
            <p>
                <asp:Literal ID="selectedRole" runat="server"></asp:Literal>
            </p>
            <asp:Button class="btn w-100" ID="logoutBtn" Text="LOG OUT" runat="server" OnClick="logoutBtn_Click" />
            <hr>
            <a class="sidebarr" href="Admin Dashboard.aspx"><i class="bi bi-house-door-fill"></i>Dashboard</a>
            <a class="sidebarr" href="Add doctor.aspx"><i class="bi bi-people-fill"></i>Doctors</a>
            <!-- <a class="sidebarr" href="Schedule Session.aspx"><i class="bi bi-calendar-fill"></i>Schedule</a> -->
            <a class="sidebarr" href="Manage Appointments.aspx"><i class="bi bi-file-medical-fill"></i>Appointment</a>
            <a class="sidebarr" href="Patients.aspx"><i class="bi bi-person-wheelchair"></i>Patients</a>
        </div>
        <div class="main-content">

            <div class="d-flex justify-content-between align-items-center mb-3">

                <!-- Search Box with Button -->
                <div style="max-width: 350px; width: 100%;">
                    <div class="input-group">
                        <asp:TextBox ID="searchTxt" runat="server" CssClass="form-control" placeholder="Search"></asp:TextBox>
                        <asp:Button ID="searchBtn" runat="server" CssClass="btn btn-dark" Text="Search" OnClick="searchBtn_Click" />
                    </div>
                </div>

                <!-- Date Section -->
                <div class="d-flex align-items-center gap-2">
                    <span class="text-secondary small">Today's Date</span>
                    <strong class="fs-6" id="date">2025-02-06</strong>
                    <i class="bi bi-calendar-fill"></i>
                </div>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-3">
                <!-- Search Box with Button -->
                <div style="max-width: 350px; width: 100%;">
                    <h4 style="font-weight: bold;">Add Doctor</h4>
                    <p>All Doctors <span id="doctorsTotal" runat="server">(0)</span></p>
                </div>

                <div class="d-inline-block">
                    <!-- Button to trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDoctorModal">
                        Add Doctor
                    </button>
                </div>

                <!-- Bootstrap Modal -->
                <div class="modal fade" id="addDoctorModal" tabindex="-1" aria-labelledby="addDoctorModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addDoctorModalLabel">Add New Doctor</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body d-flex flex-column gap-3">
                                <!-- Form inside modal -->
                                <asp:TextBox ID="txtDoctorID" runat="server" class="form-control" placeholder="Enter Doctor's ID" TextMode="Number" ReadOnly="true" />
                                <asp:TextBox ID="txtDoctorName" runat="server" class="form-control" placeholder="Enter doctor's name" />
                                <asp:TextBox ID="txtUsername" runat="server" class="form-control" placeholder="Enter Username" />
                                <asp:TextBox ID="txtPassword" runat="server" class="form-control" placeholder="Enter Password" type="password" />
                                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Email" type="email" />
                                <asp:TextBox ID="txtSpecialization" runat="server" class="form-control" placeholder="Enter profession" />
                                <asp:DropDownList ID="ddlAvailable" class="form-select" runat="server">
                                    <asp:ListItem Selected>Select Availability</asp:ListItem>
                                    <asp:ListItem Text="On Duty" Value="On Duty" />
                                    <asp:ListItem Text="Off Duty" Value="Off Duty" />
                                    <asp:ListItem Text="Occupied" Value="Occupied" />
                                </asp:DropDownList>

                                <!-- Image Upload -->
                                <!-- <asp:FileUpload ID="fuDoctorImage" runat="server" CssClass="form-control" />
                                    <asp:Image ID="imgPreview" runat="server" Width="100" Height="100" Visible="false" class="mt-2" /> -->
                            </div>
                            <div class="modal-footer">
                                <asp:Button ID="btnSaveDoctor" runat="server" CssClass="btn btn-success" Text="Save" OnClick="btnSaveDoctor_Click" />
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="table-responsive">
                <asp:Table class="mt-1 table table-bordered" ID="Table1" runat="server"></asp:Table>
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function updateDate() {
            let now = new Date();
            let formattedDate = now.getFullYear() + '-' +
                String(now.getMonth() + 1).padStart(2, '0') + '-' +
                String(now.getDate()).padStart(2, '0');
            document.getElementById("date").innerText = formattedDate;
        }

        updateDate(); // Run when page loads
        setInterval(updateDate, 1000); // Update every second

        document.addEventListener("DOMContentLoaded", function () {
            const table = document.getElementById('<%= Table1.ClientID %>');

            if (table) {
                table.addEventListener("click", function (e) {
                    let row = e.target.closest("tr"); // Get the closest row

                    if (row && row.parentNode.tagName !== "THEAD") { // Exclude header
                        // Remove 'selected' class from all rows
                        table.querySelectorAll("tr").forEach(r => r.classList.remove("table-primary"));

                        // Add 'selected' class to the clicked row
                        row.classList.add("table-primary");
                    }
                });
            }
        });

        document.addEventListener("DOMContentLoaded", function () {
            const table = document.getElementById('<%= Table1.ClientID %>');
            const modal = new bootstrap.Modal(document.getElementById('addDoctorModal'));

            if (table) {
                table.addEventListener("click", function (e) {
                    let row = e.target.closest("tr");

                    if (row && row.parentNode.tagName !== "THEAD") {
                        // Remove highlight from other rows
                        table.querySelectorAll("tr").forEach(r => r.classList.remove("table-primary"));
                        row.classList.add("table-primary");

                        // Extract row data (adjust indexes based on your table)
                        let cells = row.getElementsByTagName("td");
                        if (cells.length > 0) {
                            document.getElementById('<%= txtDoctorID.ClientID %>').value = cells[0].innerText.trim();
                            document.getElementById('<%= txtDoctorName.ClientID %>').value = cells[1].innerText.trim();
                            document.getElementById('<%= txtUsername.ClientID %>').value = cells[2].innerText.trim();
                            document.getElementById('<%= txtEmail.ClientID %>').value = cells[3].innerText.trim();
                            document.getElementById('<%= txtSpecialization.ClientID %>').value = cells[4].innerText.trim();
                            document.getElementById('<%= ddlAvailable.ClientID %>').value = cells[5].innerText.trim();
                        }

                        // Show the modal
                        modal.show();
                    }
                });
            }
        });
    </script>
</body>
</html>
