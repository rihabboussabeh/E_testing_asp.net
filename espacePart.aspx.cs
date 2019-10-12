using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

public partial class menu : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

    protected DataTable tab1;
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)

    {
       //lmat.Text = Request.QueryString["mat"];
        //Session["mat1"] = lmat.Text;
        if(!IsPostBack)
        {

       
        lmat.Text = Session["matLien"].ToString();
        //Response.Write("matricule"+lmat.Text);
       // string ch= lmat.Text;
       // Response.Write("mat"+ch);
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open();
        SqlCommand cmd = new SqlCommand();
        string req = "SELECT * FROM utilisateur where mat ='" + lmat.Text + "'";
        cmd.CommandText = req;
        cmd.CommandType = CommandType.Text;
        cmd.Connection = con;
        SqlDataReader r1 = cmd.ExecuteReader();
        if(r1.Read())
        {
            
            lnom.Text = r1["nom"].ToString();
            lpren.Text = r1["prenom"].ToString();
            lemail.Text = r1["email"].ToString();
            lville.Text = r1["ville"].ToString();
            lcode.Text = r1["codeP"].ToString();
            ltel.Text = r1["tel"].ToString();
            lmp.Text = r1["mp"].ToString();

                tnom.Text = r1["nom"].ToString();
                tpren.Text = r1["prenom"].ToString();
                temail.Text = r1["email"].ToString();
                DropDownList1.Items.FindByText(r1["ville"].ToString()).Selected = true;
                //tville.Text = r1["ville"].ToString();
                tpost.Text = r1["codeP"].ToString();
                ttel.Text = r1["tel"].ToString();
                tmp.Text = r1["mp"].ToString();
               // DropDownList1.SelectedIndex.Text == r1["ville"].ToString(); ;


            }

    

        //tnom.Text = lnom.Text;
        //tpren.Text = lpren.Text;
        //tville.Text = lville.Text;
        //tpost.Text = lcode.Text;
        //ttel.Text = ltel.Text;
        //tmp.Text = lmp.Text;
        //temail.Text = lemail.Text;

        con.Close();

        }
    }
 

    protected void btnMod_Click(object sender, EventArgs e)
    {
        ////lnom.Text = "islem";
        //Response.Redirect("espacePartMod.aspx");
        //Response.Write("islem");
    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        con.ConnectionString= ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con.Open();

        //string gg = tnom.Text;
        //Response.Write("nom1" + gg + "<br>");
        // Response.Write("bb" + Panel1.Controls[3].ToString() + "<br>");

        SqlCommand cmd = new SqlCommand();
        string gg = tnom.Text;
        
        // Response.Write("bb" + Panel1.Controls[3].ToString() + "<br>");
        string req = "update  utilisateur set nom='" + tnom.Text +
            "' , prenom='" + tpren.Text +
             "' , email='" + temail.Text +
            "' , ville='" + DropDownList1.SelectedItem+
             "' , codeP='" + tpost.Text +
              "' , tel='" + ttel.Text +
               "' , mp='" + tmp.Text +

            "' where mat ='" +lmat.Text+"'";
        if(tnom.Text=="" || tpren.Text=="" || temail.Text=="" || tpost.Text=="" || tmp.Text=="" )
        {
            lmod.Text = "tous les champs sont obligatoires..!!";
            lmod.Visible = true;
            tnom.Text = lnom.Text;
            tpren.Text = lpren.Text;
            //tville.Text = lville.Text;
            tpost.Text = lcode.Text;
            ttel.Text = ltel.Text;
            tmp.Text = lmp.Text;
            temail.Text = lemail.Text;

        }
        else
        {
            if (!Page.IsValid)
            {
                ValidationSummary1.Visible = true;
                lmod.Visible = false;
                tnom.Text = lnom.Text;
                tpren.Text = lpren.Text;
                //tville.Text = lville.Text;
                tpost.Text = lcode.Text;
                ttel.Text = ltel.Text;
                tmp.Text = lmp.Text;
                temail.Text = lemail.Text;

            }

            else
            {



                lmod.Visible = false;
            
                cmd.CommandText = req;
                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                SqlDataReader r1 = cmd.ExecuteReader();
                con.Close();
                Response.Redirect("espacePart.aspx");
               
            }

        }



    }




    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write(DropDownList1.SelectedItem);
        
    }
}