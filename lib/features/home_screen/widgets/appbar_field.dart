import 'package:flutter/material.dart';
import 'package:it_habar/core/assets/app_icons.dart';
import 'package:it_habar/core/widgets/icon_widget.dart';

class AppBarField extends StatelessWidget {
  final VoidCallback onSegmentTap;
  final VoidCallback onSearchTap;
  final VoidCallback onNotificationTap;

  const AppBarField({
    required this.onSegmentTap,
    required this.onSearchTap,
    required this.onNotificationTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWidget(
          icon: AppIcons.segment,
          onTap: onSegmentTap,
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconWidget(
                icon: AppIcons.search,
                onTap: onSearchTap,
              ),
              SizedBox(width: 5),
              Stack(
                children: [
                  IconWidget(
                    icon: AppIcons.notification,
                    onTap: onNotificationTap,
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        color: Theme.of(context).indicatorColor,
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
