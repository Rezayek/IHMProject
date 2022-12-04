import 'package:flutter/material.dart';

import '../../../widgets/background_widget.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: const [
          Positioned(
            child: BackgroundWidget() ,
          )
        ],
      ),
    );
  }
}