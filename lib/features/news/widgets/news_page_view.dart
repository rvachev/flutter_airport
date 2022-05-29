import 'package:airport/common/utils/date_utils.dart';
import 'package:airport/common/utils/get_image_path.dart';
import 'package:airport/common/widgets/flip_card.dart';
import 'package:airport/features/news/models/news.dart';
import 'package:airport/features/news/widgets/counter_page_switcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsPageView extends StatefulWidget {
  final List<News> news;

  const NewsPageView({Key? key, required this.news}) : super(key: key);

  @override
  State<NewsPageView> createState() => _NewsPageViewState();
}

class _NewsPageViewState extends State<NewsPageView> {
  final _pageController = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.news.length,
            itemBuilder: (context, index) {
              final news = widget.news[index];
              return Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: FlipCard(
                        frontSide: CachedNetworkImage(
                            height: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: getImagePath(news.image!.url!)),
                        rearSide: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: double.infinity,
                          color: Colors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news.title,
                                  style: textTheme.headline6,
                                ),
                                Text(
                                  news.description,
                                  style: textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(16.0),
                        height: double.infinity,
                        color: Colors.white,
                        child: Text(
                          formatDate(news.date),
                          style: textTheme.headline4,
                        ),
                      ))
                ],
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CounterPageSwitcher(
              count: widget.news.length,
              currentPage: currentPage,
              onNextButtonPressed: (page) => setState(() {
                    currentPage = page;
                    changePage(page);
                  }),
              onPreviousButtonPressed: (page) => setState(() {
                    currentPage = page;
                    changePage(page);
                  })),
        ),
      ],
    );
  }

  void changePage(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  String formatDate(DateTime date) {
    return formatDateFullMonth(date).replaceAll(' ', '\n');
  }

  TextTheme get textTheme => Theme.of(context).textTheme;
}
