import 'package:flutter/material.dart';
import 'package:it_habar/core/constants/app_dimentions.dart';
import 'package:it_habar/core/widgets/text_widgets/medium_text_widget.dart';
import 'package:it_habar/core/widgets/text_widgets/small_text_widget.dart';

class NewsContainerWidget extends StatelessWidget {
  const NewsContainerWidget({
    super.key,
    required this.imagePath,
    required this.newsCategory,
    required this.newsTitle,
    required this.newsTime,
  });

  final String imagePath;
  final String newsCategory;
  final String newsTitle;
  final String newsTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0),
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
                  image: AssetImage(imagePath),
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
                SmallTextWidget(text: newsCategory),
                MediumTextWidget(text: newsTitle),
                SmallTextWidget(text: newsTime),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
