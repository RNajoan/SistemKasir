<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ASP.NETWITHDB1.Pages.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <title></title>
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
    <form id="form1" runat="server" class="form-group">
        <br />
        <br />
        <br />
        <br /> <br />
        <div class="container col-4">
            <div class="card border-info mb-4" style="max-width: 23rem;">
              <div class="card-header border-primary">
                  <h2 style="align-content">LOGIN</h2>
              </div>
              <div class="card-body text-info">
                
                  <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label><br/>
                  <asp:TextBox ID="TextEmail" CssClass="form-control"  aria-describedby="emailHelp" runat="server"></asp:TextBox><br />
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextEmail" ErrorMessage="Cannot Empty" ForeColor="Red"></asp:RequiredFieldValidator><br />
                  
                  <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><br/>
                  <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="PasswordId" runat="server" ErrorMessage="Pasword Harus Diisi" ControlToValidate="Password" ForeColor="Red"></asp:RequiredFieldValidator><br />
                  
                  <asp:Button ID="Login_btn" CssClass="btn btn-primary" runat="server" Text="Login" OnClick="Login_btn_Click" />
                  
                  <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Register.aspx">Register</asp:HyperLink>
                  
              </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
