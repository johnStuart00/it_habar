import 'package:flutter/material.dart';
import 'package:it_habar/core/widgets/text_widgets/medium_text_widget.dart';

class GlobalScreen extends StatelessWidget {
  const GlobalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MediumTextWidget(
          text: 'Global Screen',
        ),
      ),
    );
  }
}
