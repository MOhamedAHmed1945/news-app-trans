import 'dart:convert';
import 'package:flutter_application_news/Apis/api_constatnts.dart';
import 'package:flutter_application_news/Models/news_response.dart';
import 'package:flutter_application_news/Models/sourse_response.dart';
import 'package:http/http.dart' as http;

//https://newsapi.org/v2/top-headlines/sources?apiKey=537ad82052c14f69b6cc8a638ee6c341

// class ApiManager {
//   static Future<SourseResponse> getSources() async {
//     Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.sources, {
//       'apiKey': '537ad82052c14f69b6cc8a638ee6c341',
//     });
//     try {
//       var response = await http.get(url);
//       var responseBody = response.body; //String
//       var json = jsonDecode(responseBody);
//       return SourseResponse.fromJson(json);
//     } catch (e) {
//       throw e;
//       //print(e);
//     }
//   }

//   static Future<NewsResponse> getNewsBySourcesId(String sourcesId) async {
//     Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.news, {
//       'apiKey': '537ad82052c14f69b6cc8a638ee6c341',
//       'sources': sourcesId,
//     });
//     var response = await http.get(url);
//       var responseBody = response.body;
//       var json = jsonDecode(responseBody);
//       return NewsResponse.fromJson(json);
//     // try {
//     //   var response = await http.get(url);
//     //   var responseBody = response.body;
//     //   var json = jsonDecode(responseBody);
//     //   return NewsResponse.fromJson(json);
//     // } catch (e) {
//     //   print(e);
//     //  // throw e;
//     //   //print(e);
//     // }
//   }
// }

class ApiManager {
  static Future<SourseResponse> getSources() async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.sources, {
      'apiKey': ApiConstatnts.apiKey,
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var responseBody = response.body;
        var json = jsonDecode(responseBody);
        return SourseResponse.fromJson(json);
      } else {
        print('Error: ${response.statusCode}');
        print('Response body: ${response.body}');
        throw Exception('Failed to fetch sources');
      }
    } catch (e) {
      print('Exception occurred: $e');
      throw e;
    }
  }

  // static Future<NewsResponse> getNewsBySourcesId(String sourcesId) async {
  //   Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsSource,
  //       {'apiKey':  ApiConstatnts.baseUrl, 'sources': sourcesId,});
  //  try {
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       var responseBody = response.body;
  //       var json = jsonDecode(responseBody);
  //       return NewsResponse.fromJson(json);
  //     } else {
  //       print('Error: ${response.statusCode}');
  //       print('Response body: ${response.body}');
  //       throw Exception('Failed to fetch sources');
  //     }
  //   } catch (e) {
  //     print('Exception occurred: $e');
  //     throw e;
  //   }
  // }

  static Future<NewsResponse> getNewsBySourcesId({
    required String sourcesId,
    // required String page,
  }) async {
    Uri url = Uri.https(ApiConstatnts.baseUrl, ApiConstatnts.newsSource, {
      // "page": page,
      // "pageSize": "5",
      "apiKey": ApiConstatnts.apiKey,
      "sources": sourcesId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }
}
