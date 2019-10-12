using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class formtejrab : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {

        }
    }
    private void populateData()
    {
        //using(mydatabaseentiets)
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write(GridView1.SelectedRow.Cells[1].Text);
        string n = GridView1.SelectedRow.Cells[2].Text;
        Label1.Text = n;
    }
}