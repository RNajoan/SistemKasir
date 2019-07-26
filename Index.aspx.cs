using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Employees;
using ChasierSystem;
using System.Data;
namespace ASP.NETWITHDB1.Pages
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserLogin"] == null)
            {
                Response.Redirect("Login2.aspx");
            }
            
                if (!IsPostBack) { 
                UpdateDataGrid();
                }
            
        }
        private void UpdateDataGrid()
        {
            using (ChasierCRUD chasierCRUD = new ChasierCRUD())
            {
                DataTable data = new DataTable("employee");
                data.Columns.Add("EmployeeId");
                data.Columns.Add("FirstName");
                data.Columns.Add("LastName");
                data.Columns.Add("Email");

                List<Chasier> cs = chasierCRUD.SelectEmployees();
                foreach (Chasier emp in cs)
                {
                    data.Rows.Add(emp.Id_Item, emp.Nama_Item, emp.Kode_Item, emp.Harga_Item);
                }
                EmployeeGrid.DataSource = data;
                EmployeeGrid.DataBind();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (ChasierCRUD crud = new ChasierCRUD())
            {
                int itemId = int.Parse(txtEmployeeId.Text);
                string namaItem = txtFirstName.Text;
                string kodeItem = txtLastName.Text;
                int hargaItem = int.Parse(txtEmail.Text);

                crud.InsertEmployee(new Chasier
                {
                    Id_Item = itemId,
                    Nama_Item = namaItem,
                    Kode_Item = kodeItem,
                    Harga_Item = hargaItem
                });
                txtEmployeeId.Text = string.Empty;
                txtFirstName.Text = string.Empty;
                txtLastName.Text = string.Empty;
                txtEmail.Text = string.Empty;
            }
            UpdateDataGrid();
        }

        protected void EmployeeGrid_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (ChasierCRUD crud = new ChasierCRUD())
            {
                //cara ambil Id
                //kalo gridview itu mengambil 1 table, gridviewrow untuk mengambil 1 row saja atau 1 id
                GridViewRow row = EmployeeGrid.Rows[e.RowIndex];
                int employeeId = int.Parse(row.Cells[0].Text);
                crud.Delete(employeeId);
            }
            UpdateDataGrid();
        }

        protected void EmployeeGrid_RowEditing(object sender, GridViewEditEventArgs e)
        {
            EmployeeGrid.EditIndex = e.NewEditIndex;
            UpdateDataGrid();
        }

        protected void EmployeeGrid_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            //kalo tidak edit apa2 menjadi -1
            EmployeeGrid.EditIndex = -1;
            UpdateDataGrid();
        }

        protected void EmployeeGrid_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            using (ChasierCRUD crud = new ChasierCRUD())
            {
                GridViewRow row = EmployeeGrid.Rows[e.RowIndex];
                //control[0] karna 1 cell hanya ada 1 control saja
                //artinya 1 row disini hanya ada 1 textbox saja
                TextBox textmployeeId = row.Cells[0].Controls[0] as TextBox;
                int idItem = int.Parse(textmployeeId.Text);

                TextBox textFirstName = row.Cells[1].Controls[0] as TextBox;
                string namaItem = textFirstName.Text;

                TextBox textLastName = row.Cells[2].Controls[0] as TextBox;
                string kodeItem = textLastName.Text;

                TextBox textEmail = row.Cells[3].Controls[0] as TextBox;
                int harga = int.Parse(textEmail.Text);
                crud.updateItem(idItem, namaItem, kodeItem, harga);
            }
            EmployeeGrid.EditIndex = GetHashCode();
            UpdateDataGrid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "popup", "Logout()", true);
            Session["UserLogin"] = null;
            Response.Redirect("Login2.aspx");
        }
    }
}