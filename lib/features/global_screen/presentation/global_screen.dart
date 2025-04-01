import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:it_habar/core/widgets/text_widgets/entry_medium_text_widget.dart';
import 'package:it_habar/core/widgets/text_widgets/large_text_widget.dart';
import 'package:it_habar/core/widgets/text_widgets/small_text_widget.dart';
import 'package:it_habar/features/drawer_screen/presentation/drawer_screen.dart';
import 'package:it_habar/features/drawer_screen/widgets/drawer_icon.dart';
import 'package:it_habar/features/global_screen/widgets/search_field_widget.dart';
import 'package:it_habar/features/home_screen/widgets/appbar_field.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen>
    with SingleTickerProviderStateMixin {
  final _advancedDrawerController = AdvancedDrawerController();
  late TabController _tabController;

  void _showIndicator() {}

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  List<String> newsCategory = [
    'Sport',
    'Technology',
    'Economy',
    'Culture',
    'Sport',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: newsCategory.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            //entry large text is start
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeTextWidget(text: 'Ähli täzelikler'),
                    const SizedBox(width: 10),
                    SmallTextWidget(text: 'Hemme bölümler bir ýerde'),
                  ],
                ),
              ),
            ),
            //entry large text is end
            SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            //search field is start
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: SearchField(),
              ),
            ),
            //search field is end
            SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            //category field is start
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: _TabBarDelegate(
                TabBar(
                  controller: _tabController,
                  dividerHeight: 0.0,
                  indicator: BoxDecoration(),
                  isScrollable: true,
                  labelPadding: EdgeInsets.zero,
                  tabs: List.generate(newsCategory.length, (index) {
                    bool isSelected = _tabController.index == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _tabController.animateTo(index);
                        });
                      },
                      child: Container(
                        height: 35,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Theme.of(context)
                                  .cardTheme
                                  .color! // Selected color
                              : Theme.of(context)
                                  .cardTheme
                                  .color!
                                  // ignore: deprecated_member_use
                                  .withOpacity(0.4), // Unselected color
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 4)
                                ] // Add slight shadow for selected tab
                              : [],
                        ),
                        child: EntryMediumTextWidget(
                          text: newsCategory[index],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 15.0)),
            // Content for Each Category
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: newsCategory.map((category) {
                  return Center(child: Text("$category News"));
                }).toList(),
              ),
            ),
            //category field is end
            SliverToBoxAdapter(child: SizedBox(height: 15.0)),
          ],
        ),
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _TabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
