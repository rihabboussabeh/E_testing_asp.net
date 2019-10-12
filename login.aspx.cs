using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    // SqlCommand com = new SqlCommand();
    SqlDataAdapter dr;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (tlog.Text == "" || tmp.Text == "")
        {
            Lmesg.Visible = true;
            Lmesg.Text = "Login & MP vides..!!!";
        }
        else
        {
          
           con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
           con.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT * FROM utilisateur where mat = '" + tlog.Text + "' and mp = '" + tmp.Text + "'", con))
            {
                cmd.CommandType = CommandType.Text;
               
                SqlDataReader dr = cmd.ExecuteReader();
                int i = 0;
                while (dr.Read())
                {
                    i++;
                    string typ = dr["type"].ToString();
                    Session["matLien"] = tlog.Text;

                    if (typ=="part")
                    {
                        
                        Response.Redirect("espacePart.aspx");
                      // Response.Redirect("espacePart.aspx?mat=" + tlog.Text+ "");
                       
                       // Response.Write(tlog.Text);
                        
                       // Response.Redirect("listeFormations.aspx?mat=" + tlog.Text + "");
                    }
                    else
                    {
                        if (typ == "gest")
                        {
                            Response.Redirect("acceuilGest.aspx?mat=" + tlog.Text + "");
                        }
                        else
                        {
                            Response.Redirect("acceuilAdmin.aspx?mat=" + tlog.Text + "");
                        }
                        
                    }

                    Response.Write(i);

                }

                Lmesg.Text = "vérifiez vos cordonnées SVP";


            }

            //  SqlCommand cmd = new SqlCommand();
            //   string st = "SELECT * FROM utilisateur where mat ='" + tlog.Text + "' and mp ='" + tmp.Text + "'";
            //   cmd.CommandText = st;
            //   cmd.CommandType = CommandType.Text;
            //   cmd.Connection = con;
            //    string connecte;

            //   try
            //   {
            //        connecte = cmd.ExecuteScalar().ToString().Trim();
            //        Response.Redirect("menu.aspx?mat="+tlog.Text+"");
            //    }
            //   catch (Exception)
            //   {
            //        connecte = "notfound";
            //        Lmesg.Text = "not found";
            //   }
            }
        }
}