using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class LigneBull : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        //lidB.Text = Request.QueryString["idB"];
        lidB.Text = Session["idB"].ToString();
        //nomf.Text= Session["nomfor"].ToString();
        // nomf.Text = Session["nomForm"].ToString();
        lmat.Text = Session["matLien"].ToString();
        lmat.Visible = false;
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT nom,prenom FROM utilisateur where mat = '" + lmat.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nom = dr["nom"].ToString();
                string pren = dr["prenom"].ToString();
                //Response.Write("num module" + nomM);
                lnom.Text = nom;
                lpren.Text = pren;
            }
        }


        con.Close();

        con.Open();
        using (SqlCommand cmd = new SqlCommand("select * from bulletin inner join formation1 on bulletin.idForm=formation1.idForm where idB='" + lidB.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nom = dr["nomForm"].ToString();
                
                //Response.Write("num module" + nomM);
                nomf.Text = nom;
             
            }
        }


        con.Close();


        int i = 0;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT distinct module1.nomMod ,module1.idMod FROM leçon INNER JOIN ligneBull ON leçon.idL = ligneBull.idL INNER JOIN module1 ON leçon.idMod = module1.idMod where idB= '" + lidB.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                i++;
               // string nom = dr["nom"].ToString();

            }
        }

        con.Close();
       if(i==0)
        {
            lLeçExist.Visible = true;
        }
       else
        {
            lLeçExist.Visible = false;
        }



    }

    protected void btnConsulter_Click(object sender, EventArgs e)
    {
        Response.Redirect("bulletinNote.aspx");
    }
}