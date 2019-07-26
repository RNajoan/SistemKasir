using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Employees;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
namespace ChasierSystem
{
    public class ChasierCRUD:IDisposable
    {
        private SqlConnection connection;

        public ChasierCRUD()
        {
            DB db = new DB();
            connection = db.Connection;
        }

        public void Encrypt(Chasier chasier)
        {
            using(MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                UTF8Encoding utf8 = new UTF8Encoding();
                byte[] data = md5.ComputeHash(utf8.GetBytes(chasier.Password));
                chasier.EncryptPass = Convert.ToBase64String(data);
                //return Convert.ToBase64String(data);
            }
        }

        
        public void Login(Chasier chasier)
        {
            //string decryptPass = Encrypt(chasier);
            try { 
            connection.Open();
            string cekPass = "SELECT password FROM dbo.userlogin where email='" + chasier.Email + "'";
            SqlCommand command = new SqlCommand(cekPass,connection);
            string password = Convert.ToString(command.ExecuteScalar().ToString());
            connection.Close();
            if(password == chasier.EncryptPass)
            {
                chasier.CekPassword = true;
            }
            else if(password !=chasier.Password)
            {
                chasier.CekPassword = false;
            }
            }catch(Exception e)
            {
                Console.Write(e.Message);
            }
        }

        public void CalEmail(Chasier chasier)
        {
            connection.Open();
            string cekUser = "SELECT COUNT(*) FROM dbo.userlogin where email='" + chasier.Email + "' ";
            SqlCommand command = new SqlCommand(cekUser, connection);
            int jumlah = int.Parse(command.ExecuteScalar().ToString());
            chasier.TotalEmail = jumlah;
            connection.Close();
        }

        public void Register(Chasier chasier)
        {
            connection.Open();
            string cekUser = "SELECT COUNT(*) FROM dbo.userlogin where email='"+ chasier.Email +"' ";
            SqlCommand command = new SqlCommand(cekUser,connection);
            int jumlah = int.Parse(command.ExecuteScalar().ToString());
            connection.Close();
            if(jumlah != 0)
            {
               
            }
            else
            {
                try { 
                connection.Open();
                string insert = "insert into dbo.userlogin VALUES(@Fname,@email,@password,@gender)";
                SqlCommand queryInsert = new SqlCommand(insert,connection);
                queryInsert.Parameters.AddWithValue("@Fname",chasier.Fname);
                queryInsert.Parameters.AddWithValue("@email",chasier.Email);
                queryInsert.Parameters.AddWithValue("@password",chasier.Password);
                queryInsert.Parameters.AddWithValue("@gender",chasier.Gender);
                queryInsert.ExecuteNonQuery();
                
                }catch(Exception e)
                {
                    Console.WriteLine(e.Message);
                }
                connection.Close();
            }

        }

        public List<Chasier> SelectEmployees()
        {

            List<Chasier> chasiers = new List<Chasier>();
            try
            {
                connection.Open();
            }
            catch (SqlException sqle)
            {
                Console.WriteLine("Connection error");
            }
            SqlCommand command = new SqlCommand("select * from dbo.ChasierSystem", connection);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                Chasier chasier = new Chasier();
                chasier.Id_Item = int.Parse(reader["id_item"].ToString());
                chasier.Nama_Item = reader["nama_item"].ToString();
                chasier.Kode_Item = reader["kode_item"].ToString();
                chasier.Harga_Item = int.Parse(reader["harga_item"].ToString());

                chasiers.Add(chasier);
            }

            connection.Close();
            return chasiers;
        }

        public void InsertEmployee(Chasier chasier)
        {
            try { 
            connection.Open();

            SqlCommand command = new SqlCommand("insert into dbo.ChasierSystem(nama_item, kode_item, harga_item) values(@firstName, @lastName, @email)", connection);
            
            command.Parameters.AddWithValue("@firstName", chasier.Nama_Item);
            command.Parameters.AddWithValue("@lastName", chasier.Kode_Item);
            command.Parameters.AddWithValue("@email", chasier.Harga_Item);
            command.ExecuteNonQuery();
            Console.WriteLine("Insert success with employee_id {0}", chasier.Id_Item);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
            connection.Close();
        }

        public void updateItem(int id, string name, string kode, int harga)
        {
            connection.Open();

            SqlCommand command = new SqlCommand("update dbo.ChasierSystem set nama_item = @nama, kode_item = @kode, harga_item = @harga where id_item = @id", connection);
            command.Parameters.AddWithValue("@id", id);
            command.Parameters.AddWithValue("@nama", name);
            command.Parameters.AddWithValue("@kode", kode);
            command.Parameters.AddWithValue("@harga", harga);
            if (command.ExecuteNonQuery() < 1)
            {
                Console.WriteLine("Data tidak ditemukan");
            }
            else
            {
                Console.WriteLine("Update success with employee_id {0}", id);
            }

            connection.Close();
        }

        public void Delete(int id)
        {
            connection.Open();

            SqlCommand command = new SqlCommand("delete from dbo.ChasierSystem where id_item = @empID", connection);
            command.Parameters.AddWithValue("@empId", id);
            command.ExecuteNonQuery();
            Console.WriteLine("Delete success with employee_id {0}", id);
            
            connection.Close();
        }


        public void Dispose()
        {
        }
    }
}