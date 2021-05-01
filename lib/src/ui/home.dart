import 'package:dhonkolhu/src/database/db.dart';
import 'package:dhonkolhu/src/model/section.dart';
import 'package:dhonkolhu/src/ui/section_details.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // load data to show on screen
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Sections> _data = Db.data;

  bool isENG = false;

  void _goTo(BuildContext context, Widget page) => Navigator.of(context).push(
      MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[300],
        leading: Icon(
          Icons.child_friendly_rounded,
          color: Colors.white,
          size: 30.0,
        ),
        title: Text(
          !isENG ? ' ދޮންކޮޅު' : 'Dhonkolhu',
          style: TextStyle(
            fontFamily: 'Freckle Face',
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  if (!isENG) {
                    setState(() {
                      isENG = true;
                    });
                  } else {
                    setState(() {
                      isENG = false;
                    });
                  }
                });
              },
              child: Text(
                'ENG',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final section = _data[index].section;
          final topics = _data[index]
              .topics
              ?.map(
                (Map<String, String> topic) => ListTile(
                  title: Text(
                    '${topic.keys.first}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[600]),
                  ),
                  onTap: () => _goTo(
                    context,
                    SectionDetails(
                      section: section,
                      topic: topic,
                    ),
                  ),
                ),
              )
              .toList();
          return ExpansionTile(
            subtitle: Text(
              'Section: ${index + 1}',
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            title: Text(
              section ?? 'section',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
              ),
            ),
            children: topics ?? [],
          );
        },
      ),
    );
  }
}

// final _section = _data[index].section;
// // final _topics = _data[index].topics;
// // final _section = _data[index].section;
// //
// final topics = _data[index]

// final _listTileChildren = _data[index].topics?.map<String, String>(
//   (String content) => ListTile(
//     title: Text(
//       '$content',
//       textAlign: TextAlign.left,
//       style: TextStyle(fontSize: 15.0),
//     ),
//     leading: Icon(
//       Icons.bubble_chart_outlined,
//       color: Colors.blue[100],
//     ),
//     subtitle: Text(
//       '5min read',
//       style: TextStyle(fontSize: 9.0, color: Colors.grey),
//     ),
//     dense: true,
//     horizontalTitleGap: 1.0,
//     onTap: () => _goTo(
//       context,
//       SectionDetails(section: _section, content: content),
//     ),
//   ),
// );
