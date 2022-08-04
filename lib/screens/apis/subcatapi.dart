import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:vishal_mega_mart_app/screens/model/subcatmodel.dart';
import '../model/category_section.dart';

class SUbcatProvider {
  Client client = Client();
  Future<SubCatModel> getsubcat() async {
    const url =
        "https://www.vishalmegamart.com/s/-/dw/data/v20_10/catalogs/vmm-storefront-catalog/categories/1003";
    const token ="eyJ0eXAiOiJKV1QiLCJraWQiOiJEMWhPUDdEODN4TjBqZWlqaTI3WWFvZFRjL0E9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXVkaXRUcmFja2luZ0lkIjoiZjBkY2U0OTEtNjBjMi00NDlhLWJkMWYtZDYyMTVjNDIwN2ZjLTQyOTk4MDA3NyIsInN1Ym5hbWUiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJpc3MiOiJodHRwczovL2FjY291bnQuZGVtYW5kd2FyZS5jb206NDQzL2R3c3NvL29hdXRoMiIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6IjNEMDRFYm5vdVJGZndqS2FMMmwzNFl2MmRTVSIsImF1ZCI6Ijk4MDRmOGI0LWU0MzEtNDk1MC1hNzQzLWJkYTIyZjA5ZWJiOCIsIm5iZiI6MTY1OTYwMzI5NiwiZ3JhbnRfdHlwZSI6ImNsaWVudF9jcmVkZW50aWFscyIsInNjb3BlIjpbIm1haWwiXSwiYXV0aF90aW1lIjoxNjU5NjAzMjk2LCJyZWFsbSI6Ii8iLCJleHAiOjE2NTk2MDUwOTYsImlhdCI6MTY1OTYwMzI5NiwiZXhwaXJlc19pbiI6MTgwMCwianRpIjoiV01mQWNuYmlJTGJKRUt4RmgxcGdDQVJic3dnIiwiY2xpZW50X2lkIjoiOTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4In0.OAo1QFttN2-Wpx5u5zrNIeVDLRq6la6flnyElGa9dwOW9LsmQ2Te2WeJSreNpOJCQzv4XGfg9CiDPZCOq9X3L8Fxf7uRaiLHeIljxSaEwBKma639oK-qfhl_9m6XDKwau16xyDq_iQBwpI5AvC_YxtM7Melr-2Z9dNZHdT_TqEzEOQaxOPWxCqKGgzfQ7hofl0Fdk_ewOPBgXHK-w5BrSBhIb7l0OqwwUzwljS6fHlXDvTP2uURBXvgVyWcdUN0NPe3Q7AquaX6Re31Md93uXb3G5Wk2U1zDRxoJK_VzATITHx6z8PNvcJIx5jj-dY_bbzSvYIi4gCqAJUBqSpxdsQ";
    var response = await client.get(Uri.parse(url), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    final jsondata = jsonDecode(response.body.toString());
    // print("=========${jsondata.length}");

    //return CategorySection.fromJson(jsonDecode(response.body));
    print("=========++++====${response.body.toString()}+++++++++++++++++++");
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return SubCatModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('=====Failed to load post');
    }
  }
}
