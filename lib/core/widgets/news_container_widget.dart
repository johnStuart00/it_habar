import 'package:flutter/material.dart';
import 'package:it_habar/core/assets/app_icons.dart';
import 'package:it_habar/core/constants/app_color.dart';
import 'package:it_habar/core/constants/app_dimentions.dart';
import 'package:it_habar/core/widgets/text_widgets/medium_text_widget.dart';
import 'package:it_habar/core/widgets/text_widgets/small_text_widget.dart';

class NewsContainerWidget extends StatefulWidget {
  const NewsContainerWidget({
    super.key,
    required this.imagePath,
    required this.newsCategory,
    required this.newsTitle,
    required this.newsTime,
    required this.notedValue,
    required this.notedFunc,
  });

  final String imagePath;
  final String newsCategory;
  final String newsTitle;
  final String newsTime;
  final bool notedValue;
  final VoidCallback notedFunc;

  @override
  State<NewsContainerWidget> createState() => _NewsContainerWidgetState();
}

class _NewsContainerWidgetState extends State<NewsContainerWidget> {
  late bool noted;

  @override
  void initState() {
    super.initState();
    noted = widget.notedValue;
  }

  void _toggleNoted() {
    setState(() {
      noted = !noted;
    });
    widget.notedFunc();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDimensions.screenWidth(context) * 0.8,
      height: AppDimensions.screenHeight(context) * 0.13,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.imagePath),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallTextWidget(text: widget.newsCategory),
                    IconButton(
                      onPressed: _toggleNoted,
                      icon: Icon(
                        noted ? AppIcons.notedFill : AppIcons.noted,
                        color: noted ? AppColors.appColor : AppColors.grey,
                      ),
                    )
                  ],
                ),
                MediumTextWidget(text: widget.newsTitle),
                SmallTextWidget(text: widget.newsTime),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
