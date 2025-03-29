import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:it_habar/core/constants/app_dimentions.dart';
import 'package:it_habar/core/widgets/text_widgets/entry_medium_text_widget.dart';
import 'package:it_habar/core/widgets/text_widgets/entry_small_text_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final urlImages = [
    'assets/images/001.png',
    'assets/images/002.png',
    'assets/images/003.png',
    'assets/images/004.png',
  ];

  final categoryList = [
    'Sport',
    'Technology',
    'Economy',
    'Culture',
  ];

  final timeList = [
    '2 hours ago',
    '3 hours ago',
    '4 hours ago',
    '5 hours ago',
  ];

  final titleList = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
  ];

  int carouselActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CarouselSlider.builder(
          itemCount: urlImages.length,
          options: CarouselOptions(
              height: 190.0,
              // enlargeCenterPage: true,
              // enlargeStrategy: CenterPageEnlargeStrategy.scale,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
              onPageChanged: (index, reason) {
                setState(() {
                  carouselActiveIndex = index;
                });
              }),
          itemBuilder: (
            context,
            index,
            realIndex,
          ) {
            final urlImage = urlImages[index];
            final category = categoryList[index];
            final time = timeList[index];
            final title = titleList[index];
            return _buildImage(
              urlImage,
              category,
              time,
              title,
              index,
            );
          },
        ),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildImage(String urlImage, String category, String time,
          String title, int index) =>
      SizedBox(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      urlImage,
                      fit: BoxFit.cover,
                      width: AppDimensions.screenWidth80(context).width,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 25,
              left: 30,
              child: Container(
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: EntrySmallTextWidget(text: category),
              ),
            ),
            Positioned(
              top: 100,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EntrySmallTextWidget(text: time),
                  SizedBox(
                    width: 250,
                    child: EntryMediumTextWidget(
                      text: title,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: carouselActiveIndex,
        count: urlImages.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Theme.of(context).textTheme.bodyLarge!.color!,
          radius: 8,
          spacing: 10,
          dotHeight: 9,
          dotWidth: 9,
        ),
      );
}
