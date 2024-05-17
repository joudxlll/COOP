<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sendEmail.aspx.cs" Inherits="joud4400Project.AboutUs.sendEmail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .about-container h2,
        .about-container h3 {
            color: #5a5e63;
            margin-top: 0;
        }

        .about-container h4 {
            color: #5a5e63;
            text-align: center;
            font-weight: bold;
        }

        .about-container p {
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .form-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

            .form-container h3 {
                margin-bottom: 15px;
            }

        .form-group {
            margin-bottom: 20px;
        }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #5a5e63;
            }

            .form-group input[type="text"],
            .form-group textarea {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: border-color 0.3s;
            }

                .form-group input[type="text"]:focus,
                .form-group textarea:focus {
                    outline: none;
                    border-color: #007bff;
                }

            .form-group input[type="button"] {
                background-color: #007bff;
                color: #fff;
                border: none;
                padding: 10px 20px;
                border-radius: 3px;
                cursor: pointer;
                transition: background-color 0.3s;
            }

                .form-group input[type="button"]:hover {
                    background-color: #0056b3;
                }

        .btn-primary {
            background-color: #5a5e63;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

            .btn-primary:hover {
                background-color: #0056b3;
            }
    </style>

    <div class="about-container">
        <h2><%: Title %></h2>
        <h3>Welcome to VaultKeeper</h3>
        <p>At VaultKeeper, we understand the hassle of managing subscriptions and keeping track of various coverages. That's why we've created a simple yet powerful solution to help you effortlessly organize and monitor your subscriptions and coverages.</p>

        <h3>VaultKeeper Purpose</h3>
        <p>The purpose is to simplify your life by providing you with a centralized platform where you can manage and keep track of all your subscriptions and coverages efficiently.</p>

        <h3>VaultKeeper Offer</h3>
        <p>VaultKeeper offers a user-friendly interface designed to streamline the process of managing subscriptions and coverages. Whether you're keeping track of your streaming services like Netflix, Hulu, and Amazon Prime, or monitoring warranties and insurance policies, VaultKeeper has you covered.</p>

        <h3>Get Started Today</h3>
        <p>Ready to take control of your subscriptions and coverages? Sign up for VaultKeeper today and experience the convenience of efficient management at your fingertips.</p>

        <h4>Have questions or feedback? We'd love to hear from you!</h4>

        <div class="form-container">
            <h3>Contact Us</h3>
            <div class="form-group">
                <label for="txtSubject">Subject:</label>
                <asp:TextBox ID="txtSubject" runat="server" Width="100%" OnLoad="lblOutputClear_txtSubject"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtBody">Message:</label>
                <asp:TextBox ID="txtBody" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnSendMailViaMailMgr" runat="server" OnClick="btnSendMailViaMailMgr_Click" Text="Send" CssClass="btn btn-primary" />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
