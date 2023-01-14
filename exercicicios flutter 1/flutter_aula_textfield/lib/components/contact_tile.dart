import 'package:flutter/material.dart';

class ContactTile extends StatefulWidget {
  const ContactTile({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.contactIcon,
    required this.contactTitle,
  }) : super(key: key);

  final bool value;
  final ValueChanged<bool?> onChanged;
  final String contactTitle;
  final IconData contactIcon;

  @override
  _ContactTileState createState() => _ContactTileState();
}

class _ContactTileState extends State<ContactTile> {
  final focusNode = FocusNode(descendantsAreFocusable: false);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        dense: true,
        focusNode: focusNode,
        title: Text(widget.contactTitle),
        secondary: Icon(widget.contactIcon),
        value: widget.value,
        onChanged: widget.onChanged);
  }
}
