import 'package:flutter/material.dart';

class SearchFilters extends StatefulWidget {
  const SearchFilters({Key? key}) : super(key: key);

  @override
  SearchFiltersState createState() => SearchFiltersState();
}

class SearchFiltersState extends State<SearchFilters> {
  @override
  Widget build(BuildContext context) {
    return const ExpansionTile(
      title: Text('Filters'),
    );
  }
}
