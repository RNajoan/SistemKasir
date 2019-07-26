using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Employees;
namespace ChasierSystem
{
    public class Chasier:IDisposable
    {
        private int id_item;
        private string nama_item;
        private string kode_item;
        private int harga_item;
        private int total_harga;
        private int total_item;

        private string fname;
        private string lname;
        private string username;
        private string password;
        private string email;
        private string gender;
        private int totalEmail;
        private bool cekpassword;
        private string ecryptPass;

        public string EncryptPass
        {
            get
            {
                return this.ecryptPass;
            }
            set
            {
                this.ecryptPass = value;
            }
        }
        public bool CekPassword
        {
            get
            {
                return this.cekpassword;
            }
            set
            {
                this.cekpassword = value;
            }
        }
        public int TotalEmail
        {
            get
            {
                return this.totalEmail;
            }
            set
            {
                this.totalEmail = value;
            }
        }
        public string Gender
        {
            get
            {
                return this.gender;
            }
            set
            {
                this.gender = value;
            }
        }
        public string Fname
        {
            get
            {
                return this.fname;
            }
            set
            {
                this.fname = value;
            }
        }
        public string Lname
        {
            get
            {
                return this.lname;
            }
            set
            {
                this.lname = value;
            }
        }
        public string Username
        {
            get
            {
                return this.username;
            }
            set
            {
                this.username = value;
            }
        }
        public string Email
        {
            get
            {
                return this.email;
            }
            set
            {
                this.email = value;
            }
        }
        public string Password
        {
            get
            {
                return this.password;
            }
            set
            {
                this.password = value;
            }
        }
        public int Id_Item
        {
            get
            {
                return this.id_item;
            }
            set
            {
                this.id_item = value;
            }
        }
        public string Nama_Item
        {
            get
            {
                return this.nama_item;
            }
            set
            {
                this.nama_item = value;
            }
        }
        public string Kode_Item
        {
            get
            {
                return this.kode_item;
            }
            set
            {
                this.kode_item = value;
            }
        }
        public int Harga_Item
        {
            get
            {
                return this.harga_item;
            }
            set
            {
                this.harga_item = value;
            }
        }
        public int Total_Item
        {
            get
            {
                return this.total_item;
            }
            set
            {
                this.total_item = value;
            }
        }
        public int Total_Harga
        {
            get
            {
                return this.total_harga;
            }
            set
            {
                this.total_harga = value;
            }
        }

        public void Dispose()
        {
        }
    }
}