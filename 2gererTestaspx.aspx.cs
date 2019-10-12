using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class _2gererTestaspx : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    string a,b;
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

        a = DropDownList1.SelectedValue;
        
        DropDownList2.Visible = true;

        con.Open();
        using (SqlCommand cmd = new SqlCommand("select count(*) as nbr from module1 where idForm='" + a + "'", con))
        {
            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nbr = dr["nbr"].ToString();

                Response.Write("nbr" + nbr);
                if (nbr == "0")
                {
                    Label1.Visible = true;
                    Label1.Text = "acun module";
                   
                    DropDownList2.Visible = false;
                   
                    Button1.Visible = false;
                    
                   
                }
                else
                {
                    DropDownList2.Visible = true;
                   
                    Label1.Visible = false;
                   Button1.Visible = true;
                    
                   

                }

            }

        }

        con.Close();


    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("islem");
        Button1.Visible = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        b = DropDownList2.SelectedValue;
        Response.Write("nummod" + b);
        Response.Write("num" + a);
        numMod.Text = b;
        Session["l1"] = numMod.Text;
        Response.Redirect("gestL.aspx");
    }
}