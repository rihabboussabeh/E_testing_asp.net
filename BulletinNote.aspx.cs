using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class BulletinNote : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        lmat.Text = Session["matLien"].ToString();
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
                // Response.Write("num module" + nomM);
                lnom.Text = nom;
                lpren.Text = pren;
            }
        }

        con.Close();



       


    }

    protected void btnConsulter_Click(object sender, EventArgs e)
    {
        string numB,nomForm;
        numB = DropDownList1.SelectedValue;
        Response.Write(numB);
        lidB.Text = numB;
        nomForm = DropDownList1.SelectedItem.ToString();
        Response.Write(nomForm);
        Session["nomForm"] = nomForm;
        // Session["nomForm"] = nomForm;
      
        con.Open();
        using (SqlCommand cmd = new SqlCommand("select idB from bulletin where idForm='" + lidB.Text + "' and mat='" + lmat.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string idB = dr["idB"].ToString();
                lidB.Text = idB;
                Response.Write("num module" + idB);

            }
        }

        con.Close();
        Session["idB"] = lidB.Text;
        Response.Redirect("LigneBull.aspx");
        //Response.Redirect("LigneBull.aspx?idB="+lidB.Text+"");
    }
}