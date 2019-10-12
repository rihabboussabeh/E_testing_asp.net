using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Text;

public partial class gestPadmin : System.Web.UI.Page
{
   // string connectionString="Data Source = DESKTOP - 09C0C2K;Initial Catalog = pfe; Integrated Security = True; User ID = conn; Password=123";
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PopulateGridview();
        }
    }

    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon= new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from utilisateur where type='part'", sqlCon);
            
            sqlDa.Fill(dtbl);
        }
        if (dtbl.Rows.Count>0)
        {
            grPart.DataSource = dtbl;
            grPart.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            grPart.DataSource = dtbl;
            grPart.DataBind();
            grPart.Rows[0].Cells.Clear();
            grPart.Rows[0].Cells.Add(new TableCell());
            grPart.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            grPart.Rows[0].Cells[0].Text = "no data found";
            grPart.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;



        }
       
    }

    protected void grPart_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Addnew"))
        {
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
                string query = "insert into utilisateur (mat,nom,prenom,email,ville,codeP,tel,mp,type) values (@mat,@nom,@prenom,@email,@ville,@codeP,@tel,@mp,'part') ";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@mat", (grPart.FooterRow.FindControl("TxtmatFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@nom", (grPart.FooterRow.FindControl("TxtnomFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@prenom", (grPart.FooterRow.FindControl("TxtprenFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@email", (grPart.FooterRow.FindControl("TxtemailFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@ville", (grPart.FooterRow.FindControl("TxtvilleFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@codeP", (grPart.FooterRow.FindControl("TxtcodePFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@tel", (grPart.FooterRow.FindControl("TxttelFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@mp", (grPart.FooterRow.FindControl("TxtmpFooter") as TextBox).Text.Trim());
                lnomFormV.Text = (grPart.FooterRow.FindControl("TxtmatFooter") as TextBox).Text.Trim();
                //sqlCmd.Parameters.AddWithValue("@type", (grPart.FooterRow.FindControl("TxttypeFooter") as TextBox).Text.Trim());
                //sqlCmd.Parameters.AddWithValue("@idU", (grPart.FooterRow.FindControl("TxtidUFooter") as TextBox).Text.Trim());

                if ((grPart.FooterRow.FindControl("TxtmatFooter") as TextBox).Text.Trim() == "" || (grPart.FooterRow.FindControl("TxtnomFooter") as TextBox).Text.Trim() == "" || (grPart.FooterRow.FindControl("TxtprenFooter") as TextBox).Text.Trim() == "" || (grPart.FooterRow.FindControl("TxtemailFooter") as TextBox).Text.Trim() == "" || (grPart.FooterRow.FindControl("TxtvilleFooter") as TextBox).Text.Trim() == "" || (grPart.FooterRow.FindControl("TxtcodePFooter") as TextBox).Text.Trim() == "" || (grPart.FooterRow.FindControl("TxttelFooter") as TextBox).Text.Trim() == "" || (grPart.FooterRow.FindControl("TxtmpFooter") as TextBox).Text.Trim() == "")
                {
                    lblControl.Text = "Tous les champs sont obligatoires!!";
                }
                else
                {
                    if (!Page.IsValid)
                    {

                        // lMsgVide.Text = "";
                        ValidationSummary1.Visible = true;
                        lblSucessMessage.Text = "";
                        //LformExiste.Text = "";

                    }
                    else
                    {


                        if (!Page.IsValid)
                        {

                            // lMsgVide.Text = "";
                            ValidationSummary1.Visible = true;
                            lblSucessMessage.Text = "";
                            LformExiste.Text = "";

                        }


                        else

                        {
                            con.Open();
                            using (SqlCommand cmd = new SqlCommand("select count(mat) as nbr from utilisateur where mat='" + lnomFormV.Text + "'", con))
                            {
                                cmd.CommandType = CommandType.Text;

                                SqlDataReader dr = cmd.ExecuteReader();
                                while (dr.Read())
                                {
                                    string nbr = dr["nbr"].ToString();
                                    if (int.Parse(nbr) >= 1)
                                    {
                                        Response.Write("formation existe");
                                        LformExiste.Text = ("Participant Existe déja");
                                        lblSucessMessage.Text = "";
                                        lblErrorMessage.Text = "";
                                        ValidationSummary1.Visible = false;
                                        // lMsgVide.Text = "";

                                    }
                                    else
                                    {
                                        sqlCmd.ExecuteNonQuery();
                                        PopulateGridview();
                                        lblSucessMessage.Text = "Part ajouteé avec succées";
                                        lblErrorMessage.Text = "";
                                        // lMsgVide.Text = "";
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

        }
    //private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
    //{
    //    if (!char.IsLetter(e.KeyChar))
    //        e.Handled = true;
    //}
    protected void grPart_RowEdditing(object sender, GridViewEditEventArgs e)
    {
        grPart.EditIndex = e.NewEditIndex;
        PopulateGridview();
    }

    protected void grPart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grPart.EditIndex = -1;
        PopulateGridview();
    }

    

  

    protected void grPart_RowDeleting1(object sender, GridViewUpdateEventArgs e)
    {
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "update utilisateur set mat=@mat,nom=@nom,prenom=@prenom,email=@email,ville=@ville,codeP=@codeP,tel=@tel,mp=@mp where mat=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@mat", (grPart.Rows[e.RowIndex].FindControl("Txtmat") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@nom", (grPart.Rows[e.RowIndex].FindControl("Txtnom") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@prenom", (grPart.Rows[e.RowIndex].FindControl("Txtpren") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@email", (grPart.Rows[e.RowIndex].FindControl("Txtemail") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@ville", (grPart.Rows[e.RowIndex].FindControl("Txtville") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@codeP", (grPart.Rows[e.RowIndex].FindControl("TxtcodeP") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@tel", (grPart.Rows[e.RowIndex].FindControl("Txttel") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@mp", (grPart.Rows[e.RowIndex].FindControl("Txtmp") as TextBox).Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@type", (grPart.Rows[e.RowIndex].FindControl("Txttype") as TextBox).Text.Trim());
           // sqlCmd.Parameters.AddWithValue("@idU", (grPart.Rows[e.RowIndex].FindControl("TxtidU") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(grPart.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();
            grPart.EditIndex = -1;
            PopulateGridview();
            lblSucessMessage.Text = "neauveau ligne modifié";
            lblErrorMessage.Text = "";

        }
    }






   
}