import 'package:flutter/material.dart';

class EntryLargeTextWidget extends StatelessWidget {
  final String text;

  const EntryLargeTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headlineLarge,
      overflow: TextOverflow.ellipsis,
    );
  }
}
