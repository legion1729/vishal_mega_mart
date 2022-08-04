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
    const token ="eyJ0eXAiOiJKV1QiLCJraWQiOiJEMWhPUDdEODN4TjBqZWlqaTI3WWFvZFRjL0E9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXVkaXRUcmFja2luZ0lkIjoiZjBkY2U0OTEtNjBjMi00NDlhLWJkMWYtZDYyMTVjNDIwN2ZjLTQyODcyOTQ0MSIsInN1Ym5hbWUiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJpc3MiOiJodHRwczovL2FjY291bnQuZGVtYW5kd2FyZS5jb206NDQzL2R3c3NvL29hdXRoMiIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6ImRmc2RYUlBXQkRFOW1URDN6VVVOUHRVcTM2byIsImF1ZCI6Ijk4MDRmOGI0LWU0MzEtNDk1MC1hNzQzLWJkYTIyZjA5ZWJiOCIsIm5iZiI6MTY1OTU5Nzk3MiwiZ3JhbnRfdHlwZSI6ImNsaWVudF9jcmVkZW50aWFscyIsInNjb3BlIjpbIm1haWwiXSwiYXV0aF90aW1lIjoxNjU5NTk3OTcyLCJyZWFsbSI6Ii8iLCJleHAiOjE2NTk1OTk3NzIsImlhdCI6MTY1OTU5Nzk3MiwiZXhwaXJlc19pbiI6MTgwMCwianRpIjoiWnBKUEZSc25Ka2NTYUxXQndzaVRPa0VQS3BFIiwiY2xpZW50X2lkIjoiOTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4In0.Gchmn7XHUvTQPQvbEqEcIeugmmKa6xUacrGbrjF14KpkY_w3xx-wu24sqn8GQ40d-pe2WZatL63tjlTT4tzvV5buIb7SN_0ddWYMKRjRpSz2Z9SGODA9n5V8ei0j7lAff6tCcAAHgwkUX0rwkBm3voOCw_H5nNWDKKF_pseqceBYy4MBP76CKJenwvAy5ZwsMVSiRFbJtp1XJinvuZzlj-BET7wbeLHSzlcEfE1Ncopwq6HwFc4-UtgNqWkbPhIzp2uups6R-D40N5xHlSzbY3sIuuMDMSqstt7I32iYo6448vIoGfid60np-CXo4zwbilk0ln0FiFSPC-wmi38sww";
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
