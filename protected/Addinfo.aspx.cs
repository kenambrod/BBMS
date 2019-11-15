using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Addinfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Detailview1_ItemInsert(object sender,
        DetailsViewInsertedEventArgs e)
    {
        if (e.AffectedRows == 1)

        { Response.Redirect("~/Info.aspx"); }
    }
    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {

    }
}