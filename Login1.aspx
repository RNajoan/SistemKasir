<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login1.aspx.cs" Inherits="ASP.NETWITHDB1.Pages.Login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Style.css" rel="stylesheet" />
    <script src="../swat.js"></script>
    <script>
        function Berhasil() {
            //Swal.fire(
            //    'Good job!',
            //    'Registration Success!',
            //    'success'
            //)
            Swal.fire({
                position: 'top-center',
                type: 'success',
                title: 'Login Berhasil',
                showConfirmButton: false,
                timer: 2000
            }).then(function () {
                window.location.href = "Index.aspx";
            });
        }
        function EmailFail() {
            Swal.fire({
              type: 'error',
              title: 'Oops...',
              text: 'Email Salah!',
              
            })
        }
        function PassFail() {
            Swal.fire({
              type: 'error',
              title: 'Oops...',
              text: 'Password Salah!',
             
            })
        }
    </script>
</head>
<body>
    <form id="form1" class="box" runat="server">
        <h1>Login</h1>
        <input type="email" runat="server" id="textEmail" placeholder="Email" />
        <input type="password" runat="server" id="textPasswor" placeholder="Password" />
        <input type="submit" name="" value="login" onclick="login">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Register.aspx">Register</asp:HyperLink>
    </form>
</body>
</html>
