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
    public partial class Login1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                Response.Redirect("Index.aspx");
            }
            string email = textEmail.Value;

            if (textEmail.Value == null)
            {

                load(email);
            }
            load(email);
        }
        public void load(string email)
        {
            using (ChasierCRUD chasierCRUD = new ChasierCRUD())
            {

                Chasier chasier = new Chasier();
                string password = textPasswor.Value;
                email = textEmail.Value;
                chasier.Email = email;
                chasier.Password = password;

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
                    //Response.Write("Email Belum Terdaftar");
                    Response.Write(email);
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "EmailFail()", true);
                }
                textEmail.Value = string.Empty;
                textPasswor.Value = string.Empty;
                chasier.Password = string.Empty;
                chasier.Email = string.Empty;
            }
        }
    }
}