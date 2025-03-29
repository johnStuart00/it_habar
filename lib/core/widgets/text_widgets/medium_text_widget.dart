import 'package:flutter/material.dart';

class MediumTextWidget extends StatelessWidget {
  final String text;
  const MediumTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
      overflow: TextOverflow.ellipsis,
    );
  }
}
