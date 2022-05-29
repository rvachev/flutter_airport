import 'package:airport/features/news/models/news.dart';
import 'package:airport/features/news/repositories/news_repository.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final newsService =
    RM.inject(() => NewsService(), autoDisposeWhenNotUsed: false);

class NewsService {
  List<News> _data = [];

  List<News> get data => _data;

  Future<void> getNews() async {
    newsService.setToIsWaiting();
    try {
      if (_data.isNotEmpty) {
        newsService.setToHasData(_data);
        return;
      }

      _data = await NewsRepository.getNews();

      newsService.setToHasData(_data);
    } catch (e) {
      newsService.setToHasError(e);
      rethrow;
    }
  }
}
