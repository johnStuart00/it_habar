import 'package:flutter/material.dart';

class EntryMediumTextWidget extends StatelessWidget {
  final String text;
  const EntryMediumTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
