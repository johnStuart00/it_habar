import 'package:flutter/material.dart';

class MarkTextWidget extends StatelessWidget {
  final String text;
  const MarkTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
    );
  }
}
