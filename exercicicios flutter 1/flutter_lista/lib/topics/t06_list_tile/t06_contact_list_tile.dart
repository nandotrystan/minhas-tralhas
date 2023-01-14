import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lista/models/contact.dart';


class ContactListTile extends StatelessWidget {
  const ContactListTile({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final materialColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    final names = contact.name.split(' ');
    final identifier =
        names.first.characters.first + names.last.characters.first;
    final url = contact.picture;
    return Card(
      child: ListTile(
        title: Text(contact.name),
        subtitle: Text(contact.number),
        leading: CircleAvatar(
          foregroundImage: url != null ? NetworkImage(url) : null,
          backgroundColor: materialColor.withOpacity(0.4),
          foregroundColor: materialColor.shade800,
          child: Text(identifier),
        ),
      ),
    );
  }
}
