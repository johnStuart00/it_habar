import 'package:flutter/material.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'IT',
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(width: 5),
        Text(
          'Habar',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ],
    );
  }
}
