import 'package:flutter/material.dart';

class LargeTextWidget extends StatelessWidget {
  final String text;

  const LargeTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyLarge,
      overflow: TextOverflow.ellipsis,
    );
  }
}
