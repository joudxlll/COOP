<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="viewSubscriptions.aspx.cs" Inherits="joud4400Project.Subscriptions.viewSubscriptions" EnableEventValidation="false" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--    <link href="~/Styles/form.css" rel="stylesheet" type="text/css" />--%>

    <style>
        .gridview-container {
            text-align: center;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            text-align: center;
        }

            .gridview th,
            .gridview td {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }

        .grid-header {
            background-color: #acb4bd;
            color: #fff;
            font-weight: bold;
        }

        .btn-primary {
            background-color: #0059b8;
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

    <div>
        <h2>View Subscriptions</h2>
        <div class="gridview-container">
            <asp:GridView ID="gvSubscriptions" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" SortExpression="PhoneNumber" />
                    <asp:BoundField DataField="billingFrequency" HeaderText="Billing Frequency" SortExpression="billingFrequency" />
                    <asp:BoundField DataField="BillingInfo" HeaderText="Billing Information" SortExpression="BillingInfo" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                </Columns>
                <HeaderStyle CssClass="grid-header" />
            </asp:GridView>
        </div>

        <br />
        <asp:Button ID="btnExport" runat="server" OnClick="btnExport_Click" Text="Export To Excel" CssClass="btn btn-primary" />
    </div>
</asp:Content>
