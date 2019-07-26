<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ASP.NETWITHDB1.Pages.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <title></title>
    <script src="../swat.js" type="text/javascript"></script>
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
                title: 'Registration Success',
                showConfirmButton: false,
                timer: 2000
            }).then(function () {
                window.location.href = "Login.aspx";
            });
        }

        function Fail() {
           //Swal.fire({
           //   title: 'Fail!',
           //   text: "Email Already Used!",
           //    type: 'warning',
           //    showCancelButton: false,
           // })
           Swal.fire({
                  title: 'Fail!',
                  text: 'email has been used!',
                  type: 'error',
                  confirmButtonText: 'Ok'
                  
                }) 
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container col-4">
        <div class="form-group" >
        <div class="card bg-light mb-3" style="max-width: 30rem;">
          <div class="card-header">Header</div>
          <div class="card-body">
            <table class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label><br />
                        <asp:TextBox ID="TextName" CssClass="form-control" aria-describedby="emailHelp" runat="server"></asp:TextBox>
                    
                        <asp:RequiredFieldValidator ID="RequiredFName" runat="server" ErrorMessage="Name Harus Diisi" ControlToValidate="TextName" ForeColor="Red"></asp:RequiredFieldValidator><br />
                         <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><br />
                         <asp:TextBox ID="TextPassword" CssClass="form-control" aria-describedby="emailHelp" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" ControlToValidate="TextPassword" ErrorMessage="Password Harus Diisi" ForeColor="Red"></asp:RequiredFieldValidator><br />
                
                        <asp:Label ID="Label3" runat="server" Text="Konfirmasi Password"></asp:Label><br />
                        <asp:TextBox ID="TextPassConf" CssClass="form-control" aria-describedby="emailHelp" runat="server" TextMode="Password"></asp:TextBox>
                    
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextPassword" ControlToValidate="TextPassConf" ErrorMessage="Password Not Same" ForeColor="Red"></asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Cannot Empty" ForeColor="#CC0000" ControlToValidate="TextPassConf"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="Label4" runat="server" Text="E-Mail"></asp:Label>
                        <asp:TextBox ID="TextEmail" CssClass="form-control"  aria-describedby="emailHelp" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="form-control" runat="server" ControlToValidate="TextEmail" ErrorMessage="Wrong Email" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"/>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Cannot Empty" ForeColor="#CC0000" ControlToValidate="TextEmail"/>

                        <asp:DropDownList CssClass="form-control" ID="gender" runat="server">
                            <asp:ListItem>Pilih Gender</asp:ListItem>
                            <asp:ListItem>Pria</asp:ListItem>
                            <asp:ListItem>Wanita</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator CssClass="form-control" ID="RequiredFieldValidator3" runat="server" ControlToValidate="gender" ErrorMessage="Pilih Salah Satu Gender" ForeColor="Red" InitialValue="Pilih Gender"></asp:RequiredFieldValidator>
                    
                    <td class="auto-style2">
                        <asp:Button ID="Button1" runat="server" Text="Daftar" CssClass="btn btn-primary" OnClick="Button1_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        <p align="right"> <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Pages/Login1.aspx">Login</asp:HyperLink></p>
                    </td>
            </table>
          </div>
        </div>
        </div>
        </div>
    </form> 
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"  integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>