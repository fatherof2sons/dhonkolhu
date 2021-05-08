import 'package:dhonkolhu/src/database/db.dart';
import 'package:dhonkolhu/src/model/section.dart';
import 'package:dhonkolhu/src/ui/section_details.dart';
import 'package:dhonkolhu/src/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final List<Sections> _data = Db.sections;

  void _goTo(BuildContext context, Widget page) => Navigator.of(context).push(
      MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.child_friendly),
        title: Text(
          'ދޮންކޮޅު',
          style: TextStyle(
            fontFamily: 'mvTyper',
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink[300],
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, index) {
          final String? _sectionName = _data[index].section;
          final List<ListTile>? _topics =
              _data[index].topics?.map((Map<String, Set<String>> topic) {
            final String _topicName = topic.keys.first;

            return ListTile(
              focusColor: Colors.pink[100],
              dense: true,
              title: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CustomText(
                  text: '$_topicName',
                ),
              ),
              onTap: () => _goTo(context, SectionDetails(topic: topic)),
            );
          }).toList();

          return ExpansionTile(
            collapsedBackgroundColor: Colors.pink[100],
            backgroundColor: Colors.pink[100],
            title: CustomText(
              text: _sectionName ?? 'section_name',
            ),
            children: _topics ?? [Text('Something went wrong')],
          );
        },
      ),
    );
  }
}
