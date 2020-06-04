import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:r_flutter_provider/models/search_options.dart';

import '../models/models.dart';
import 'dart:developer' as developer;

class DetailView extends StatelessWidget {
  final SearchOptions requestInput;
  DetailView({Key key, @required this.requestInput}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    developer.log("------>" + requestInput.domain);
    return MaterialApp(
      title: "Movies",
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) => MovieListViewModel(),
      //   child: MovieListPage(
      //     requestInput: requestInput,
      //   ),
    );
  }
}
