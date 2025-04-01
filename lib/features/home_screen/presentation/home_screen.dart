import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:it_habar/core/widgets/news_container_widget.dart';
import 'package:it_habar/core/widgets/text_widgets/large_text_widget.dart';
import 'package:it_habar/core/widgets/text_widgets/mark_text_widget.dart';
import 'package:it_habar/features/drawer_screen/presentation/drawer_screen.dart';
import 'package:it_habar/features/drawer_screen/widgets/drawer_icon.dart';
import 'package:it_habar/features/home_screen/widgets/appbar_field.dart';
import 'package:it_habar/features/home_screen/widgets/banner_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  void _showIndicator() {}

  List<String> imagePath = [
    'assets/images/habar01.jpg',
    'assets/images/habar02.jpg',
    'assets/images/habar03.jpg',
    'assets/images/habar04.jpg',
    'assets/images/habar05.jpg',
    'assets/images/habar06.jpg',
  ];

  List<String> newsCategory = [
    'Sport',
    'Technology',
    'Economy',
    'Culture',
    'Sport',
    'Technology',
  ];

  List<String> newsTitle = [
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit',
  ];

  List<String> newsTime = [
    '2 hours ago',
    '3 hours ago',
    '4 hours ago',
    '5 hours ago',
    '6 hours ago',
    '7 hours ago',
  ];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // ignore: deprecated_member_use
              Theme.of(context).cardTheme.color!.withOpacity(0.2),
              Theme.of(context).cardTheme.color!,
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      drawer: DrawerScreen(),
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            //appbar field is start
            SliverAppBar(
              floating: true,
              snap: true,
              pinned: true,
              automaticallyImplyLeading: false, //Remove default drawer button
              title: AppBarField(
                onSegmentTap: DrawerIcon(
                  onTap: _handleMenuButtonPressed,
                  widget: ValueListenableBuilder<AdvancedDrawerValue>(
                    valueListenable: _advancedDrawerController,
                    builder: (_, value, __) {
                      return AnimatedSwitcher(
                        duration: Duration(milliseconds: 250),
                        child: Icon(
                          value.visible ? Icons.clear : Icons.menu,
                          key: ValueKey<bool>(value.visible),
                        ),
                      );
                    },
                  ),
                ),
                onSearchTap: _showIndicator,
                onNotificationTap: _showIndicator,
              ),
            ),
            //appbar field is end
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            //banner field is start
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LargeTextWidget(text: 'Iň täze habaralar'),
                    MarkTextWidget(text: 'Hemmesi')
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200.0,
                child: BannerWidget(),
              ),
            ),
            //banner field is end
            SliverToBoxAdapter(child: SizedBox(height: 10.0)),
            //main field start
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LargeTextWidget(text: 'Sizi gyzyklandyryp biler'),
                    MarkTextWidget(text: 'Hemmesi')
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return NewsContainerWidget(
                      imagePath: imagePath[index],
                      newsCategory: newsCategory[index],
                      newsTitle: newsTitle[index],
                      newsTime: newsTime[index],
                    );
                  },
                  childCount: newsCategory.length,
                ),
              ),
            )
            //main field end
          ],
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
