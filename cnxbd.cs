using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Xml.Linq;
using System.Data.SqlClient;

/// <summary>
/// Description résumée de SqlClientConnection
/// </summary>
public class cnxbd
{
    string cnxstring = "";
    //private String sConnectionString = "Data Source=(local);Initial Catalog=pfe;Persist Security Info=True;User ID=islem;Password=123";
    public SqlConnection oSqlConnection;
    public SqlDataAdapter oSqlDataAdapter;

    public cnxbd()
    {

    }
    //Retourne l'objet de connexion
    public SqlConnection CreerConnection()
    {
        try
        {
            if (oSqlConnection == null)
            {
                oSqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnectionString"].ConnectionString);
                //if (String.IsNullOrEmpty(cnxstring ))
                //    throw new Exception("Chaine de connexion SQL Server introuvable");
                // else
                //   oSqlConnection.ConnectionString = cnxstring ;
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return oSqlConnection;
    }
    public SqlDataAdapter CreerAdapter(string command)
    {
        try
        {
            if (oSqlDataAdapter == null)
            {
                oSqlDataAdapter = new SqlDataAdapter(command, oSqlConnection);
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return oSqlDataAdapter;
    }


    public Boolean OuvrirConnection()
    {
        Boolean bResultat = false;
        try
        {
            if ((oSqlConnection != null))
            {
                if (oSqlConnection.State == System.Data.ConnectionState.Closed)
                {
                    oSqlConnection.Open();
                    bResultat = true;
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
        return bResultat;
    }

    public Boolean FermerConnection()
    {
        Boolean bResultat = true;
        try
        {
            if ((oSqlConnection != null))
                oSqlConnection.Close();
            else
                bResultat = false;
        }
        catch (Exception ex)
        {
            bResultat = false;
            throw ex;
        }
        return bResultat;
    }
}
