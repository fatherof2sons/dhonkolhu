import 'package:dhonkolhu/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SectionDetails extends StatelessWidget {
  SectionDetails({
    Key? key,
    @required this.topic,
  }) : super(key: key);
  final Map<String, Set<String>>? topic;

  @override
  Widget build(BuildContext context) {
    final String? _topic = topic?.keys.first;
    final List<String>? _values = topic?[_topic]?.toList();
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        //     builder: (_) => Resources(
        //           resource: ' ${topic?.values.last[0]}',
        //         ))),
        onPressed: () {},
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 8.0),
              Text(
                '$_topic',
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'mvTyper',
                    color: Colors.pink[300],
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8.0),
              CustomText(text: '      ${_values?[0]}'),
              CustomText(text: '      ${_values?[1]}'),
            ],
          ),
        ),
      ),
    );
  }
}
