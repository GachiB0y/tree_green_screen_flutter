import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/ui/component/tab_bar_widget.dart';
import 'package:tree_green_screen_flutter/ui/screen/references_sreeen.dart';
import 'package:tree_green_screen_flutter/ui/screen/structure_screen.dart';
import 'package:tree_green_screen_flutter/ui/screen/user_frist_screen.dart';

class UserMainScreen extends StatefulWidget {
  const UserMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  var selectedPageIndex = 0;

  var pages = <Widget>[
    const UserFirstScreen(),
    const Text(
      'Grass Coin',
    ),
    const Text(
      'Новости',
    ),
    const Text(
      'Аккаунт',
    ),
  ];
  var page2 = <Widget>[
    const ReferencesScreen(),
    const Text(
      'Grass Coin',
    ),
    const Text(
      'Новости',
    ),
    const Text(
      'Аккаунт',
    ),
  ];
  var page3 = <Widget>[
    const StructureScreen(),
    const Text(
      'Grass Coin',
    ),
    const Text(
      'Новости',
    ),
    const Text(
      'Аккаунт',
    ),
  ];

  void onChangeTab(int index) {
    setState(() {
      selectedPageIndex = index;
      print(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Navigator(
        onGenerateRoute: (settings) {
          List<Widget> screen = pages;
          if (settings.name == 'page2') screen = page2;
          if (settings.name == 'page3') screen = page3;
          return MaterialPageRoute(builder: (_) => screen[selectedPageIndex]);
        },
      ),
      // pages[selectedPageIndex],
      bottomNavigationBar: TabBarWidget(
          index: selectedPageIndex,
          onChangeTab: (index) => onChangeTab(index)),
    );
  }
}
