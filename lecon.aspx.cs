using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class lecon : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    private DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        lform.Text = Session["numForm"].ToString();
        lmod.Text = Request.QueryString["idL"];
        //lmod.Text = Session["numMod"].ToString();
        //lform.Text = Request.QueryString["form"];

        //lmod.Text  = Request.QueryString["mod"];
        liB.Text= Session["idB"].ToString();
     

        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT nomForm FROM formation1 f ,module1 m where f.idForm=m.idForm and m.idMod= '" + lmod.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nomF = dr["nomForm"].ToString();

                //Response.Write("num module" + nomF);
                lnomForm.Text = nomF;

            }
        }

        con.Close();

        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT nomMod FROM module1 where idMod = '" + lmod.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nomM = dr["nomMod"].ToString();

                //Response.Write("num module" + nomM);
                lnomMod.Text = nomM;

            }
        }

        con.Close();


        //string ch = lform.Text;
        //Response.Write("formation"+ch);

        //con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        //con.Open();
        //// string req = "select * from formation1 where nomForm=" + lform.Text+"";
        //string req = "select * from lecon ";
        //SqlDataAdapter sqld = new SqlDataAdapter(req, con);
        //DataTable dt = new DataTable();
        //sqld.Fill(dt);
        //GridView1.DataSource = dt;
        //GridView1.DataBind();


        if (!IsPostBack)
        {
            BindCostumers();
        }
        if (gr2.Rows.Count.ToString() == "0")
        {
            llecExist.Text = "Ce Module ne contient aucun Leçon préte à passer";
        }
        }

    private void BindCostumers()
    {
        DataTable dt = new DataTable();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        using (SqlConnection con1 = new SqlConnection())
        {
            //SqlDataAdapter da = new SqlDataAdapter("select * from leçon where idMod='"+lmod.Text+"'",con);
            SqlDataAdapter da = new SqlDataAdapter("SELECT leçon.idL,nomL, ligneBull.idB, max(ligneBull.note) as note,contL  FROM leçon left JOIN ligneBull ON leçon.idL = ligneBull.idL  where leçon.idMod = '" + lmod.Text + "' and(idB = '" + liB.Text + "' or idB is null)  group by leçon.idL, leçon.nomL, contL, ligneBull.idB", con);

            da.Fill(dt);


        }
        if(dt.Rows.Count>0)
        {
            gr2.DataSource = dt;
            gr2.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //string numL = GridView1.SelectedRow.Cells[1].Text;
        //Label1.Text = numL;
    }



    protected void gr2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //    if(e.Row.Cells[2].Text.CompareTo("2027")==0)
            //    {
            //       // e.Row.CssClass = "red";
            //        e.Row.Enabled = false;
            //    }
            //    else
            //    {
            //       // e.Row.Cells[2].CssClass = "green";
            //    }

            con.Open();
            int i = 0;
            using (SqlCommand cmd = new SqlCommand("select * from leçon l1 , ligneBull l2 where l1.idL = l2.idL and idB='"+liB.Text+"' and idMod = '"+lmod.Text+"'", con))
            {
                cmd.CommandType = CommandType.Text;

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    i++;

                    string nomM = dr["note"].ToString();
                    
                    if (e.Row.Cells[1].Text.CompareTo(dr["nomL"].ToString()) == 0)

                    {
                        //Response.Write(nomM+dr["idL"].ToString()+"<br>");
                        //break;
                        //e.Row.Enabled = false;

                        if (float.Parse(dr["note"].ToString()) >= 10)
                        {

                            // Response.Write("mrigil"+i+"<br>");
                            e.Row.Enabled = false;
                            break;
                        }
                        else
                        {
                            //e.Row.Enabled = false;
                        }
                    }

                    // Response.Write("note" + nomM);
                    //lnomMod.Text = nomM;

                }
            }

            con.Close();


        }
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("listeFormations.aspx");
    }
}