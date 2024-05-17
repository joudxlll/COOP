<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="joud4400Project.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .about-container h2, .about-container h3 {
            color: #007bff;
            margin-top: 0;
        }

        .about-container p {
            line-height: 1.6;
            margin-bottom: 20px;
        }
    </style>

    <div">
        <h2><%: Title %></h2>
        <h3>Welcome to VaultKeeper</h3>
        <p>At VaultKeeper, we understand the hassle of managing subscriptions and keeping track of various coverages. That's why we've created a simple yet powerful solution to help you effortlessly organize and monitor your subscriptions and coverages.</p>

        <h3>VaultKeeper Purpose</h3>
        <p>The purpose is to simplify your life by providing you with a centralized platform where you can manage and keep track of all your subscriptions and coverages efficiently.</p>

        <h3>VaultKeeper Offer</h3>
        <p>VaultKeeper offers a user-friendly interface designed to streamline the process of managing subscriptions and coverages. Whether you're keeping track of your streaming services like Netflix, Hulu, and Amazon Prime, or monitoring warranties and insurance policies, VaultKeeper has you covered.</p>

        <h3>Get Started Today</h3>
        <p>Ready to take control of your subscriptions and coverages? Sign up for VaultKeeper today and experience the convenience of efficient management at your fingertips.</p>

        <p>Have questions or feedback? We'd love to hear from you! Contact us through support@vaultkeeper.com.</p>
    </div>
</asp:Content>
