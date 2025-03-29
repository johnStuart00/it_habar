import 'package:flutter/material.dart';

class SmallTextWidget extends StatelessWidget {
  final String text;
  const SmallTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
    );
  }
}
