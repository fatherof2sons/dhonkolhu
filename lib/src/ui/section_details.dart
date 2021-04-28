import 'package:flutter/material.dart';

class SectionDetails extends StatelessWidget {
  SectionDetails({
    Key? key,
    @required this.section,
    @required this.content,
  }) : super(key: key);
  final String? section;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          section ?? '',
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.pink,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Center(
          child: Icon(
            Icons.baby_changing_station_rounded,
            size: 30.0,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 14.0, left: 12.0),
            child: Text(
              content ?? '',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
