using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class affecPart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //int nbr = 0;
        ////numForm.Text = Session["formAff1"].ToString();
        //nbr = CheckBoxList1.Items.Count;
        //Response.Write(nbr);

    }

    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    //Response.Redirect("formAff.aspx");
    //}

    protected void Button1_Click1(object sender, EventArgs e)
    {
        int a=0;
       Response.Write("nbr"+ GridView1.Rows.Count.ToString());
        for (int i=0;i<GridView1.PageSize;i++)
        {
            a++;
            Response.Write("islem"+a);

        }
        Response.Write(a);

        foreach (GridViewRow row in GridView1.Rows)
        {


            CheckBox status = (row.Cells[3].FindControl("CheckBox1") as CheckBox);

            if (status.Checked)
            {
                Response.Write("cheked" + row.Cells[1].Text.ToString() + "<br>");

            }

        }
    }
}