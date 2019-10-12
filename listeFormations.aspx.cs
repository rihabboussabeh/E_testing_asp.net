using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class listeFormations : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    private DataSet ds;
    SqlDataAdapter dr,dr2;

    protected void Page_Load(object sender, EventArgs e)
    {
        
        //Label1.Text = Request.QueryString["mat"];
        //Session["mat1"] = Label1.Text;
        Label1.Text = Session["matLien"].ToString();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT nom,prenom FROM utilisateur where mat = '" + Label1.Text + "'", con))
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
        Session["nom1Test"] = lnom.Text;
        Session["prenTest"] = lpren.Text;
        //con.Open();
        //SqlDataAdapter sqld = new SqlDataAdapter("select * from formation ",con);
        //DataTable dt = new DataTable();
        //sqld.Fill(dt);
        //Grid1.DataSource = dt;
        //Grid1.DataBind();


        //Response.Write("matricule" + Label1.Text);

        // Response.Write("nbr" + gr1.Rows.Count.ToString() + "<br>");
        if (gr1.Rows.Count.ToString()=="0")
        {
            //Response.Write("vous n'avez pas participé dans aucune formation ");
            lformNonexiste.Visible = true;
           
        }
        else
        {
            //Response.Write("mrigil ");
            lform.Visible = true;
            gr1.Visible = true;
        }


       

    }



    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void gr1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string nomForm = gr1.SelectedRow.Cells[2].Text;
        Response.Write(nomForm);
        Session["nomfor"] = nomForm;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT idForm FROM formation1 where nomForm = '" + nomForm + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string numF = dr["idForm"].ToString();
                // Response.Write("num Formation"+numF);
               Label2.Text = numF;
                //numF.Text = nomF;
            }
        }
        con.Close();


        con.Open();
        string req = "select * from formation1 f inner join module1 m on f.idForm=m.idForm inner join leçon l on m.idMod=l.idMod where nomForm = '" + nomForm + "'";
        SqlCommand cmd1 = new SqlCommand(req, con);
        cmd1.CommandType = CommandType.Text;
        SqlDataReader dr1 = cmd1.ExecuteReader();
        DataTable dt = new DataTable();
        dt.Load(dr1);
        int nbr = dt.Rows.Count;

        con.Close();
        
        if(nbr==0)
        {
            llisteMod.Visible = false;
            lmodExist.Visible = true;
            lmodExist.Text = "cette formation n'a aucun module";
        }
        else
        {
            lmodExist.Visible = false;
            lmodExist.Text = "";
            llisteMod.Visible = true;

            Button1.Visible = false;

            choix.Visible = false;
            choix2.Visible = false;
            lnomForm.Visible = false;
            lnomMod.Visible = false;
        }





        //con.Open();
        //int i = 0;
        //using (SqlCommand cmd = new SqlCommand("select m.nomMod,count(l.idL) as nbr from formation1 f, module1 m , leçon l where  m.idMod=l.idMod and f.idForm=m.idForm and m.idForm='" + Label2.Text + "' group by m.nomMod", con))
        //{
        //    cmd.CommandType = CommandType.Text;
        //    i++;
        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        string numM = dr["nbr"].ToString();
        //        //Response.Write("nbr Mod" + numM);
        //        nbr.Text = numM;
        //        //lnumForm.Text = numF;
        //        //numF.Text = nomF;
        //    }
        //}
        //Response.Write("islem"+i);

        //con.Close();
        ////string numForm = gr1.SelectedRow.Cells[1].Text;
        ////lnumForm.Text = numForm;

        ////string nomForm = gr1.SelectedRow.Cells[2].Text;
        ////lnomForm.Text = nomForm;

        //if (GridView1.Rows.Count.ToString() == "0")
        //{
        //    Response.Write(" non mrigil ");
        //    lmodExist.Visible = true;
        //    //llisteMod.Visible = false;
        //    //GridView1.Visible = false;
        //    llisteMod.Visible = true;

        //}
        //else
        //{
        //    llisteMod.Visible = true;
        //    Response.Write("mrigil ");
        //    lmodExist.Visible = false;
        //    //GridView1.Visible = true;
        //}
        Session["numMod"] = lnumMod.Text;
        Session["numForm"] = Label2.Text;
        con.Open();
        using (SqlCommand cmd = new SqlCommand("select idB from bulletin where idForm='" + Label2.Text + "' and mat='" + Label1.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string idB = dr["idB"].ToString();
                lidB.Text = idB;
                //Response.Write("num l=bull" + idB);

            }
        }

        con.Close();
        Session["idB"] = lidB.Text;



    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        string nomForm = gr1.SelectedRow.Cells[2].Text;
       
        Response.Write("idForm "+nomForm);
        lnomForm.Text = nomForm;

        string nomMod = GridView1.SelectedRow.Cells[1].Text;
       // Response.Write("nomMod " + nomMod);
        lnomMod.Text = nomMod;

        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT idForm FROM formation1 where nomForm = '" + nomForm + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string numF = dr["idForm"].ToString();
               // Response.Write("num Formation"+numF);
                lnumForm.Text = numF;
                //numF.Text = nomF;
            }
        }
        con.Close();

        con.Open();
        using (SqlCommand cmd = new SqlCommand("SELECT idMod FROM module1 where nomMod = '" + nomMod + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string numM = dr["idMod"].ToString();
               // Response.Write("num mod" + numM);
                lnumMod.Text = numM;
                //numF.Text = nomF;
            }
        }
        con.Close();
        Response.Write(Label2.Text);


      
        //string numMod = GridView1.SelectedRow.Cells[1].Text;
        //lnumMod.Text = numMod;
        //Response.Write("num Mod"+numMod+"<br>");

        ////Response.Write(GridView1.SelectedRow.Cells[1].Text);

        //string nomMod = GridView1.SelectedRow.Cells[2].Text;
        //lnomMod.Text = nomMod;
        ////Response.Write("islem");

        //string numForm = gr1.SelectedRow.Cells[1].Text;
        //lnumForm.Text = numForm;

        //string nomForm = gr1.SelectedRow.Cells[2].Text;
        //lnomForm.Text = nomForm;
        //con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        //con.Open();
        //using (SqlCommand cmd = new SqlCommand("SELECT idForm FROM formation1 where nomForm = '" + lnomForm.Text + "'", con))
        //{
        //    cmd.CommandType = CommandType.Text;

        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        string nomF = dr["idForm"].ToString();
        //        //Response.Write("num Formation"+nomF);
        //        numF.Text = nomF;
        //    }
        //}
        //con.Close();
        //con.Open();
        //using (SqlCommand cmd = new SqlCommand("SELECT idMod FROM module1 where nomMod = '" + lnomMod.Text + "'", con))
        //{
        //    cmd.CommandType = CommandType.Text;

        //    SqlDataReader dr1 = cmd.ExecuteReader();
        //    while (dr1.Read())
        //    {
        //        string nomM = dr1["idMod"].ToString();
        //       // Response.Write("num module" + nomM);
        //        numM.Text = nomM;
        //    }
        //}

        //choix.Visible = true;
        //choix2.Visible = true;
        //lnomForm.Visible = true;
        //lnomMod.Visible = true;
        Button1.Visible = true;
       
        choix.Visible = true;
        choix2.Visible = true;
        lnomForm.Visible = true;
        lnomMod.Visible = true;


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
       
        //Session["numMod"] = lnumMod.Text;
        
        Response.Redirect("lecon.aspx?form=" + lnumForm.Text + "&" + "mod=" + lnumMod.Text + "");
    }
}