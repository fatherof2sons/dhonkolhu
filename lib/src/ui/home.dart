import 'package:dhonkolhu/src/ui/section_details.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  void _goTo(BuildContext context, Widget page) => Navigator.of(context).push(
      MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.child_friendly_rounded,
            color: Colors.pink,
            size: 30.0,
          ),
          title: Text(
            'Dhonkolhu'.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Freckle Face',
              fontSize: 22.0,
              color: Colors.pink,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: ContentData.data.length,
          itemBuilder: (context, index) {
            final _data = ContentData.data;
            final _section = _data[index].keys.first;

            final _listTileChildren = _data[index][_section]
                ?.map(
                  (content) => ListTile(
                    title: Text(
                      '※ $content',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    onTap: () => _goTo(
                        context,
                        SectionDetails(
                          section: _section,
                          content: content,
                        )),
                  ),
                )
                .toList();

            return ExpansionTile(
              title: Text(
                '$_section',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              children: _listTileChildren ?? [],
            );
          },
        ));
  }
}

class ContentData {
  static final List<Map<String, List<String>>> data = [
    {
      'Section 1: Introduction': [
        'Foundation: Let\'s master it',
        'Baby\'s First Month: Eat, Sleep, Grow',
        'Baby Month 2: Things Become Clearer',
        'Baby Month 3: Patterns & Development',
      ]
    },
    {
      'Section 2: Growing So Fast: Monts 4-7': [
        'Baby Month 4: Growing so Fast',
        'Baby Month 5: Keeping Infections at Bay',
        'Baby Month 6: The Half- a -Year Old Milestone',
        'Baby Month 7: Scoot, Roll and Crawl',
      ]
    },
    {
      'Section 3: A new type of challenges to conquer': [
        'Baby Month 8: Growth Concerns',
        'Baby Month 9: Fussy Baby & How to Soothe Your Munchkin',
        'Baby Month 10: Building the Right Habits',
        'Baby Month 11: All Grown Up',
      ]
    },
    {
      'Section 4: A Wonderful Milestone, You Dit it!': [
        'Baby Month 12: Happy 1st Birthday!',
        'On-Going Skill Development',
        'Sunny or Rainy - Let\'s do it Better!',
        'Taking care of your baby when they are sick',
      ]
    },
  ];
}
