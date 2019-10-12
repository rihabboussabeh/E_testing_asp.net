using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;

public partial class gestionL : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label1.Text = Session["l1"].ToString();
        //Label2.Text = Session["l2"].ToString();
        Label3.Text = Request.QueryString["idMod"];
        Label3.Visible = false;
        lidL.Visible = false;

        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            SqlCommand cmd = new SqlCommand("SELECT nomMod FROM module1 where idMod = '" + Label3.Text + "'", sqlCon);

            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nom = dr["nomMod"].ToString();
                Label1.Text = nom;
                // Response.Write("num module" + nom);

            }
            sqlCon.Close();
        }


        if (!IsPostBack)
        {
            PopulateGridview();
        }

    }

    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from leçon where idMod='" + Label3.Text + "'", sqlCon);

            sqlDa.Fill(dtbl);

        }
        if (dtbl.Rows.Count > 0)
        {
            gr1.DataSource = dtbl;
            gr1.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            gr1.DataSource = dtbl;
            gr1.DataBind();
            gr1.Rows[0].Cells.Clear();
            gr1.Rows[0].Cells.Add(new TableCell());
            gr1.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            gr1.Rows[0].Cells[0].Text = "aucun Module ...!";
            gr1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;



        }

        //using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        //{
        //    sqlCon.Open();
        //    SqlCommand cmd = new SqlCommand("SELECT nomL FROM leçon ", sqlCon);

        //    cmd.CommandType = CommandType.Text;

        //    SqlDataReader dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        string nom = dr["nomL"].ToString();
        //        //Label1.Text = nom;
        //         Response.Write("num module" + nom);

        //    }
        //    sqlCon.Close();
        //}
    }

    protected void gr1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName.Equals("Addnew"))
        {

            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                string query = "insert into leçon (nomL,contL,idMod) values (@nomL,@contL," + Label3.Text + ") ";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@nomL", (gr1.FooterRow.FindControl("TxtnomLFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@contL", (gr1.FooterRow.FindControl("TxtcontLFooter") as TextBox).Text.Trim());

                if ((gr1.FooterRow.FindControl("TxtnomLFooter") as TextBox).Text.Trim() == "")
                {

                    lmsgV.Text = "Remplir Tous les champs SVP...!";

                    ValidationSummary1.HeaderText = "";
                    ValidationSummary1.Visible = false;
                    ValidationSummary2.Visible = false;
                    lblSucessMessage.Text = "";
                    lblErrorMessage.Text = "";


                }
                else
                {
                    if (!Page.IsValid)
                    {


                        lblSucessMessage.Text = "";
                        lmsgV.Text = "";
                        ValidationSummary1.Visible = true;
                        ValidationSummary2.Visible = false;


                    }
                    else
                    {



                        sqlCmd.ExecuteNonQuery();
                        PopulateGridview();
                        lblSucessMessage.Text = "neauveau ligne ajoutée";
                        lblErrorMessage.Text = "";



                    }
                }


            }

        }

        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            SqlCommand cmd = new SqlCommand("select max(idL) as maxi from leçon ", sqlCon);

            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string max = dr["maxi"].ToString();
                //Label1.Text = nom;
                //Response.Write("num module" + max);
                lidL.Text = max;

            }
            sqlCon.Close();
            sqlCon.Open();
            string query1 = "insert into exercice (numEx,texte,type,idL) values ('1','cochez la bonne réponse','cochez' ," + lidL.Text + ") ";
            SqlCommand sqlCmd1 = new SqlCommand(query1, sqlCon);
            sqlCmd1.ExecuteNonQuery();
            sqlCon.Close();
            sqlCon.Open();
            string query2 = "insert into exercice (numEx,texte,type,idL) values ('2','remplir les phrases suivantes','remplir' ," + lidL.Text + ") ";
            SqlCommand sqlCmd2 = new SqlCommand(query2, sqlCon);

            sqlCmd2.ExecuteNonQuery();
            sqlCon.Close();
        }










    }

    protected void gr1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gr1.EditIndex = e.NewEditIndex;
        PopulateGridview();
    }

    protected void gr1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gr1.EditIndex = -1;
        PopulateGridview();
    }

    protected void gr1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "update leçon set nomL=@nomL,contL=@contL where idL=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@nomL", (gr1.Rows[e.RowIndex].FindControl("TxtnomL") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@contL", (gr1.Rows[e.RowIndex].FindControl("TxtcontL") as TextBox).Text.Trim());

            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            Response.Write(gr1.DataKeys[e.RowIndex].Value.ToString());
            if ((gr1.Rows[e.RowIndex].FindControl("TxtnomL") as TextBox).Text.Trim() == "")
            {

                lmsgV.Text = "Remplir Tous les champs SVP...!";
                ValidationSummary2.HeaderText = "";
                ValidationSummary2.Visible = false;
                ValidationSummary1.Visible = false;
                lblSucessMessage.Text = "";
                lblErrorMessage.Text = "";


                // Response.Write((gr1.FooterRow.FindControl("TxtnomFormFooter") as TextBox).Text.Trim());

            }
            else
            {


                if (!Page.IsValid)
                {

                    lmsgV.Text = "";

                    ValidationSummary2.Visible = true;
                    ValidationSummary1.Visible = false;

                }


                else

                {


                    sqlCmd.ExecuteNonQuery();
                    gr1.EditIndex = -1;

                    PopulateGridview();
                    lblSucessMessage.Text = "neauveau ligne modifié";
                    lblErrorMessage.Text = "";
                    lmsgV.Text = "";
                    lidL.Text = "";


                }



            }
        }



    }





    protected void gr1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "delete from leçon where idL=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();


            PopulateGridview();
            lblSucessMessage.Text = "Leçon supprimé avec succées";
            lblErrorMessage.Text = "";
        }
    }
}
