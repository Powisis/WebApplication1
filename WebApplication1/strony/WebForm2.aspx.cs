using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.strony
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        static string connectionString = @"Data Source=(LocalDB)\.;Initial Catalog=rembud;Integrated Security=True";
        SqlConnection connection = new SqlConnection(connectionString);

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlCommand sqlCommand = new SqlCommand("insert into nagsprzedaz(idklienta) values (@idklienta); select @@IDENTITY as 'nr'");
            sqlCommand.Parameters.AddWithValue("@idklienta", DropDownListKlient.SelectedValue);
            sqlCommand.Connection = connection;
            connection.Open();
            var nrfaktury = sqlCommand.ExecuteScalar();
            LabelNrFaktury.Text = nrfaktury.ToString();
            // Session["nrfaktury"] = nrfaktury;
            connection.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
            SqlCommand sqlCommand = new SqlCommand("insert into pozsprzedaz(nrfaktury, idproduktu, ilosc) values(@nrfaktury, @idproduktu, @ilosc)");
            SqlConnection connection = new SqlConnection(connectionString);
            sqlCommand.Parameters.AddWithValue("@nrfaktury", LabelNrFaktury.Text);
            sqlCommand.Parameters.AddWithValue("@idproduktu", DropDownListTowar.SelectedValue);
            sqlCommand.Parameters.AddWithValue("@ilosc", TextBoxIlosc.Text);
            sqlCommand.Connection = connection;
            connection.Open();
            sqlCommand.ExecuteNonQuery();
            connection.Close();

            
            GridViewLinies.DataBind();
            DetailsViewSuma.DataBind();


        }

        protected void SqlDataSource3_Deleted(object sender, SqlDataSourceStatusEventArgs e)
        {
            DetailsViewSuma.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlCommand zapytanie = new SqlCommand("update nagsprzedaz set zaplacono = 'tak' where nrfaktury = @nrfaktury");
            zapytanie.Parameters.AddWithValue("@nrfaktury", LabelNrFaktury.Text);
            zapytanie.Connection = connection;
            connection.Open();
            int liczbaWierszy = zapytanie.ExecuteNonQuery();
            connection.Close();
            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlCommand zapytanie = new SqlCommand("update nagsprzedaz set zaplacono = 'nie' where nrfaktury = @nrfaktury");
            zapytanie.Parameters.AddWithValue("@nrfaktury", LabelNrFaktury.Text);
            zapytanie.Connection = connection;
            connection.Open();
            int liczbaWierszy = zapytanie.ExecuteNonQuery();
            connection.Close();
            GridView1.DataBind();
        }
    }
}