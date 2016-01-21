<script>
function getNextFriday() 
{
	  dayOfWeek = 6;
	  date = new Date();
	  date.setDate(date.getDate() + (dayOfWeek + 6 - date.getDay()) % 7);
	  return date;
}

function loadEmployees()
{
   //
   //   var restStationsHttp;
   //
   //      if (window.XMLHttpRequest)
   //         {
   //                // code for IE7+, Firefox, Chrome, Opera, Safari
   //                       restStationsHttp=new XMLHttpRequest();
   //                              restStationsHttp.overrideMimeType("application/json");
   //                                 }
   //                                    else
   //                                       {
   //                                              // code for IE6, IE5
   //                                                     restStationsHttp=new ActiveXObject("Microsoft.XMLHTTP");
   //                                                        }
   //
   //                                                           var jsonRows = '';
   //
   //                                                              restStationsHttp.onreadystatechange=function()
   //                                                                 {
   //                                                                       if (restStationsHttp.readyState==4 && restStationsHttp.status==200)
   //                                                                             {
   //                                                                                       var jsonData = JSON.parse(restStationsHttp.responseText);
   //                                                                                                 var tbody    = '';
   //
   //                                                                                                           for (var i = 0; i < jsonData.length; i++)
   //                                                                                                                     {
   //                                                                                                                                   tbody += "<tr>"+
   //                                                                                                                                                 "<td>"+jsonData[i].firstName+"</td>"+
   //                                                                                                                                                               "<td>"+jsonData[i].lastName+"</td>"+
   //                                                                                                                                                                             "</tr>";
   //                                                                                                                                                                                       }
   //
   //                                                                                                                                                                                                 $('#empRows').html(tbody);
   //                                                                                                                                                                                                        }
   //                                                                                                                                                                                                            }
   //
   //                                                                                                                                                                                                                restStationsHttp.open("GET","/rest/EP/employees",true);
   //                                                                                                                                                                                                                    restStationsHttp.send();
   //                                                                                                                                                                                                                     }
   //
   //                                                                                                                                                                                                                     </script>
