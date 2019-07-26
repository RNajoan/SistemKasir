<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ASP.NETWITHDB1.Pages.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <title></title>
    <link href="../Style.css" rel="stylesheet"/>
    <script src="../swat.js"></script>
    <script>
        function Logout() {
             Swal.fire({
              title: 'Are you sure?',
              text: "You won't be able to revert this!",
              type: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Yes, delete it!'
            }).then((result) => {
              if (result.value) {
                Swal.fire(
                  'Deleted!',
                  'Your file has been deleted.',
                  'success'
                )
              }
            })
        }
    </script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
            
            <div class="container col-lg-10">
                <br />
            <asp:GridView ID="EmployeeGrid" AutoGenerateColumns="false" runat="server" 
                        OnRowDeleting="EmployeeGrid_RowDeleting"  
                        OnRowEditing="EmployeeGrid_RowEditing" 
                        OnRowCancelingEdit="EmployeeGrid_RowCancelingEdit" 
                        OnRowUpdating="EmployeeGrid_RowUpdating" Width="100%">

                <Columns>
                    <asp:BoundField DataField="EmployeeId" ControlStyle-CssClass="form-control"  HeaderText="ID" />
                    <asp:BoundField DataField="FirstName" ControlStyle-CssClass="form-control" HeaderText="Nama Item" />
                    <asp:BoundField DataField="LastName" ControlStyle-CssClass="form-control" HeaderText="Kode Item" />
                    <asp:BoundField DataField="Email" ControlStyle-CssClass="form-control" HeaderText="Harga" />
                    <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-danger" ShowEditButton="true" ShowDeleteButton="true" FooterStyle-CssClass="alert-light" HeaderText="Action"/>
                </Columns>
            </asp:GridView>
            </div>
            <br/>
            <div>
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-danger" OnClick="Button1_Click" Text="Logout" />
                <div class="left" >
                    <div class="aside">
                        <div class="container col-5">
                            <br />
                        ID <br />
                        <asp:TextBox CssClass="form-control" ID="txtEmployeeId" runat="server" />
                        Nama Item <br />
                        <asp:TextBox CssClass="form-control" ID="txtFirstName" runat="server" />
                        Kode Item <br />
                        <asp:TextBox CssClass="form-control" ID="txtLastName" runat="server" />
                        Harga Item <br />
                        <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" /><br />
                        <asp:Button ID="btnAdd" CssClass="btn btn-primary" Text="Add" runat="server" onclick="btnAdd_Click"/><br />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>