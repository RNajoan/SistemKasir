<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register1.aspx.cs" Inherits="ASP.NETWITHDB1.Pages.Register1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../Register1StyleCss/jQuery.js"></script>
    <script src="../Register1StyleCss/script.js"></script>
    <link href="../Register1StyleCss/StyleRegister1.css" rel="stylesheet" />
    <link href="../Register1StyleCss/StyleRegister2.css" rel="stylesheet" />
    <script src="../swat.js"></script>
    <script>
        function Berhasil() {
            Swal.fire({
                position: 'top-center',
                type: 'success',
                title: 'Registration Success',
                showConfirmButton: false,
                timer: 2000
            }).then(function () {
                window.location.href = "Login2.aspx";
            });
        }

        function Fail() {
           Swal.fire({
                  title: 'Fail!',
                  text: 'email has been used!',
                  type: 'error',
                  confirmButtonText: 'Ok'
                  
                }) 
        }
        function FailPassword() {
           Swal.fire({
                  title: 'Fail!',
                  text: 'Password Is not same!',
                  type: 'error',
                  confirmButtonText: 'Ok'
                  
                }) 
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container register">
                <div class="row">
                    <div class="col-md-3 register-left">
                        <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                        <h3>Welcome</h3>
                        <p>You are 30 seconds away from earning your own money!</p>
                        <a href="Login2.aspx" style="border-right-color" >Login</a><br/>
                    </div>
                    <div class="col-md-9 register-right">
                        <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Employee</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">Welcome New User</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" runat="server" id="textName" class="form-control" placeholder="Your Name *" required />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" runat="server" id="textPassword" required class="form-control" pattern="[A-Za-z]{5,8}" title="Password harus berisi huruf besar dan huruf kecil dengan panjang minimal 5 dan maksimal 8" placeholder="Password *" />
                                        </div>
                                        <div class="form-group">
                                            <input type="password" runat="server" id="textPassConf" required class="form-control" pattern="[A-Za-z]{5,8}" title="Password harus berisi huruf besar dan huruf kecil dengan panjang minimal 5 dan maksimal 8" placeholder="Confirm Password *" />
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="email" runat="server" id="textEmail" class="form-control" aria-describedby="emailHelp" required placeholder="Your Email *" />
                                        </div>
                                        <div class="form-group">
                                            <asp:DropDownList CssClass="form-control" ID="gender" runat="server">
                                                <asp:ListItem>Pilih Gender</asp:ListItem>
                                                <asp:ListItem>Pria</asp:ListItem>
                                                <asp:ListItem>Wanita</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="gender" ErrorMessage="Pilih Salah Satu Gender" ForeColor="Red" InitialValue="Pilih Gender"></asp:RequiredFieldValidator>
                                        </div>
                                        <asp:Button ID="Button1" runat="server" Text="Daftar" CssClass="btn btn-primary" OnClick="Button1_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>
