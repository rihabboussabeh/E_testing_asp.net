using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


public partial class gestMod1 : System.Web.UI.Page
{
    public string a;
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;

    }


    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //   // string myForm = "";
    //    float[] tab = new float[50];
    //    float note=0;

    //    for(int i=0;i<CheckBoxList1.Items.Count;i++)
    //    {
    //        if (CheckBoxList1.Items[i].Selected)
    //        {
    //            //myForm = myForm + " " + CheckBoxList1.Items[i].Value;
    //           // tab[i]= int.Parse(CheckBoxList1.Items[i].Value);

    //            //Response.Write("nbr"+tab[i]);
    //            note= note + float.Parse(CheckBoxList1.Items[i].Value);


    //        }
    //        //if (CheckBoxList1.Items[i].Selected)
    //        //{
    //        //    Response.Write("selected");
    //        //}
    //        //else
    //        //{
    //        //    Response.Write(" non selected");
    //        //}
    //        //Label1.Text = myForm;

    //        //Response.Write(note);
    //        Label2.Text = note.ToString();
    //    }
    //}

    protected void Button1_Click(object sender, EventArgs e)
    {
        // string myForm = "";
        float[] tab = new float[50];
        float[] tab2 = new float[50];
        float note=0,som = 0;
       int  j = 0;
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            
            if (CheckBoxList1.Items[i].Selected)
            {
                tab[i] = int.Parse(CheckBoxList1.Items[i].Value);

                Response.Write("id"+tab[i]);
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT note FROM proposition where idP = '" + tab[i] + "'", con))
                {
                    cmd.CommandType = CommandType.Text;

                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                       string nom = dr["note"].ToString();
                        tab2[j] = float.Parse(nom);
                        note = note + tab2[j];
                        //Response.Write("note" + nom);
                        //Response.Write("num tab" + tab2[j] + "<br>");
                    }
                }

                con.Close();
                j++;
               
                //note = note + float.Parse(CheckBoxList1.Items[i].Value);
                
            }

            //Response.Write(note);
            Label2.Text = note.ToString();

        }
       
        
    }
}