<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="subscription.aspx.cs" Inherits="joud4400Project.Subscriptions.subscription" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%--<link href="~/Styles/form.css" rel="stylesheet" type="text/css" />--%>

    <style>
        .form-group {
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
        }

        .gridview-container {
            text-align: center;
            margin-top: 20px;
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
            text-align: center;

        }

        .btn-primary {
            background-color: #0059b8;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 3px;
            cursor: pointer;
        }

            .btn-primary:hover {
                background-color: #0056b3;
            }
    </style>

    <div>
        <h2>Manage Subscriptions</h2>
        <asp:Label ID="lblSuccess" runat="server"></asp:Label>

        <div class="form-group">
            <label for="name">Name:</label>
            <asp:TextBox ID="txtName" runat="server" placeholder="The subscription name" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblName" runat="server"></asp:Label>
        </div>

        <div class="form-group">
            <label for="billingFrequency">Billing Frequency:</label>
            <asp:DropDownList ID="ddlBillingFrequency" runat="server" CssClass="form-control"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" placeholder="The used email" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="phoneNumber">Phone Number:</label>
            <asp:TextBox ID="txtPhoneNumber" runat="server" placeholder="The used phone number" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblPhoneNumber" runat="server"></asp:Label>
        </div>

        <div class="form-group">
            <label for="billingInfo">Billing Information:</label>
            <asp:TextBox ID="txtBillingInfo" runat="server" placeholder="The payment info" CssClass="form-control"></asp:TextBox>
        </div>

        <div class="form-group">
            <label for="amount">Amount:</label>
            <asp:TextBox ID="txtAmount" runat="server" TextMode="Number" placeholder="The subscription price" CssClass="form-control"></asp:TextBox>
            <asp:Label ID="lblAmount" runat="server"></asp:Label>
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-primary" />

        <div class="gridview-container">
            <asp:GridView ID="gvSubscriptions" runat="server" AutoGenerateColumns="False" DataKeyNames="subscriptionId" CssClass="gridview"
                OnRowDeleting="gvSubscriptions_RowDeleting" OnRowEditing="gvSubscriptions_RowEditing" OnRowUpdating="gvSubscriptions_RowUpdating" OnRowCancelingEdit="gvSubscriptions_RowCancelingEdit">
                <Columns>
                    <asp:BoundField DataField="subscriptionId" HeaderText="Subscription ID" InsertVisible="False" ReadOnly="True" />
                    <asp:TemplateField HeaderText="Name">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("name") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblName" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone Number">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" Text='<%# Bind("phoneNumber") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPhoneNumber" runat="server" Text='<%# Bind("phoneNumber") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Amount">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtAmount" runat="server" Text='<%# Bind("amount") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblAmount" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Billing Info">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtBillingInfo" runat="server" Text='<%# Bind("billingInfo") %>' CssClass="form-control"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblBillingInfo" runat="server" Text='<%# Bind("billingInfo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <HeaderStyle CssClass="grid-header" />
            </asp:GridView>
        </div>
    </div>
</asp:Content>
