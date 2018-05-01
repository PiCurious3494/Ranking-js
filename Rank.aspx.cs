using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Collections;

public partial class Rank : System.Web.UI.Page
{
            public static string validCheck; 
            public static string text; 
            public static int index;
            public static string items;
            public static string arrayIndex;
            public static List<int> shuffledList = new List<int>();//randomize the images 
            public static List<string> itemsArray = new List<string>() //declare array with index 0 as "" to avoid any zero index confusion 
     
        {    
            "",
            "Appearance of lot and showroom",
            "Cares about the community",
            "Family/friend recommendation",
            "Location",
            "Low pressure environment",
            "Low prices",
            "Make and model variety",
            "Quality of service department"

        }; //this array is for multipunch list - need to add the empty string at the start to account for arrays starting at zero



    protected void Page_Load(object sender, EventArgs e)
    {

        List<int> numberList = new List<int>(); //creates a sting of numbers to randomize later
        Random rnd = new Random();

        for (int i = 1; i < itemsArray.Count; i++)
        {
            numberList.Add(i);
         
        }
        shuffledList = numberList.OrderBy(i => rnd.Next()).ToList();
        q18a.Text = string.Join(", ", shuffledList);
        text = string.Join(", ", shuffledList); 
      
    }

    protected void q18a_TextChanged(object sender, EventArgs e)
    {
       
    }
    protected void valid_TextChanged(object sender, EventArgs e)
    {
        validCheck = valid.Text; 
    }
    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("dashboard.aspx"); 
    }
}
