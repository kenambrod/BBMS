using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Addbank : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Detailview1_ItemInsert(object sender,
        DetailsViewInsertedEventArgs e)
    {
        if (e.AffectedRows == 1)

        { Response.Redirect("~/Banks.aspx"); }
    }
    protected void DetailView1_ItemCommand(object sender,
        DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("~/Banks.aspx");
        }
    }
}