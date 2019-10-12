using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class listeConsulter : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //int a = 0;
        //Response.Write("nbr" + gForm.Rows.Count.ToString());
        int nomF = Convert.ToInt32(Request.Form["r1"]);
        Response.Write(nomF.ToString());
        //string ba = gForm.Rows[nomF - 1].Cells[1].Text;
        LidForm.Text = nomF.ToString();

        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open(); 
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM formation1 where idForm = '" + LidForm.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nom = dr["nomForm"].ToString();
             
                 LnomForm.Text=nom;
             
            }
        }

        con.Close();
        con.Open();
        string req = "SELECT * FROM bulletin b , utilisateur u  WHERE b.mat=u.mat and idForm =   '" + LidForm.Text + "'";
        SqlCommand cmd1 = new SqlCommand(req, con);
        cmd1.CommandType = CommandType.Text;
        SqlDataReader dr1 = cmd1.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr1);
        int nbr = dt.Rows.Count;

        con.Close();
        if(nbr==0)
        {
            lListeP.Text = "Aucun Participant affécté à la formation";
            gpart.Visible = false;
            btnCon.Visible = false;
        }
        else
        {

        
            lListeP.Text = "Liste des Participant afféctés à la formation";
        gpart.Visible = true;
        btnCon.Visible = true;
        }



    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int nomF = Convert.ToInt32(Request.Form["r2"]);
        Response.Write(nomF.ToString());
        LidB.Text = nomF.ToString();
        Response.Redirect("BNadmin.aspx?numBull="+LidB.Text+"");
    }
}