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
public partial class gestForm : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
        // Label1.Text = Session["num"].ToString();
        if (!IsPostBack)
        {
            PopulateGridview();
        }
        //ValidationSummary1.ForeColor= System.Drawing.Color.Red;
        
       
    }

     void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from formation1 ", sqlCon);

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
            gr1.Rows[0].Cells[0].Text = "Aucune Formation";
            gr1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;



        }
    }

    protected void gr1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        //string p = "^(([A-za-z]+[\s]";

       
        if (e.CommandName.Equals("Addnew"))
        {
          

            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                string query = "insert into formation1 (nomForm,descForm) values (@nomForm,@descForm) ";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@nomForm", (gr1.FooterRow.FindControl("TxtnomFormFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@descForm", (gr1.FooterRow.FindControl("TxtdescFormFooter") as TextBox).Text.Trim());
                lnomFormV.Text = (gr1.FooterRow.FindControl("TxtnomFormFooter") as TextBox).Text.Trim();
                //string req = "select count(nomForm) as nbr from formation1 where nomForm='" + lnomFormV.Text+"'";
                if ((gr1.FooterRow.FindControl("TxtnomFormFooter") as TextBox).Text.Trim() == "" || (gr1.FooterRow.FindControl("TxtdescFormFooter") as TextBox).Text.Trim() == "")
                {

                    lMsgVide.Text = "Remplir Tous les champs SVP...!";
                    ValidationSummary1.HeaderText = "";
                    ValidationSummary1.Visible = false;
                    ValidationSummary2.Visible = false;
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
                        ValidationSummary1.Visible = true;
                        lblSucessMessage.Text = "";
                        LformExiste.Text = "";

                    }
                 

                    else

                    {
                        con.Open();
                        using (SqlCommand cmd = new SqlCommand("select count(nomForm) as nbr from formation1 where nomForm='" + lnomFormV.Text + "'", con))
                        {
                            cmd.CommandType = CommandType.Text;

                            SqlDataReader dr = cmd.ExecuteReader();
                            while (dr.Read())
                            {
                                string nbr = dr["nbr"].ToString();
                                if (int.Parse(nbr) >= 1)
                                {
                                    Response.Write("formation existe");
                                    LformExiste.Text = ("formation Existe déja");
                                    lblSucessMessage.Text = "";
                                    lblErrorMessage.Text = "";
                                    ValidationSummary1.Visible = false;
                                    lMsgVide.Text = "";

                                }
                                else
                                {
                                    sqlCmd.ExecuteNonQuery();
                                    PopulateGridview();
                                    lblSucessMessage.Text = "Formation ajouteé avec succées";
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
        string updNomForm;
        updNomForm = (gr1.Rows[e.RowIndex].FindControl("TxtnomForm") as TextBox).Text.Trim();
       // Response.Write("index" +updNomForm);
        lupdNomForm.Text = updNomForm;
        
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "update formation1 set nomForm=@nomForm,descForm=@descForm where idForm=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@nomForm", (gr1.Rows[e.RowIndex].FindControl("TxtnomForm") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@descForm", (gr1.Rows[e.RowIndex].FindControl("TxtdescForm") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            lnomFormV.Text = (gr1.Rows[e.RowIndex].FindControl("TxtnomForm") as TextBox).Text.Trim();
            if ((gr1.Rows[e.RowIndex].FindControl("TxtnomForm") as TextBox).Text.Trim() == "" || (gr1.Rows[e.RowIndex].FindControl("TxtdescForm") as TextBox).Text.Trim() == "")
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

                }


                else

                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("select count(nomForm) as nbr from formation1 where nomForm='" + lnomFormV.Text + "'", con))
                    {
                        cmd.CommandType = CommandType.Text;

                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            //string nbr = dr["nbr"].ToString();
                            //Response.Write("nbr"+nbr);
                            //if (int.Parse(nbr) >= 1)
                            //{
                            //   // Response.Write("formation existe");
                            //    LformExiste.Text = ("formation Existe déja");
                            //    lblSucessMessage.Text = "";
                            //    lblErrorMessage.Text = "";
                            //    ValidationSummary2.Visible = false;
                            //    ValidationSummary1.Visible = false;
                            //    lMsgVide.Text = "";

                            //}
                            //else
                            {
                                sqlCmd.ExecuteNonQuery();
                                gr1.EditIndex = -1;
                               
                                PopulateGridview();
                                lblSucessMessage.Text = "Formation modifieé avec succés";
                                lblErrorMessage.Text = "";
                                lMsgVide.Text = "";
                                LformExiste.Text = "";
                                Response.Write((gr1.DataKeys[e.RowIndex].Value.ToString()));

                            }



                        }
                    }
                    Response.Write((gr1.DataKeys[e.RowIndex].Value.ToString()));
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
            string query = "delete from formation1 where idForm=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();
           

            PopulateGridview();
            lblSucessMessage.Text = "Formation supprimée avec succées";
            lblErrorMessage.Text = "";
        }
    }

    protected void gr1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType== DataControlRowType.DataRow)
        //{
        //    //ImageButton l = (ImageButton)e.Row.FindControl("link1");
        //    l.Attributes.Add("onclick","return confirm('vous les vous')");
        //}
    }
}

   

    
