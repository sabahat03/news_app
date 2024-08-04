
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/article_model.dart';

class ApiService {
  final String endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=e86874a68ffc423295c639c0072d87f1";

  Future<List<Article>> getArticle() async {
    final response = await http.get(Uri.parse(endPointUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      List<dynamic> body = json['articles'];
      List<Article> articles =
      body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw Exception("Can't get the Articles");
    }
  }
}
