import 'package:flutter/foundation.dart';

class Sections {
  Sections({
    @required this.section,
    @required this.topics,
  });
  final String? section;
  final List<Map<String, String>>? topics;
}
