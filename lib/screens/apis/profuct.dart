import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vishal_mega_mart_app/screens/constant.dart';
import 'package:vishal_mega_mart_app/screens/home.dart';
import 'package:vishal_mega_mart_app/screens/model/product.dart';

class ProductProvider {
  //Client client = Client();
  Future<ProductModel> product() async {
    // ignore: avoid_print
    print("======= API CALLING  =========",);
    const token = tokens.TOKEN;
    
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJraWQiOiJEMWhPUDdEODN4TjBqZWlqaTI3WWFvZFRjL0E9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXVkaXRUcmFja2luZ0lkIjoiYzI3YmE4Y2QtNjVlYy00N2ZhLWIxODQtNDkwZjYwOWI2N2RkLTMzMDY0ODkiLCJzdWJuYW1lIjoiOTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4IiwiaXNzIjoiaHR0cHM6Ly9hY2NvdW50LmRlbWFuZHdhcmUuY29tOjQ0My9kd3Nzby9vYXV0aDIiLCJ0b2tlbk5hbWUiOiJhY2Nlc3NfdG9rZW4iLCJ0b2tlbl90eXBlIjoiQmVhcmVyIiwiYXV0aEdyYW50SWQiOiI0OEE5UlZ4dnB0d2N2TU5aQk9kbEN3M040eVUiLCJhdWQiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJuYmYiOjE2NjAxMjc5MDYsImdyYW50X3R5cGUiOiJjbGllbnRfY3JlZGVudGlhbHMiLCJzY29wZSI6WyJtYWlsIl0sImF1dGhfdGltZSI6MTY2MDEyNzkwNiwicmVhbG0iOiIvIiwiZXhwIjoxNjYwMTI5NzA2LCJpYXQiOjE2NjAxMjc5MDYsImV4cGlyZXNfaW4iOjE4MDAsImp0aSI6IlctM2JFUFdsdHVET2p3ekRoR2dBVEp1bFpLTSIsImNsaWVudF9pZCI6Ijk4MDRmOGI0LWU0MzEtNDk1MC1hNzQzLWJkYTIyZjA5ZWJiOCJ9.E5lvd1ikAZll0iTC0-tI7gGBBDL_MP24gQtF1m28Fuzv6YXz0ri7HLg3kR8QeZocJGEuJ9kiKhrkzXusVA7Xyu9wfKAk3YXObpYx3yTAIvIT5IA-PC0f5TLpBORtUIqjm6jKSC-MUR6DWUXtupKe3EYgE6LW1yhH8zWzkNnSKtgBYyy-E1fY6LmmfhSqT3tzytzaxkSR0AXrqY-4Kkjcu5Q1TS28ywsDeN0Ysw8v4UwSAVmyHBt82T4Re-IUfrq2kSHas9bcpQf1rHRklpsmy7kqItDazx49BZIP7AS9Hxo5wdiN7wE4OAqn4-444y6T7_mZ3RziskIyL8V6HpNmng',
          
          
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.vishalmegamart.com/s/-/dw/data/v20_10/product_search'));
    //var elemnt = Searchtext();
    var value = Searchtext.searchelemnt;
    print("========= VALUE======= ${value}+++++++++++");
    request.body = json.encode({
      "query": {
        "text_query": {
          "fields": ["name"],
          "search_phrase": value
        }
      },
      "expand": ["prices"],
      "select": "(**)"
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final res = await response.stream.bytesToString();
 print("=======Product====== ${res}");
    if (response.statusCode == 200) {
      print("=======Product====== ${res}");
      // print("============= ${await response.stream.bytesToString()}");
    } else {
      print("======= Failed to load posts =========");
    }

    return ProductModel.fromJson(jsonDecode(res));

//     const url =
//         "https://www.vishalmegamart.com/s/-/dw/data/v20_10/product_search";
//     const token =
//         "eyJ0eXAiOiJKV1QiLCJraWQiOiJEMWhPUDdEODN4TjBqZWlqaTI3WWFvZFRjL0E9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJjdHMiOiJPQVVUSDJfU1RBVEVMRVNTX0dSQU5UIiwiYXVkaXRUcmFja2luZ0lkIjoiZjBkY2U0OTEtNjBjMi00NDlhLWJkMWYtZDYyMTVjNDIwN2ZjLTQwOTE3MDIxNSIsInN1Ym5hbWUiOiI5ODA0ZjhiNC1lNDMxLTQ5NTAtYTc0My1iZGEyMmYwOWViYjgiLCJpc3MiOiJodHRwczovL2FjY291bnQuZGVtYW5kd2FyZS5jb206NDQzL2R3c3NvL29hdXRoMiIsInRva2VuTmFtZSI6ImFjY2Vzc190b2tlbiIsInRva2VuX3R5cGUiOiJCZWFyZXIiLCJhdXRoR3JhbnRJZCI6IjdVTEpQVFNGbUZLbVpSQ0xuR2RfczMtWER3WSIsImF1ZCI6Ijk4MDRmOGI0LWU0MzEtNDk1MC1hNzQzLWJkYTIyZjA5ZWJiOCIsIm5iZiI6MTY1OTUwOTQ5MCwiZ3JhbnRfdHlwZSI6ImNsaWVudF9jcmVkZW50aWFscyIsInNjb3BlIjpbIm1haWwiXSwiYXV0aF90aW1lIjoxNjU5NTA5NDkwLCJyZWFsbSI6Ii8iLCJleHAiOjE2NTk1MTEyOTAsImlhdCI6MTY1OTUwOTQ5MCwiZXhwaXJlc19pbiI6MTgwMCwianRpIjoiUWVRMGNTWG52OHpJZ2ZIaHY4LUYxOFF2eHpBIiwiY2xpZW50X2lkIjoiOTgwNGY4YjQtZTQzMS00OTUwLWE3NDMtYmRhMjJmMDllYmI4In0.ffWR2QMSpW34yobnU_8_U3-tdVFJvqgDrzg6Q32ab8FPRRM5NyFqCQbyw2nwfX8K8D_mbwlU3fbSSSsK-aRagfhw6fYwxLi0cCMxsJISSR-XaZzE9w8wp5mRsBPReoUC-BW5C2H7tXIGuKAUOn9bUF3_bd99e3u4TEAJj6-U6CXfRq_lbSdshvs3aneIPf6v-dtte5ehpRBKrUlmj_1T0kxsaNbJItaxrDECOFEfaJwhBnvKeAKHjkTOufd5cB9R69j8bJSi1RNYYGYnjZ05FuujXYsXusTf4alppqOd2WWUsnrJRTHJKRkQNu8I8w9gZk4ELnmFZ28LKXkP-LXvVw";
//     final queryParams = {
//       'fields': 'name',
//       'search_phrase': 'jeans',
//       'expand': 'prices',
//       'select': '(**)'
//     };

//     final uri = Uri.parse(url).replace(queryParameters: {
//       'fields': 'name',
//       'search_phrase': 'jeans',
//       'expand': 'prices',
//       'select': '(**)'
//     });

// // String urll = Uri.parse("https://www.vishalmegamart.com/s/-/dw/data/v20_10");
// // Uri urls = Uri.http(
// //     urll,
// //     '/product_search',
// //     {
// //       'mapData': jsonEncode(queryParams),
// //     },
// // );
// //   Uri url = Uri.http(
// //     'domain.com',
// //     '/endpoint',
// //     {
// //       'mapData': jsonEncode(queryParams),
// //     },
// // );
// //   {
// //       'mapData': jsonEncode(queryParams),
// //     },

//     var response = await client.post(uri, headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     });
//     final jsondata = jsonDecode(response.body.toString());
//     //return CategorySection.fromJson(jsonDecode(response.body));
//       print(
//         "\n\n=========PRODUCT====${response.statusCode}+++++++++++++++++++\n\n");
//     print(
//         "\n\n=========PRODUCT====${response.body.toString()}+++++++++++++++++++\n\n");
//     if (response.statusCode == 200) {
//       // If the call to the server was successful, parse the JSON
//       return ProductModel.fromJson(json.decode(response.body));
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('=====Failed to load post');
//     }
  }
}
