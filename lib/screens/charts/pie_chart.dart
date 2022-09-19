import 'package:pie_chart/pie_chart.dart';
import 'package:demo2/models/chart.dart';


addExpenseFuction(int n, val ){
    for (int i = 0; i < n; i++)
                  {
                    if (val.data["ans"][i]["category"] == "Health")
                      {
                        healthAmount =
                            val.data["ans"][i]["amount"] + healthAmount; 
                      }
                    if (val.data["ans"][i]["category"] == "Luxury")
                      {
                        luxuryAmount =
                            val.data["ans"][i]["amount"] + luxuryAmount; 
                      }
                    if (val.data["ans"][i]["category"] == "Rent")
                      {
                        rentAmount = val.data["ans"][i]["amount"] + rentAmount;
                      }
                    if (val.data["ans"][i]["category"] == "Food")
                      {
                        foodAmount = val.data["ans"][i]["amount"] + foodAmount;
                      }
                  }
}