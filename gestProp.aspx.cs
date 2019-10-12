using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class gestProp : System.Web.UI.Page
{
    string ConnectionString = ConfigurationManager.ConnectionStrings["n1"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Label3.Text = Request.QueryString["idQ"];

        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            SqlCommand cmd = new SqlCommand("select distinct e.type from exercice e , question q where e.idEx=q.idEx and idq='" + Label3.Text + "'", sqlCon);

            cmd.CommandType = CommandType.Text;

            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                string typ = dr["type"].ToString();
                lprop.Text = typ;
                // Response.Write("type du prop" + nom);

            }
            sqlCon.Close();
        }
        if(lprop.Text=="cochez")
            {
            if (!IsPostBack)
            {
                gr1.Visible = true;
                PopulateGridview();
            }
        }
        else
        {
            if (!IsPostBack)
            {
                gr2.Visible = true;
                PopulateGridview2();
            }
        }

      
       
    }

    void PopulateGridview()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from proposition p , question q , exercice e where e.idEx = q.idEx and q.idQ = p.idQ and q.idQ = '" + Label3.Text + "' and e.type ='cochez'", sqlCon);

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
            gr1.Rows[0].Cells[0].Text = "aucune Proposition ...!";
            gr1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;



        }
    }

    void PopulateGridview2()
    {
        DataTable dtbl = new DataTable();
        using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {

            sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("select * from proposition p , question q , exercice e where e.idEx = q.idEx and q.idQ = p.idQ and q.idQ = '" + Label3.Text + "' and e.type ='remplir'", sqlCon);


            sqlDa.Fill(dtbl);

        }
        if (dtbl.Rows.Count > 0)
        {
            gr2.DataSource = dtbl;
            gr2.DataBind();
        }
        else
        {
            dtbl.Rows.Add(dtbl.NewRow());
            gr2.DataSource = dtbl;
            gr2.DataBind();
            gr2.Rows[0].Cells.Clear();
            gr2.Rows[0].Cells.Add(new TableCell());
            gr2.Rows[0].Cells[0].ColumnSpan = dtbl.Columns.Count;
            gr2.Rows[0].Cells[0].Text = "aucune Proposition ...!";
            gr2.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;



        }
    }

    protected void gr1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName.Equals("Addnew"))
        {
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                string query = "insert into proposition (cont,note,idQ) values (@cont,@note," + Label3.Text + ") ";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                sqlCmd.Parameters.AddWithValue("@cont", (gr1.FooterRow.FindControl("TxtcontFooter") as TextBox).Text.Trim());
                //sqlCmd.Parameters.AddWithValue("@rep1", (gr1.FooterRow.FindControl("Txtrep1Footer") as TextBox).Text.Trim());
                //sqlCmd.Parameters.AddWithValue("@rep2", (gr1.FooterRow.FindControl("Txtrep2Footer") as TextBox).Text.Trim());
                //sqlCmd.Parameters.AddWithValue("@rep3", (gr1.FooterRow.FindControl("Txtrep3Footer") as TextBox).Text.Trim());
               // sqlCmd.Parameters.AddWithValue("@typeP", (gr1.FooterRow.FindControl("TxttypePFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@note", (gr1.FooterRow.FindControl("TextnoteFooter") as TextBox).Text.Trim());
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
            string query = "update proposition set cont=@cont,note=@note where idP=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            sqlCmd.Parameters.AddWithValue("@cont", (gr1.Rows[e.RowIndex].FindControl("Txtcont") as TextBox).Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@rep1", (gr1.Rows[e.RowIndex].FindControl("Txtrep1") as TextBox).Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@rep2", (gr1.Rows[e.RowIndex].FindControl("Txtrep2") as TextBox).Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@rep3", (gr1.Rows[e.RowIndex].FindControl("Txtrep3") as TextBox).Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@typeP", (gr1.Rows[e.RowIndex].FindControl("TxttypeP") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@note", (gr1.Rows[e.RowIndex].FindControl("Textnote") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr1.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();
            gr1.EditIndex = -1;
            PopulateGridview();
            lblSucessMessage.Text = "neauveau ligne modifié";
            lblErrorMessage.Text = "";

        }
    }

    protected void gr2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.Equals("Addnew"))
        {
            using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
            {
                sqlCon.Open();
                string query = "insert into proposition (rep1,rep2,rep3,note,idQ) values (@rep1,@rep2,@rep3,@note," + Label3.Text + ") ";
                SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
                //sqlCmd.Parameters.AddWithValue("@cont", (gr1.FooterRow.FindControl("TxtcontFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@rep1", (gr2.FooterRow.FindControl("Txtrep1Footer") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@rep2", (gr2.FooterRow.FindControl("Txtrep2Footer") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@rep3", (gr2.FooterRow.FindControl("Txtrep3Footer") as TextBox).Text.Trim());
                // sqlCmd.Parameters.AddWithValue("@typeP", (gr1.FooterRow.FindControl("TxttypePFooter") as TextBox).Text.Trim());
                sqlCmd.Parameters.AddWithValue("@note", (gr2.FooterRow.FindControl("TextnoteFooter") as TextBox).Text.Trim());
                sqlCmd.ExecuteNonQuery();
                PopulateGridview2();
                lblSucessMessage.Text = "neauveau ligne ajoutée";
                lblErrorMessage.Text = "";

            }

        }
    }

    protected void gr2_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gr2.EditIndex = e.NewEditIndex;
        PopulateGridview2();
    }

    protected void gr2_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gr2.EditIndex = -1;
        PopulateGridview2();
    }

    protected void gr2_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

         using (SqlConnection sqlCon = new SqlConnection(ConnectionString))
        {
            sqlCon.Open();
            string query = "update proposition set rep1=@rep1,rep2=@rep2,rep3=@rep3,note=@note where idP=@id";
            SqlCommand sqlCmd = new SqlCommand(query, sqlCon);
            //sqlCmd.Parameters.AddWithValue("@cont", (gr1.Rows[e.RowIndex].FindControl("Txtcont") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@rep1", (gr2.Rows[e.RowIndex].FindControl("Txtrep1") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@rep2", (gr2.Rows[e.RowIndex].FindControl("Txtrep2") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@rep3", (gr2.Rows[e.RowIndex].FindControl("Txtrep3") as TextBox).Text.Trim());
            //sqlCmd.Parameters.AddWithValue("@typeP", (gr1.Rows[e.RowIndex].FindControl("TxttypeP") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@note", (gr2.Rows[e.RowIndex].FindControl("Textnote") as TextBox).Text.Trim());
            sqlCmd.Parameters.AddWithValue("@id", Convert.ToInt32(gr2.DataKeys[e.RowIndex].Value.ToString()));
            sqlCmd.ExecuteNonQuery();
            gr2.EditIndex = -1;
            PopulateGridview2();
            lblSucessMessage.Text = "neauveau ligne modifié";
            lblErrorMessage.Text = "";

        }
    }
}