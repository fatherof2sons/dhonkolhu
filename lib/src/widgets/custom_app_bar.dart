import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    @required this.titleName,
    @required this.actionTextName,
    @required this.onTap,
  }) : super(key: key);
  final String? titleName;
  final String? actionTextName;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink[300],
      leading: Icon(
        Icons.child_friendly_rounded,
        color: Colors.white,
        size: 30.0,
      ),
      title: Text(
        '$titleName',
        style: TextStyle(
          fontFamily: 'Freckle Face',
          fontSize: 22.0,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      actions: [
        TextButton(
          onPressed: onTap,
          child: Text(
            '$actionTextName',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.0);
}
