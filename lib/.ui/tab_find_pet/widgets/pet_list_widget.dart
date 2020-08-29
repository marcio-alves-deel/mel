import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mel/widgets.dart';

import 'widgets.dart';

class PetList extends StatefulWidget {
  @override
  _PetListState createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  List<Widget> carouselListItems = new List();
  ScrollController _scrollController = new ScrollController();
  double scrollPosition = 0.0;

  @override
  void initState() {
    super.initState();
    fetchFive();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchFive();
      }

      setState(() {
        scrollPosition = _scrollController.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: HorizontalInfiniteScroll(
        controller: _scrollController,
        listItems: carouselListItems,
        height: 350,
      ),
    );
  }

  fetch() async {
    final response = await http.get('https://dog.ceo/api/breeds/image/random');
    if (response.statusCode == 200) {
      final url = json.decode(response.body)['message'];
      setState(() {
        carouselListItems.add(
          PetCardItem(
            image: url,
          ),
        );
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
