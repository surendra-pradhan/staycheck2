import 'package:flutter/material.dart';

class SearchCard extends StatefulWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  State<SearchCard> createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintStyle: TextStyle(fontSize: 17),
          hintText: 'Search your trips',
          suffixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
