using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class espacePartMod : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        lmat.Text = Session["matLien"].ToString();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        string req = "SELECT * FROM utilisateur where mat ='" + lmat.Text + "'";
        cmd.CommandText = req;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        SqlDataReader r1 = cmd.ExecuteReader();
        if (r1.Read())
        {
            TextBox3.Text = r1["mat"].ToString();
            TextBox2.Text = r1["nom"].ToString();
            tpren.Text = r1["prenom"].ToString();
            temail.Text = r1["email"].ToString();
            tville.Text = r1["ville"].ToString();
            tcode.Text = r1["codeP"].ToString();
            ttel.Text = r1["tel"].ToString();
            tmp.Text = r1["mp"].ToString();


        }
        con.Close();
    }

    protected void btnMod_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        // string gg = tnom.Text;
        // Response.Write("nom11" + gg + "<br>");
        Response.Write(lmat.Text);
        string req = "update  utilisateur set nom='" + TextBox2.Text + "' where mat ='" + lmat.Text + "'";
        cmd.CommandText = req;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        SqlDataReader r1 = cmd.ExecuteReader();
        //Response.Write("nom2" + gg + "<br>");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        string gg = TextBox2.Text;
        Response.Write("nom11" + gg + "<br>");
        string req = "update  utilisateur set nom='" + TextBox2.Text + "' where mat ='" + lmat.Text + "'";
        cmd.CommandText = req;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        SqlDataReader r1 = cmd.ExecuteReader();
        Response.Write("nom2" + gg + "<br>");
    }
}