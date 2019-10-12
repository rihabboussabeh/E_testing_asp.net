using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class drt : System.Web.UI.Page
{
    int k = 0, a=0;
    string[] tabChload = new string[20];
    int[] tabCompt = new int[20];
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["n1"].ToString());
    SqlConnection con1 = new SqlConnection(ConfigurationManager.ConnectionStrings["n1"].ToString());
    SqlConnection con3 = new SqlConnection(ConfigurationManager.ConnectionStrings["n1"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        con1.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        con1.Open();

        //con3.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        //con3.Open();
        //using (SqlCommand cmd = new SqlCommand("SELECT nomL FROM leçon where idL = '" + ltest.Text + "'", con))
        //{
        //    cmd.CommandType = CommandType.Text;

        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        string nom = dr["nomL"].ToString();
        //        lnomTest.Text = nom;

        //    }
        //}
        //con.Close();
        //con.Open();

        using (SqlCommand cmd = new SqlCommand("SELECT idEx,numEx,texte FROM exercice where idL = '" + ltest.Text + "'", con))
        {
            cmd.CommandType = CommandType.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            int i = 0;
            
            while (dr.Read())
            {
                i++;
                string nom = dr["texte"].ToString();
                string id = dr["idEx"].ToString();
                // Response.Write(id+" "+nom + "<br>");
                Label lNomEx = new Label();
                lNomEx.ID = "idEx" + i.ToString();

                lNomEx.Text = id;
                // LoadQCMalea(loadAlea(" select * from Question where idEx='" + lNomEx.Text + "' ", ""), dr["numEx"].ToString()); lnomTest.Visible = true;
                //if(dr["numEx"].ToString()=="1")
                //{
                //    LoadQCMalea(loadAlea(" select * from Question where idEx='" + lNomEx.Text + "' ", ""));
                //}
                //else
                //{
                //    LoadQCMalea1(loadAlea(" select * from Question where idEx='" + lNomEx.Text + "' ", ""));
                //}

                Response.Write("<br><br>");
                // LoadQCMalea(loadAlea(" select * from Question where idEx='"+lNomEx.Text+"' ", ""));
                //Panel1.Controls.Add(lNomEx);
                //ButtonsTreeP1.Controls.Add(lNomEx);

                //Response.Write("<br> isl" + lNomEx.Text + "<br>");
            }
        }
        con.Close();

         SqlCommand cmd2 = new SqlCommand("SELECT idQ,nomQ FROM question where idEx = '19'", con1);
        cmd2.CommandType = CommandType.Text;
        SqlDataReader dr1 = cmd2.ExecuteReader();
        int j = 0;
        con3.Open();
        while (dr1.Read())
        {
            j++;
            string nomQ = dr1["nomQ"].ToString();
            string idQ = dr1["idQ"].ToString();

            // Response.Write(nomQ + "<br>");
            Label lnomQ = new Label();
            lnomQ.ID = "nomQ" + j.ToString();
            lnomQ.Text = nomQ + "<br>";
            Panel1.Controls.Add(lnomQ);


            
            SqlCommand cmd3 = new SqlCommand("SELECT * FROM proposition where idQ = '" + idQ + "'", con3);
            cmd2.CommandType = CommandType.Text;
            SqlDataReader dr3 = cmd3.ExecuteReader();
            while (dr3.Read())
            {
                k++;
                a++;

                string nomP = dr3["cont"].ToString();
                string noteP = dr3["note"].ToString();
                string idP = dr3["idP"].ToString();

                // Response.Write(nomQ + "<br>");
                Label lidP = new Label();
                lidP.ID = "idP" + k.ToString();
                lidP.Text = idP;
                Panel1.Controls.Add(lidP);
                CheckBox ch = new CheckBox();
                ch.ID = k.ToString();
                Panel1.Controls.Add(ch);
                Label lnomP = new Label();
                lnomP.ID = "nomP" + k.ToString();
                lnomP.Text = nomP + "<br>";
                Panel1.Controls.Add(lnomP);
               
                //TextBox tnomP = new TextBox();
                //tnomP.ID = "tnomP" + k.ToString();
                //Panel1.Controls.Add(tnomP);
                // tab[k] = tnomP.Text;
                //string a = tnomP.Text;
                //Response.Write(a);
                tabChload[k] = idP;
                tabCompt[k] =  k;
                Response.Write(ch.ID);
                //Panel1.Controls.Add(ch);
            }
            dr3.Close();
        }
        dr1.Close();


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<br>tableau load");
        for (int i = 1; i < tabChload.Length; i++)
        {
            Response.Write("," + tabChload[i]);
        }
        //Response.Write("<br>");
        //for (int i = 1; i < tabCompt.Length; i++)
        //{
        //    Response.Write("," + tabCompt[i]);
        //}
        int nbr = 0;
        string[] tab1 = new string[10];
        string[] tab2 = new string[20];
        for (int j = 1; j <9; j++)
        { 
       
            CheckBox chk = (CheckBox)FindControl(j.ToString());
            if (chk.Checked == true)
            {
                Label1.Text = Label1.Text + j.ToString();
                //Label1.Text = j.ToString();
                nbr = nbr + int.Parse(j.ToString());
                //tab1[j] = j.ToString();
                //Response.Write(j);
                Response.Write(tabChload[j]);
                tab2[j] = tabChload[j];
            }

        }
        //Response.Write("<br> tableau coché");
        //for (int i = 1; i < tab1.Length; i++)
        //{
        //    Response.Write("a" + tab1[i]);
        //}

        //// ntala3 indice;
        Response.Write("<br>");
        Response.Write("<br> idP coché");
        for (int i = 1; i < tab2.Length; i++)
        {
            Response.Write("a" + tab2[i]);
        }
        //Response.Write(tab1.Length);
        
        //for (int i1 = 1; i1 < tab1.Length; i1++)
        //{
        //    if(tab1[i1]=="5")
        //    {
        //        Response.Write("moujoud"+i1.ToString());
        //        break;
        //    }
            //else
            //{
            //    Response.Write("non");
            //}
                //for (int k = 1; k < tabChload.Length; k++)
                //{
                //if (tab1[i] == tabChload[k])
                //{
                //Response.Write("indice" + k);
                //    break;
                //}
            //}
        }


        //Response.Write(" nbr" + nbr);
   // }
    // dr.Close();
}
//con1.Close();
    

//con1.Close();
    

