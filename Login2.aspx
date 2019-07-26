<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="ASP.NETWITHDB1.Pages.Login2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../StyleLogin2.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="styles.css">
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
        <br />
        <br />
        <br />
    <div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
			<div class="card-header">
				<h3>Sign In</h3>
				<div class="d-flex justify-content-end social_icon">
					<span><i class="fab fa-facebook-square"></i></span>
					<span><i class="fab fa-google-plus-square"></i></span>
					<span><i class="fab fa-twitter-square"></i></span>
				</div>
			</div>
			<div class="card-body">
				<form>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="email" runat="server" id="textEmail" class="form-control" aria-describedby="emailHelp" placeholder="Email">
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-key"></i></span>
						</div>
						<input type="password" runat="server" id="textPassword" class="form-control"  placeholder="password" >
					</div>
                    <br />
					<div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn float-right login_btn" OnClick="btnLogin_Click" Text="Login" />
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Don't have an account?<a href="Register1.aspx">Sign Up</a>
				</div>
				    <div class="d-flex justify-content-center">
					    <a href="#">Forgot your password?</a>
				    </div>
			    </div>
		    </div>
	    </div>
    </div>
    </form>
</body>
</html>
