import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class SearchOptions extends Equatable {
  final String userAgentVersion;
  final String domain;
  final String uri;

  SearchOptions(
      {@required this.userAgentVersion,
      @required this.domain,
      @required this.uri});

  @override
  List<Object> get props => [this.userAgentVersion, this.domain, this.uri];
}