import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  final Widget widget;
  final VoidCallback? onTap;
  const DrawerIcon({
    super.key,
    required this.widget,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: widget,
      ),
    );
  }
}
