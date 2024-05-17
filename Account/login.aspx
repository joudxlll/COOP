<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="joud4400Project.Account.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        .login-container {
            max-width: 400px;
            height: 270px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            text-align: center;
        }

        .login-container h2 {
            text-align: center;
        }

        .form-container {
            margin-top: 20px;
            text-align: center; 
        }

        .form-control {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            margin-left: 40px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .btn-primary {
            background-color: #007bff;
            color: #fff;
            border: none;
            padding: 10px;
            border-radius: 3px;
            cursor: pointer;
            width: 100%;
            box-sizing: border-box; 
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: #dc3545;
            margin-top: 10px;
            text-align: center;
        }
    </style>
    
    <div class="login-container">
        <h2>Login</h2>
        <div class="form-container">
            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" Text="Login" CssClass="btn btn-primary" />
            <asp:Label ID="lblOutput" runat="server" CssClass="error-message"></asp:Label>
        </div>
    </div>
</asp:Content>

