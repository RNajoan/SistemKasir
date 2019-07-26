using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChasierSystem;
namespace ASP.NETWITHDB1.Pages
{
    public partial class Register1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLogin"] != null)
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (textPassword.Value != textPassConf.Value)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "FailPassword()", true);
            }
            else { 
            using (ChasierCRUD chasierCRUD = new ChasierCRUD())
            {
                string fname = textName.Value;
                string pass = textPassword.Value;
                string passconf = textPassConf.Value;
                string email = textEmail.Value;
                string tipe = gender.SelectedItem.ToString();


                Chasier chasier = new Chasier();
                chasier.Password = pass;
                chasier.Email = email;
                chasierCRUD.CalEmail(chasier);
                chasierCRUD.Encrypt(chasier);
                string passEncrypt = chasier.EncryptPass.ToString();
                Response.Write(chasier.EncryptPass);
                if (chasier.TotalEmail != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "Fail()", true);
                }
                if (chasier.TotalEmail == 0)
                {

                    chasierCRUD.Register(new Chasier
                    {
                        Fname = fname,
                        Password = chasier.EncryptPass,
                        Email = email,
                        Gender = tipe
                    });
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "Berhasil()", true);
                }
                //Response.Write(chasier.Password);
                };
            }
        }
    }
}