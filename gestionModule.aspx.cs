using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class gestionModule : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();

    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        Label3.Text = Request.QueryString["idForm"];
        Label3.Visible = false;
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            SqlCommand cmd = new SqlCommand("SELECT nomForm FROM formation1 where idForm = '" + Label3.Text + "'", sqlCon);

            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string nom = dr["nomForm"].ToString();
                Label1.Text = nom;
                // Response.Write("num module" + nom);

            }
            sqlCon.Close();
        }

        //Label1.Text = Session["numMod"].ToString();
        //Label2.Text = Session["nomformLabel"].ToString();



        if (!IsPostBack)
        {
            PopulateGridview();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("gestForm.aspx");
    }

    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from module1 where idForm='" + Label3.Text + "'", sqlCon);

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
            gr1.Rows[0].Cells[0].Text = "aucun Module dans cette form formation ...!";
            gr1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;



        }
    }

    protected void gr1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Addnew"))
        {
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                string query = "insert into module1 (nomMod,idForm) values (@nomMod," + Label3.Text + ") ";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@nomMod", (gr1.FooterRow.FindControl("TxtnomModFooter") as TextBox).Text.Trim());

                //lnomFormV.Text = (gr1.FooterRow.FindControl("TxtnomModFooter") as TextBox).Text.Trim();
                //string req = "select count(nomForm) as nbr from formation1 where nomForm='" + lnomFormV.Text+"'";
                if ((gr1.FooterRow.FindControl("TxtnomModFooter") as TextBox).Text.Trim() == "")
                {

                    lMsgVide.Text = "Remplir le champs..!";
                    ValidationSummary1.HeaderText = "";
                    ValidationSummary1.Visible = false;
                    lblSucessMessage.Text = "";
                    lblSucessMessage.Visible = false;
                    lblErrorMessage.Text = "";

                    LformExiste.Text = "";
                    // Response.Write((gr1.FooterRow.FindControl("TxtnomFormFooter") as TextBox).Text.Trim());

                }
                else
                {


                    if (!Page.IsValid)
                    {

                        lMsgVide.Text = "";
                        ValidationSummary1.Visible = true;
                        lblSucessMessage.Text = "";
                        LformExiste.Text = "";
                        lblSucessMessage.Visible = false;
                        lblErrorMessage.Text = "";

                    }


                    else

                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("select count(nomMod) as nbr from module1 where nomMod='" + lnomFormV.Text + "'", con))
                        {
                            cmd.CommandType = CommandType.Text;

                            SqlDataReader dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                string nbr = dr["nbr"].ToString();
                                if (int.Parse(nbr) >= 1)
                                {
                                    Response.Write("module existe");
                                    LformExiste.Text = ("module Existe déja");
                                    lblSucessMessage.Visible = false;
                                    lblSucessMessage.Text = "";
                                    lblErrorMessage.Text = "";
                                    ValidationSummary1.Visible = false;
                                    lMsgVide.Text = "";

                                }
                                else
                                {
                                    sqlCmd.ExecuteNonQuery();
                                    PopulateGridview();
                                    lblSucessMessage.Text = "Module ajouté avec succés";
                                    lblErrorMessage.Text = "";
                                    lMsgVide.Text = "";
                                    LformExiste.Text = "";
                                }



                            }
                        }

                        con.Close();

                    }
                }


            }






            //sqlCmd.ExecuteNonQuery();
            //    PopulateGridview();
            //    lblSucessMessage.Text = "neauveau ligne ajoutée";
            //    lblErrorMessage.Text = "";

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

    //public string valide(TextBox a)
    //{
    //    string ch="";
    //    if (a.Text == "")
    //    {
    //        ch = "non vide";
    //    }
    //    else
    //    {
    //        ch = "mrigil";
    //    }
    //        return ch;

    //}

    protected void gr1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string s = "";
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "update module1 set nomMod=@nomMod where idMod=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@nomMod", (gr1.Rows[e.RowIndex].FindControl("TxtnomMod") as TextBox).Text.Trim());

            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            //s= valide(gr1.Rows[e.RowIndex].FindControl("TxtnomMod") as TextBox);
            //Response.Write(s);
            // lnomFormV.Text = (gr1.Rows[e.RowIndex].FindControl("TxtnomMod") as TextBox).Text.Trim();
            //sqlCmd.ExecuteNonQuery();
            //gr1.EditIndex = -1;
            //PopulateGridview();
            //lblSucessMessage.Text = "neauveau ligne modifié";
            //lblErrorMessage.Text = "";


            if ((gr1.Rows[e.RowIndex].FindControl("TxtnomMod") as TextBox).Text.Trim() == "")
            {

                lMsgVide.Text = "Remplir Tous les champs SVP...!";
                ValidationSummary2.HeaderText = "";
                ValidationSummary2.Visible = false;
                ValidationSummary1.Visible = false;
                lblSucessMessage.Text = "";
                lblErrorMessage.Text = "";



                LformExiste.Text = "";
                // Response.Write((gr1.FooterRow.FindControl("TxtnomFormFooter") as TextBox).Text.Trim());

            }
            else
            {


                if (!Page.IsValid)
                {

                    lMsgVide.Text = "";
                    lMsgVide.Visible = false;
                    ValidationSummary2.Visible = true;
                    ValidationSummary1.Visible = false;
                    lblSucessMessage.Text = "";

                }


                else

                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select count(nomMod) as nbr from module1 where nomMod='" + lnomFormV.Text + "'", con))
                    {
                        cmd.CommandType = CommandType.Text;

                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            string nbr = dr["nbr"].ToString();
                            Response.Write("nbr" + nbr);
                            if (int.Parse(nbr) >= 1)
                            {
                                // Response.Write("formation existe");
                                LformExiste.Text = ("Module Existe déja");
                                lblSucessMessage.Text = "";
                                lblErrorMessage.Text = "";
                                ValidationSummary2.Visible = false;
                                ValidationSummary1.Visible = false;
                                lMsgVide.Text = "";

                            }
                            else
                            {
                                sqlCmd.ExecuteNonQuery();
                                gr1.EditIndex = -1;

                                PopulateGridview();
                                lblSucessMessage.Text = "Module modifié avec succés";
                                lblErrorMessage.Text = "";
                                lMsgVide.Text = "";
                                LformExiste.Text = "";
                            }



                        }
                    }

                    con.Close();

                }
            }
        }
    }

    protected void gr1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "delete from module1 where idMod=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();


            PopulateGridview();
            lblSucessMessage.Text = "Module supprimé avec succées";
            lblErrorMessage.Text = "";
        }
    }
}