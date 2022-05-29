import 'package:airport/features/home/widgets/airport_information.dart';
import 'package:airport/features/home/widgets/header_widget.dart';
import 'package:airport/features/news/services/news_service.dart';
import 'package:airport/features/news/widgets/news_page_view.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;

  @override
  void initState() {
    newsService.state.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        HeaderWidget(screenHeight: screenHeight),
        const AirportInformation(),
        const SizedBox(
          height: 24,
        ),
        OnBuilder<NewsService>.all(
            listenTo: newsService,
            onWaiting: () => _loader,
            //TODO: Move to localization file
            onError: (err, errFunc) => const Text('Что-то пошло не так'),
            onData: (state) {
              return NewsPageView(news: state.data);
            })
      ],
    );
  }

  Widget get _loader {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
