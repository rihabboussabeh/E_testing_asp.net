using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class listeModulesP : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    private DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        Lid.Text = Request.QueryString["idForm"];
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open();
        SqlDataAdapter sqld = new SqlDataAdapter("select * from module", con);
        DataTable dt = new DataTable();
        sqld.Fill(dt);
        Grid1.DataSource = dt;
        Grid1.DataBind();
    }
}