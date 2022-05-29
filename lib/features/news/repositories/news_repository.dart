import 'package:airport/common/network/rest_client_service.dart';
import 'package:airport/features/news/models/news.dart';

class NewsRepository {
  NewsRepository._();

  static Future<List<News>> getNews() async {
    final response = await baseRestClientService.state.dio
        .get('/news', queryParameters: {'_sort': 'date:desc'});
    List<News> news = [];
    for (var item in response.data) {
      news.add(News.fromJson(item));
    }
    return news;
  }
}
