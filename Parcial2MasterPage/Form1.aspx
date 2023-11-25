<%@ Page Title="" Language="C#" MasterPageFile="~/PaginaMaestra.Master" AutoEventWireup="true" CodeBehind="Form1.aspx.cs" Inherits="Parcial2MasterPage.Form1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>
        FORMULARIO 1 - VALIDACIÓN</h2>
    <p>
    NOMBRE
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar un Nombre" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p>
    APELLIDO
    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Debe ingresar un apellido" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p>
    DIRECCION
    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Debe ingresar una dirección" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p>
    EMAIL
    <asp:TextBox ID="TextBox4" runat="server" TextMode="Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="Debe ingresar un email" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Debe ingresar un email en el campo" ForeColor="Red" ValidationExpression="/^[^\s@]+@[^\s@]+\.[^\s@]+$/"></asp:RegularExpressionValidator>
</p>
<p>
    CONFIRMACION EMAIL
    <asp:TextBox ID="TextBox5" runat="server" CausesValidation="True"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="Confirme el email" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" ErrorMessage="Los emails no coinciden" ForeColor="Red"></asp:CompareValidator>
</p>
<p>
    <asp:Label ID="Label1" runat="server"></asp:Label>
</p>
<p>
    <asp:Button ID="Button1" runat="server" Text="ENVIAR" OnClick="Button1_Click" BorderStyle="Solid" Font-Bold="True" Font-Size="Large" />
</p>
</asp:Content>
