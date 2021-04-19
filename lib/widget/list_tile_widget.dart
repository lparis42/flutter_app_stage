import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onClicked;

  const ListTileWidget({
    @required this.text,
    @required this.icon,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  Widget build(BuildContext context) => ListTile(
    contentPadding: EdgeInsets.only(left: 32),
    title: Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    leading: Icon(icon, size: 28, color: Colors.black),
    onTap: onClicked,
  );
}