using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class formAFF2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = Request.QueryString["numff"];
        if (!IsPostBack)
        {
           
            BindCostumers();
            BindCostumers1();
            //Response.Write("nbr" + gr1.Rows.Count.ToString() + "<br>");
            //Response.Write("nbr" + gr2.Rows.Count.ToString() + "<br>");
            if (gr2.Rows.Count.ToString() == "0")
            {
                Response.Write("tous les part son afféctes");
            }
        }
    }
    private void BindCostumers()
    {
        DataTable dt = new DataTable();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        using (SqlConnection con1 = new SqlConnection())
        {
            SqlDataAdapter da = new SqlDataAdapter("select u.mat , u.nom ,u.prenom ,u.ville , email ,tel from utilisateur u , formation1 f ,bulletin f2 WHERE u.mat = f2.mat and f.idForm = f2.idForm and f.idForm = '"+Label1.Text+"' ", con);
            da.Fill(dt);


        }
        if (dt.Rows.Count > 0)
        {
            gr1.DataSource = dt;
            gr1.DataBind();
        }
    }

    private void BindCostumers1()
    {
        DataTable dt = new DataTable();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        using (SqlConnection con1 = new SqlConnection())
        {
            SqlDataAdapter da = new SqlDataAdapter("select mat , nom ,prenom ,ville ,email ,tel from utilisateur where type='part'except select u.mat, u.nom, u.prenom, u.ville, email, tel from utilisateur u , formation1 f, bulletin f2 WHERE u.mat = f2.mat and f.idForm = f2.idForm and f.idForm = '"+Label1.Text+"' ", con);
            da.Fill(dt);


        }
        if (dt.Rows.Count > 0)
        {
            gr2.DataSource = dt;
            gr2.DataBind();
        }
    }

    protected void btnAff_Click(object sender, EventArgs e)
    {
       // Response.Write("islem");
        int[] tab = new int[50];
        int i = 0;
        foreach (GridViewRow row in gr2.Rows)
        {

            CheckBox status = (row.Cells[0].FindControl("CheckBox1") as CheckBox);

            if (status.Checked)
            {

               tab[i] = int.Parse(row.Cells[1].Text.ToString());

                //Response.Write("id" + tab[i] + "<br>");
                //Response.Write("cheked" + row.Cells[1].Text.ToString() + "<br>");
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "insert into bulletin (mat,idForm) values (" + tab[i] + ", '"+Label1.Text+"' ) ";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.ExecuteNonQuery();


                }



            }
           

        }

        BindCostumers();
        BindCostumers1();
        //Response.Write("nbr" + gr1.Rows.Count.ToString() + "<br>");
        if(gr1.Rows.Count.ToString()=="0")
        {
            Response.Write("Aucun Participant Affecté");
        }

       // Response.Write("nbr" + gr2.Rows.Count.ToString() + "<br>");
        if (gr2.Rows.Count.ToString() == "0")
        {
            Response.Write("tous les part son afféctes");
        }
    }
}