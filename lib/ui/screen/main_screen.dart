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
    const ReferencesScreen(),
    const StructureScreen(),
    const Text(
      'Аккаунт',
    ),
  ];

  void onChangeTab(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: pages[selectedPageIndex],
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.1,
        child: TabBarWidget(
            index: selectedPageIndex,
            onChangeTab: (index) => onChangeTab(index)),
      ),
    );
  }
}
