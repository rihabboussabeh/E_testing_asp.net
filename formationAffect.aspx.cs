using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class formationAffect : System.Web.UI.Page
{
    public string nomFormR = "";
    public int nbr = 0;
    SqlConnection con = new SqlConnection();
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dtbl = new DataTable();
        nomFormR = DropDownList1.SelectedValue;
        // Response.Write("numForm" + nomFormR);
        numForm.Text = nomFormR;
        numForm.Visible = true;

        Label3.Text = DropDownList1.SelectedItem.ToString();
        GridView1.Visible = true;
        string a;
        Response.Write("nbr" + GridView1.Rows.Count.ToString() + "<br>");
        a = GridView1.Rows.Count.ToString();
        //Response.Write(a);
        int i = 0;

        if (a == "0")
        {
            Response.Write("fera8");
        }
        else
        {
            Response.Write("non fera8");

        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int[] tab = new int[50];
        string a;
        Response.Write("nbr" + GridView1.Rows.Count.ToString()+"<br>");
        a = GridView1.Rows.Count.ToString();
        //Response.Write(a);
        int i = 0;

        if (a=="0")
        {
            Response.Write("fera8");
        }
        else
        {
            Response.Write("non fera8");

        }
        foreach (GridViewRow row in GridView1.Rows)
        {

            CheckBox status = (row.Cells[6].FindControl("CheckBox1") as CheckBox);

            if (status.Checked)
            {
               
                tab[i] = int.Parse(row.Cells[0].Text.ToString());

                Response.Write("id" + tab[i] + "<br>");
                Response.Write("cheked" + row.Cells[0].Text.ToString() + "<br>");
                using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
                {
                    sqlCon.Open();
                    string query = "insert into formAff (mat,idForm) values (" + tab[i] + "," + numForm.Text + ") ";
                    SqlCommand sqlCmd = new SqlCommand(query, sqlCon);

                    sqlCmd.ExecuteNonQuery();


                }

            

        }

        }
    }

}