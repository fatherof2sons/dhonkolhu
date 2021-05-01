import 'package:flutter/material.dart';

class Resources extends StatelessWidget {
  Resources({
    Key? key,
    @required this.resource,
  }) : super(key: key);
  final String? resource;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(resource ?? 'Resources'),
      ),
    );
  }
}
