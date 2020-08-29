import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mel/features/feed.dart' show FeedCarouselItem;
import 'package:http/http.dart' as http;

class FeedCarousel extends StatefulWidget {
  final int pageIndex;
  final setPageIndex;

  const FeedCarousel({Key key, this.pageIndex, this.setPageIndex})
      : super(key: key);

  @override
  _FeedCarouselState createState() => _FeedCarouselState();
}

class _FeedCarouselState extends State<FeedCarousel> {
  double viewPortFraction = 0.6;

  PageController pageController;
  int currentPage = 0;
  double page = 0.0;
  List<String> carouselListItems = new List();

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    fetchFive();

    pageController.addListener(() {
      if (currentPage >= carouselListItems.length - 3) {
        fetchFive();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildCarousel(context);
  }

  Widget _buildCarousel(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height * 0.4;
    return Container(
      height: pageHeight,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              page = pageController.page;
            });
          }
          return null;
        },
        child: PageView.builder(
          onPageChanged: (pos) {
            setState(() {
              currentPage = pos;
              widget.setPageIndex(pos);
            });
          },
          controller: pageController,
          itemCount: carouselListItems.length,
          itemBuilder: (BuildContext context, int index) {
            return FeedCarouselItem(
              index: index,
              page: page,
              item: carouselListItems[index],
            );
          },
        ),
      ),
    );
  }

  fetch() async {
    final response = await http.get('https://dog.ceo/api/breeds/image/random');
    if (response.statusCode == 200) {
      final url = json.decode(response.body)['message'];
      setState(() {
        carouselListItems.add(url);
      });
    } else {
      throw Exception('failed to fetch image');
    }
  }

  fetchFive() {
    for (int i = 0; i < 15; i++) {
      fetch();
    }
  }
}
