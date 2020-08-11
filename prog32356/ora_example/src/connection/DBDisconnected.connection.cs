using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace OraExample.Connection
{
    class DBDisconnected : DBAuth
    {
        public DataSet RetrievedData {get;} = new DataSet();
        private OracleDataAdapter _adapter;

        public static OracleDataAdapter GetAdapter(string queryString) { return new OracleDataAdapter (queryString, DBAuth.ConnectionString); }

        public DBDisconnected (string queryString) 
        {
            _adapter = new OracleDataAdapter (queryString, DBAuth.ConnectionString);
        }

        public DBDisconnected (string queryString, string from) : this(queryString)
        {
            _adapter.Fill (RetrievedData, from);
        }

    }
}