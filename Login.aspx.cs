using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChasierSystem;
using System.Data;
namespace ASP.NETWITHDB1.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["UserLogin"] != null)
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void Login_btn_Click(object sender, EventArgs e)
        {
            using (ChasierCRUD chasierCRUD = new ChasierCRUD())
            {
                string email = TextEmail.Text;
                string pass = Password.Text;
                Chasier chasier = new Chasier();
                chasier.Email = email;
                chasier.Password = pass;

                chasierCRUD.Encrypt(chasier);
                Response.Write(chasier.EncryptPass);
                chasierCRUD.CalEmail(chasier);
                chasierCRUD.Login(chasier);
                if(chasier.TotalEmail != 0)
                {
                    if (chasier.CekPassword == true)
                    {
                        Session["UserLogin"] = TextEmail.Text;
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "Berhasil()", true);
                    }
                    else if(chasier.CekPassword==false)
                    {
                        //Response.Write(chasier.CekPassword);
                        //Response.Write("Login Gagal");
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "PassFail()", true);
                    }
                }
                else
                {
                    //Response.Write("Email Belum Terdaftar");
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "EmailFail()", true);
                }
                TextEmail.Text = string.Empty;
                Password.Text = string.Empty;
                chasier.Password = string.Empty;
                chasier.Email = string.Empty;
            }
        }
    }
}