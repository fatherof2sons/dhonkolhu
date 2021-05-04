import 'package:dhonkolhu/src/blocs/home_bloc.dart';
import 'package:dhonkolhu/src/database/db.dart';
import 'package:dhonkolhu/src/model/section.dart';
import 'package:dhonkolhu/src/ui/section_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  static Widget create(BuildContext context) => Provider<HomeBloc>(
        create: (_) => HomeBloc(),
        child: Home(),
        dispose: (context, bloc) => bloc.dispose(),
      );

  final List<Sections> _data = Db.sections;

  void _goTo(BuildContext context, Widget page) => Navigator.of(context).push(
      MaterialPageRoute(fullscreenDialog: true, builder: (context) => page));

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomeBloc>(context);
    return StreamBuilder<bool>(
      stream: bloc.isEngStream,
      initialData: true,
      builder: (context, snapshot) {
        final data = snapshot.data;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink[300],
            leading: Icon(
              Icons.child_friendly_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            title: Text(
              data == false ? ' ދޮންކޮޅު' : 'Dhonkolhu',
              style: TextStyle(
                fontFamily: 'Freckle Face',
                fontSize: 22.0,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                onPressed: () =>
                    data == false ? bloc.setIsENG(true) : bloc.setIsENG(false),
                child: Text(
                  data == false ? 'ENG' : 'DHI',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          body: ListView.builder(
            itemCount: _data.length,
            itemBuilder: (context, index) {
              final List<String>? _sectionName = _data[index].section;
              final _topics = _data[index]
                  .topics
                  ?.map((Map<List<String>, List<String>> topic) {
                final List<String> _topicName = topic.keys.first;
                final String _topic =
                    data == true ? _topicName.first : _topicName.last;
                return ListTile(
                  // tileColor: Colors.brown,
                  title: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Text(
                      '$_topic',
                      style: TextStyle(
                        fontSize: 13.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                      textAlign:
                          data == true ? TextAlign.left : TextAlign.right,
                    ),
                  ),
                  onTap: () => _goTo(
                      context,
                      SectionDetails(
                        topic: topic,
                        isENG: data,
                      )),
                );
              }).toList();

              return ExpansionTile(
                title: Text(
                  data == true ? '${_sectionName?[0]}' : '${_sectionName?[1]}',
                  textAlign: data == true ? TextAlign.left : TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Colors.black87,
                  ),
                ),
                children: _topics ?? [],
              );
            },
          ),
        );
      },
    );
  }
}
