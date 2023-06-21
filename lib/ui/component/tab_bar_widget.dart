import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangeTab;
  const TabBarWidget(
      {super.key, required this.index, required this.onChangeTab});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  @override
  Widget build(BuildContext context) {
    return
      BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildItem(index: 0, icon: const Icon(Icons.home_filled), text: 'Главная'),
            buildItem(index: 1, icon: const Icon(Icons.currency_bitcoin),text:'Grass Coin'),
            buildItem(index: 2, icon: const Icon(Icons.newspaper),text:'Новости'),
            buildItem(index: 3, icon: Icon(Icons.person),text:'Профиль'),
          ],
        ),
      );
  }

  Widget buildItem({
    required int index,
    required String text,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 32,
          width: 36,
          child: IconTheme(
            data: IconThemeData(color: isSelected ? Colors.green : Colors.grey),
            child: IconButton(
              icon: icon,
              onPressed: () => widget.onChangeTab(index),
            ),
          ),
        ),
        Text('${text}',style: TextStyle(fontSize:12),),
      ],
    );
  }
}