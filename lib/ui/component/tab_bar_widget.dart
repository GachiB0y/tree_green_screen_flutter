import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/theme/colors_theme.dart';

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
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildItem(
              index: 0,
              img: Image.asset(
                'assets/images/menu_icons.png',
                width: 30,
                height: 30,
              ),
              text: 'Главная'),
          buildItem(
              index: 1,
              img: Image.asset(
                'assets/images/grass_coin.png',
                width: 30,
                height: 30,
              ),
              text: 'Grass Coin'),
          Stack(
            children: [
              buildItem(
                  index: 2,
                  img: Image.asset(
                    'assets/images/news.png',
                    width: 30,
                    height: 30,
                  ),
                  text: 'Новости'),
              const Positioned(
                left: 26,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 6.5,
                  child: Text(
                    '6',
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          buildItem(
              index: 3,
              img: Image.asset(
                'assets/images/user_circle.png',
                width: 30,
                height: 30,
              ),
              text: 'Профиль'),
        ],
      ),
    );
  }

  Widget buildItem({
    required int index,
    required String text,
    Icon? icon,
    required Image img,
  }) {
    final isSelected = index == widget.index;
    return GestureDetector(
      onTap: () => widget.onChangeTab(index),
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ColorFiltered(
              colorFilter: ColorFilter.mode(
                  isSelected
                      ? ColorsForWidget.colorGreen
                      : ColorsForWidget.colorGrey,
                  BlendMode.modulate),
              child: img),
          Text(
            text,
            style:
                const TextStyle(fontSize: 12, color: ColorsForWidget.colorGrey),
          ),
        ],
      ),
    );
  }
}
