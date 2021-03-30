import 'package:flutter/material.dart';
import 'package:flutter_eyepetizer/page/recommend_page.dart';
import 'package:flutter_eyepetizer/page/topics_page.dart';
import 'package:flutter_eyepetizer/widget/tab_bar_widget.dart';

import 'category_page.dart';
import 'follow_page.dart';
import 'news_list_page.dart';

const TAB_LABEL = ['关注', '分类', '专题', '资讯', '推荐'];

class DiscoveryPage extends StatefulWidget {
  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: TAB_LABEL.length, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('发现',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          brightness: Brightness.light,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: TabBarWidget(
                  tabController: _tabController,
                  tabs: TAB_LABEL.map((String label) {
                    return Tab(text: label);
                  }).toList(),
                  onTap: (index) => _pageController.animateToPage(index,
                      duration: kTabScrollDuration, curve: Curves.ease)),
            ),
            Expanded(
                child: PageView(
                    controller: _pageController,
                    onPageChanged: (index) => _tabController.index = index,
                    children: <Widget>[
                  FollowPage(),
                  CategoryPage(),
                  TopicsPage(),
                  NewsListPage(),
                  RecommendPage()
                ]))
          ],
        ));
  }

  @override
  bool get wantKeepAlive => true;
}
