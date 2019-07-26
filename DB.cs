using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
namespace Employees
{
    public class DB:IDisposable
    {
        private SqlConnection connection;

        public SqlConnection Connection
        {
            get
            {
                return this.connection;
            }
        }

        public DB()
        {
            try
            {
                SqlConnection sqlConn = new SqlConnection(@"Server=.\;Database=HR;Trusted_Connection=True;");
                this.connection = sqlConn;
            }
            catch (SqlException sqle)
            {
                Console.WriteLine("Connection Error");
            }
        }

        public void Dispose()
        {
        }
    }
}