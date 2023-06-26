import 'dart:convert';

import 'package:myapp/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=66856410b80047628b0038dc15170082';
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    if (data['status'] == 'ok') {
      data['articles'].forEach((element) {
        ArticleModel articleModel = ArticleModel(
          author: element['author'],
          title: element['title'],
          description: element['description'],
          url: element['url'],
          urlToImage: element['urlToImage'],
          content: element['content'],
        );
        news.add(articleModel);
      });
    }
  }
}
