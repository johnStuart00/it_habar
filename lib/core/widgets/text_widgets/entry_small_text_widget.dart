import 'package:flutter/material.dart';

class EntrySmallTextWidget extends StatelessWidget {
  final String text;
  const EntrySmallTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineSmall,
      overflow: TextOverflow.ellipsis,
    );
  }
}
