import 'package:flutter/material.dart';
import 'package:it_habar/core/assets/app_icons.dart';
import 'package:it_habar/core/widgets/text_widgets/mark_text_widget.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Theme.of(context)
            .bottomNavigationBarTheme
            .unselectedItemColor!
            // ignore: deprecated_member_use
            .withOpacity(0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          SizedBox(width: 10),
          Icon(
            AppIcons.search,
          ),
          SizedBox(width: 10),
          Expanded(
            child: MarkTextWidget(text: 'Gözleg setiri'),
          ),
        ],
      ),
    );
  }
}
