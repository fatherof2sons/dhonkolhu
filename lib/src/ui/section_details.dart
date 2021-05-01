import 'package:dhonkolhu/src/ui/resources.dart';
import 'package:flutter/material.dart';

class SectionDetails extends StatelessWidget {
  SectionDetails({
    Key? key,
    @required this.section,
    @required this.topic,
  }) : super(key: key);
  final String? section;
  final Map<String, String>? topic;

  @override
  Widget build(BuildContext context) {
    final values = topic?.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$section: ${topic?.keys.first}',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.pink,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Resources(
                  resource: values?.last,
                ))),
        child: Center(
          child: Icon(
            Icons.baby_changing_station_rounded,
            size: 30.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                values?.first ?? '',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
