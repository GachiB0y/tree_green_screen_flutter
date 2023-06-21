import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/ui/component/tab_bar_widget.dart';
import 'package:tree_green_screen_flutter/ui/screen/references_sreeen.dart';
import 'package:tree_green_screen_flutter/ui/screen/structure_screen.dart';

class UserMainScreen extends StatefulWidget {
  UserMainScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserMainScreen> createState() => _UserMainScreenState();
}

class _UserMainScreenState extends State<UserMainScreen> {
  var selectedPageIndex = 0;

  var pages = <Widget>[

    ReferencesScreen(),
    StructureScreen(),
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
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: pages[selectedPageIndex],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height  * 0.1,
        child: TabBarWidget(
            index: selectedPageIndex,
            onChangeTab: (index) => onChangeTab(index)),
      ),
    );
  }
}



