import 'package:dhonkolhu/src/ui/resources.dart';
import 'package:flutter/material.dart';

class SectionDetails extends StatelessWidget {
  SectionDetails({
    Key? key,
    @required this.topic,
    @required this.isENG,
  }) : super(key: key);
  final Map<List<String>, List<String>>? topic;
  final bool? isENG;

  @override
  Widget build(BuildContext context) {
    final String? _detailsTitle = isENG != null && isENG == true
        ? ' ${topic?.keys.first[0]}'
        : ' ${topic?.keys.first[1]}';
    final String? _details = isENG != null && isENG == true
        ? ' ${topic?.values.first[0]}'
        : ' ${topic?.values.first[1]}';

    return Scaffold(
      appBar: AppBar(
          // title: Text(
          //   _details ?? 'details',
          //   style: TextStyle(
          //     fontSize: 15.0,
          //     color: Colors.pink,
          //   ),
          // ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Resources(
                  resource: ' ${topic?.values.last[0]}',
                ))),
        child: Center(
          child: Icon(
            Icons.baby_changing_station_rounded,
            size: 30.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: isENG == true
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.end,
            children: [
              SizedBox(height: 8.0),
              Text(
                _detailsTitle ?? 'detailsTitle',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.pink,
                ),
              ),
              SizedBox(height: 26.0),
              Text(
                _details ?? 'details',
                textAlign: isENG == true ? TextAlign.left : TextAlign.right,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
