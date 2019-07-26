using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ChasierSystem;
using System.Data;
using System.Security.Cryptography;
namespace ASP.NETWITHDB1.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (ChasierCRUD chasierCRUD = new ChasierCRUD())
            {
                string fname = TextName.Text;
                string pass = TextPassword.Text;
                string passconf = TextPassConf.Text;
                string email = TextEmail.Text;
                string tipe = gender.SelectedItem.ToString();

                Chasier chasier = new Chasier();
                chasier.Password = pass;
                chasier.Email = email;
                chasierCRUD.CalEmail(chasier);
                chasierCRUD.Encrypt(chasier);
                string passEncrypt = chasier.EncryptPass.ToString();
                Response.Write(chasier.EncryptPass);
                if(chasier.TotalEmail != 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "Fail()", true);
                }
                if(chasier.TotalEmail == 0)
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
                Response.Write(chasier.Password);
            };
        }
    }
}