import 'package:flutter/foundation.dart';

class Sections {
  Sections({
    @required this.section,
    @required this.topics,
  });
  final List<String>? section;
  final List<Map<List<String>, List<String>>>? topics;
}
