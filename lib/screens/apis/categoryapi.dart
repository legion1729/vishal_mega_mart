import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/category_section.dart';

class CategoryProvider {
  Client client = Client();
  Future<CategorySection> getcategory() async {
    const url =
        "https://www.vishalmegamart.com/s/-/dw/data/v20_10/catalogs/vmm-storefront-catalog/categories/root";
    const token ="eyJ0eXAiOiJKV1QiLCJraWQiOiJEMWhPUDdEODN4TjBqZWlqaTI3WWFvZFRjL0E9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXVkaXRUcmFja2luZ0lkIjoiZjBkY2U0OTEtNjBjMi00NDlhLWJkMWYtZDYyMTVjNDIwN2ZjLTQxMjIyNjU0NCIsInN1Ym5hbWUiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJpc3MiOiJodHRwczovL2FjY291bnQuZGVtYW5kd2FyZS5jb206NDQzL2R3c3NvL29hdXRoMiIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6IlRjUVZKNUNKUVFSc0R3YlJtdlNzWUsxQndfNCIsImF1ZCI6Ijk4MDRmOGI0LWU0MzEtNDk1MC1hNzQzLWJkYTIyZjA5ZWJiOCIsIm5iZiI6MTY1OTUyMzUyMSwiZ3JhbnRfdHlwZSI6ImNsaWVudF9jcmVkZW50aWFscyIsInNjb3BlIjpbIm1haWwiXSwiYXV0aF90aW1lIjoxNjU5NTIzNTIxLCJyZWFsbSI6Ii8iLCJleHAiOjE2NTk1MjUzMjEsImlhdCI6MTY1OTUyMzUyMSwiZXhwaXJlc19pbiI6MTgwMCwianRpIjoiSS1YV2hxdG1nU3p2MGRwM0ZOMHJWem5QQjB3IiwiY2xpZW50X2lkIjoiOTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4In0.cxULVU5MjWc7ULcC15cSL2bD0gD3D2BJqEc4IwLlHIkn6y8mQJ7H-pIQRURAkRxu8IZnkAYxCMyGxt0ldhDrdPomlChgSrzUCmoEFNMs5d78rK6VqbKI4h3Ly2TpuC-9VrFmSMIVjvc4tpLaIgHRqls5stmlNfGZ2l5IoeOcm_Aypom9ktN4I_C-RFb8zOcz3AtMpWDRytLcjTDIC0ze4a-iO6GBkjTzcrksaQM0fBqrjygtXBUOyIdc3Yh1x38KPqtzmuKb3sunza1CdAdEr7GMBml2ur4oTnI79tTYKP2EI2MFlguAt2wBqtsmLNjTM6wnQNcSgzzQbzJaqsu4PA";
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
      return CategorySection.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('=====Failed to load post');
    }
  }
}
