//define functions and global variables here...
var siteloc = "http://localhost/RestaurantMenu";
var scriptloc = "/scripts/"


function fetchRestaurantMenu(RestaurantMenu_id)
{
  $.ajax({
      url: siteloc + scriptloc + "getRestaurantMenu.py",
      data: {RestaurantMenu_id:RestaurantMenu_id},
      dataType: 'json',
      success: function (res) {
                  console.log(res);
                  if(res[0][0] != "None")
                  {
					  table = '<table border="1">';
					  for (i = 0; i < res.length; i++)
					  {
						  row = res[i];
						  table += "<tr>";
						  for (j = 0; j < row.length; j++)
						  {
							  table += "<td>" + row[j] + "</td>";
						  }
						  table += "</tr>";
					  }
					  table += "</table>";
					  $("#target").html(table); 
				  } // end if
              }
    });
}


