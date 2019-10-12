using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class gestModuleG : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Label3.Text = Request.QueryString["idForm"];
        Label1.Text = Session["numMod1"].ToString();
        Label2.Text = Session["nomformLabel1"].ToString();
        Label1.Visible = false;





        if (!IsPostBack)
        {
            PopulateGridview();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("gestMod1.aspx");
    }

    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from module1 where idForm='" + Label1.Text + "'", sqlCon);

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
    }

    protected void gr1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Addnew"))
        {
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                string query = "insert into module1 (nomMod,idForm) values (@nomMod," + Label1.Text + ") ";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@nomMod", (gr1.FooterRow.FindControl("TxtnomModFooter") as TextBox).Text.Trim());


                sqlCmd.ExecuteNonQuery();
                PopulateGridview();
                lblSucessMessage.Text = "neauveau ligne ajoutée";
                lblErrorMessage.Text = "";

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
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "update module1 set nomMod=@nomMod where idMod=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@nomMod", (gr1.Rows[e.RowIndex].FindControl("TxtnomMod") as TextBox).Text.Trim());


            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();
            gr1.EditIndex = -1;
            PopulateGridview();
            lblSucessMessage.Text = "neauveau ligne modifié";
            lblErrorMessage.Text = "";

        }
    }
}