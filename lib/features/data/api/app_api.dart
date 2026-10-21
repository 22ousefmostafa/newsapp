import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/core/network/api_result.dart';
import 'package:news_app/features/data/model/news_model.dart';

abstract class AppApi {
  static Future<ApiResult<NewsModel>> getNews() async {
    try{
  var response = await http.get(
      Uri.parse(
        "https://newsapi.org/v2/everything?q=bitcoin&apiKey=d75307d7d672447a9a74b0f2f1437b24"
        ),
        );
  var responseBody = response.body;
  var jsonResponse = jsonDecode(responseBody);
  return Success(NewsModel.fromJson(jsonResponse));
    } catch (e) {
      return Error(e.toString());
    }
  }
}
