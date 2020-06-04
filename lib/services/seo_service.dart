import 'dart:async';

import 'package:dio/dio.dart';
import '../models/models.dart';
import '../shared/shared.dart';

import 'package:html/parser.dart';
import 'dart:developer' as developer;
import 'package:html/dom.dart';

class SeoService {
  Future<List<Task>> getAllMovies(SearchOptions options) async {
    developer
        .log("------>" + UserAgent.fromType[options.userAgentVersion]);
    List<Task> movies = [];
    try {
      var response = await Dio().get(options.domain + options.uri,
          options: Options(headers: {
            'User-Agent': UserAgent.fromType[options.userAgentVersion]
          }));

      var document = parse(response.toString());
      _AddSuccessResult(response, document, movies);
    } catch (e) {
      _AddErrorResult(movies, e);
    }

    var completer = new Completer<List<Task>>();

    completer.complete(movies);

    return completer.future;
  }

  void _AddSuccessResult(
      Response response, Document document, List<Task> movies) {
    const desc_selector = 'meta[name="description"]';
    const canonical_selector = 'link[rel="canonical"]';
    const markup_selector = 'script[type="application/ld+json"]';

    var resultUri = response.redirects.length > 0
        ? response.redirects[0].location
        : response.request.path.toString();
    var redirectCode =
        response.redirects.length > 0 ? response.redirects[0].statusCode : 200;

    var h1 = document.getElementsByTagName('h1').isNotEmpty
        ? document.getElementsByTagName('h1').first.text
        : "";
    var metaDescription = document.querySelectorAll(desc_selector).isNotEmpty
        ? document.querySelectorAll(desc_selector).first.attributes['content']
        : "";
    var canonical = document.querySelectorAll(canonical_selector).isNotEmpty
        ? document.querySelectorAll(canonical_selector).first.attributes['href']
        : "";
    var markup = document.querySelectorAll(markup_selector).isNotEmpty
        ? document.querySelectorAll(markup_selector).map((e) => e.outerHtml)
        : "";
    Element title = document.getElementsByTagName('title').first;

    movies.add(Task(
        title: resultUri.toString(), description: redirectCode.toString()));
    movies.add(Task(title: 'h1', description: h1.trim()));
    movies.add(Task(title: 'title', description: title.text.trim()));
    movies.add(Task(title: 'description', description: metaDescription.trim()));
    movies.add(Task(title: 'canonical', description: canonical.trim()));
    movies.add(Task(title: 'schema markup', description: markup.toString()));
  }

  void _AddErrorResult(List<Task> movies, e) {
    movies.add(Task(title: 'Wrong response', description: e.toString()));
  }
}
