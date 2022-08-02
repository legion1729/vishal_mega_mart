import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../model/category_section.dart';

class CategoryProvider {
  Client client = Client();
  Future<CategorySection> getcategory() async {
    const url =
        "https://www.vishalmegamart.com/s/-/dw/data/v20_10/catalogs/vmm-storefront-catalog/categories/root";
    const token =
        "eyJ0eXAiOiJKV1QiLCJraWQiOiJEMWhPUDdEODN4TjBqZWlqaTI3WWFvZFRjL0E9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXVkaXRUcmFja2luZ0lkIjoiZjBkY2U0OTEtNjBjMi00NDlhLWJkMWYtZDYyMTVjNDIwN2ZjLTQwMTA1Mzk4NCIsInN1Ym5hbWUiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJpc3MiOiJodHRwczovL2FjY291bnQuZGVtYW5kd2FyZS5jb206NDQzL2R3c3NvL29hdXRoMiIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6IlJOb2hhSS1NZUJmUmRoR3M3VzBEdWZzSkJRMCIsImF1ZCI6Ijk4MDRmOGI0LWU0MzEtNDk1MC1hNzQzLWJkYTIyZjA5ZWJiOCIsIm5iZiI6MTY1OTQ2ODU0MywiZ3JhbnRfdHlwZSI6ImNsaWVudF9jcmVkZW50aWFscyIsInNjb3BlIjpbIm1haWwiXSwiYXV0aF90aW1lIjoxNjU5NDY4NTQzLCJyZWFsbSI6Ii8iLCJleHAiOjE2NTk0NzAzNDMsImlhdCI6MTY1OTQ2ODU0MywiZXhwaXJlc19pbiI6MTgwMCwianRpIjoiRmVTYllsTzRvNkN3ZnhZOHpZRnFzb092RkdnIiwiY2xpZW50X2lkIjoiOTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4In0.EXuUCkzoZpP8ZlgdTJfBJ99OKI0wfd10QTpqsIBIlt14wJVD5UzGcic9Z4jKSLuFyuKGZPBHESPc-Zi75lJs9B3pOM75cGfXz97ib6-OgVhWScMC0cxPMXu0X7ezTrWJfem6AocrRjLiODDrg69xkSQG95H9s_Z-LZISobES5NZEMRtY3uviQLG9DqQkikpDgcNLN864fcYOPUFzKyfTp_WnvVTY8ZPVc_481rJbOkom9lMy41YSsIgb2ppWMH6DzzeLrH2Hkc58vXBFs1JXy9cp1dJ-kwksf7TSuSuiePiN0lcfxwollK0uRhjfDAZT3KSXuuTGG1oajJtxsP4Kjw";
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
