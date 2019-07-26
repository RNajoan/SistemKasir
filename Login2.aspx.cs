using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChasierSystem;
namespace ASP.NETWITHDB1.Pages
{
    public partial class Login2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (ChasierCRUD chasierCRUD = new ChasierCRUD())
            {
                string email = textEmail.Value;
                string pass = textPassword.Value;
                Chasier chasier = new Chasier();
                chasier.Email = email;
                chasier.Password = pass;

                chasierCRUD.Encrypt(chasier);
                Response.Write(chasier.EncryptPass);
                chasierCRUD.CalEmail(chasier);
                chasierCRUD.Login(chasier);
                if (chasier.TotalEmail != 0)
                {
                    if (chasier.CekPassword == true)
                    {
                        Session["UserLogin"] = email;
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "Berhasil()", true);
                    }
                    else if (chasier.CekPassword == false)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "PassFail()", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "EmailFail()", true);
                }
                textEmail.Value = string.Empty;
                textPassword.Value = string.Empty;
                chasier.Password = string.Empty;
                chasier.Email = string.Empty;
            }
        }
    }
}