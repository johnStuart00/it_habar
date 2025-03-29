import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const IconWidget({
    super.key,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap;
      },
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Icon(
          icon,
          size: 22,
        ),
      ),
    );
  }
}
