import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    @required this.text,
  }) : super(key: key);
  final String? text;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          '$text.',
          textAlign: TextAlign.justify,
          textDirection: TextDirection.rtl,
          softWrap: true,
          style: TextStyle(
            fontFamily: 'mvTyper',
            fontSize: 15.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      );
}
