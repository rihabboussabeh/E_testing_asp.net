using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class gestModG: System.Web.UI.Page
{
    public string a;
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        a = DropDownList1.SelectedValue;
        //Response.Write(a);
        //Response.Write(DropDownList1.SelectedItem);
        Label1.Text = a;

        Session["numMod1"] = Label1.Text;
        Session["nomformLabel1"] = Label2.Text;

        Label2.Visible = false;


    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("gestModuleG.aspx");


    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Text = DropDownList1.SelectedItem.ToString();
        Label2.Visible = true;
    }
}