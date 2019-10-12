using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class BNadmin : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    SqlConnection con1 = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        lidB.Text = Request["numBull"];
        lidB.Visible = false;

        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

        con.Open();
        string req = "SELECT distinct module1.nomMod, module1.idMod FROM leçon INNER JOIN ligneBull ON leçon.idL = ligneBull.idL INNER JOIN module1 ON leçon.idMod = module1.idMod where idB = '" + lidB.Text + "'";
        SqlCommand cmd4 = new SqlCommand(req, con);
        cmd4.CommandType = CommandType.Text;
        SqlDataReader dr4 = cmd4.ExecuteReader();
        DataTable dt1 = new DataTable();
        dt1.Load(dr4);
        int nbr = dt1.Rows.Count;

        con.Close();
        if(nbr==0)
        {
            Label1.Text = "Aucune leçon passé";
        }

            con.Open();
        using (SqlCommand cmd = new SqlCommand("select * from bulletin b , utilisateur u , formation1 f where b.mat=u.mat and b.idForm=f.idForm and idB='" + lidB.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nom = dr["nom"].ToString();
                Lnom.Text = nom;

                string prenom = dr["prenom"].ToString();
                Lpren.Text = prenom;

                string nomF = dr["nomForm"].ToString();
                LnomF.Text = nomF;

                string mat = dr["mat"].ToString();
                Lmat.Text = mat;
                Lmat.Visible = false;
                



            }
        }

        con.Close();

        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT distinct module1.nomMod, module1.idMod FROM leçon INNER JOIN ligneBull ON leçon.idL = ligneBull.idL INNER JOIN module1 ON leçon.idMod = module1.idMod where idB = '" + lidB.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
           
            while (dr.Read())
            {
               
                string nom = dr["nomMod"].ToString();
                string idMod = dr["idMod"].ToString();
                Label l1 = new Label();
                l1.Text = nom;
               // Panel1.Controls.Add(new LiteralControl("<br>"));
                l1.CssClass = "button2";
                Panel1.Controls.Add(l1);
                

                Panel1.Controls.Add(new LiteralControl("<br>"));
                Panel1.Controls.Add(new LiteralControl("<br>"));
                Panel1.Controls.Add(new LiteralControl("<br>"));
                Panel1.Controls.Add(new LiteralControl("<br>"));

                // dr.Close();
                con1.Open();
                using (SqlCommand cmd1 = new SqlCommand("SELECT leçon.idL,nomL, max(ligneBull.note) as note  FROM leçon INNER JOIN ligneBull ON leçon.idL = ligneBull.idL INNER JOIN module1 ON leçon.idMod = module1.idMod where idB='"+lidB.Text+"' and module1.idMod='"+idMod+ "' group by leçon.idL, nomL", con1))
                {
                    cmd1.CommandType = CommandType.Text;

                    SqlDataReader dr1 = cmd1.ExecuteReader();
                    while (dr1.Read())
                    {
                        
                        string nomL = dr1["nomL"].ToString();
                        Label l2 = new Label();
                        l2.Text = nomL;
                        l2.CssClass = "h10";
                        Panel1.Controls.Add(l2);
                      
                        Panel1.Controls.Add(new LiteralControl("&nbsp;"));
                        Panel1.Controls.Add(new LiteralControl("&nbsp; "));
                        Panel1.Controls.Add(new LiteralControl(" &nbsp;"));
                        Panel1.Controls.Add(new LiteralControl("||"));
                        string note = dr1["note"].ToString();
                        Label l3 = new Label();
                        l3.Text = note;
                        l3.CssClass = "h10";
                        
                        Panel1.Controls.Add(l3);
                      
                        //string date = dr1["date"].ToString();
                        //Label l4 = new Label();
                        //l4.Text = date;
                        //Panel1.Controls.Add(l4);
                        Panel1.Controls.Add(new LiteralControl("<br>"));
                        Panel1.Controls.Add(new LiteralControl("<br>"));
                        Panel1.Controls.Add(new LiteralControl("<br>"));

                    }
                  
                }

                con1.Close();

            }
        }


        con.Close();

       
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("listeConsulter.aspx");
    }
}