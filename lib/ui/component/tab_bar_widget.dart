import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/theme/colors_theme.dart';
import 'package:tree_green_screen_flutter/theme/style_text.dart';

class TabBarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangeTab;
  const TabBarWidget(
      {super.key, required this.index, required this.onChangeTab});

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  final int number = 6;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 74,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildItem(
              index: 0,
              img: Image.asset(
                'assets/images/menu_icon_grey.png',
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
            alignment: Alignment.topRight,
            children: [
              buildItem(
                  index: 2,
                  img: Image.asset(
                    'assets/images/news.png',
                    width: 30,
                    height: 30,
                  ),
                  text: 'Новости'),
              Padding(
                padding: number < 10
                    ? const EdgeInsets.only(right: 8.0)
                    : EdgeInsets.zero,
                child: Container(
                    padding: const EdgeInsets.only(
                      left: 3.0,
                      right: 3.0,
                    ),
                    decoration: BoxDecoration(
                      color: ColorsForWidget.colorRed,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      number.toString(),
                      style: StyleTextCustom.styleTextNotification,
                    )),
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
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
            isSelected
                ? ColorsForWidget.colorGreen
                : ColorsForWidget.colorGrey,
            BlendMode.modulate),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            img,
            Text(
              text,
              style:
              const TextStyle(fontSize: 12, color: ColorsForWidget.colorGrey),
            ),
          ],
        ),
      ),
    );
  }
}
