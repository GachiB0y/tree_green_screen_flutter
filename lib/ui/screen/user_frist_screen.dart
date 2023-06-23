import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/theme/colors_theme.dart';
import 'package:tree_green_screen_flutter/theme/style_text.dart';

const style =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);

class UserFirstScreen extends StatelessWidget {
  const UserFirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsForWidget.colorGreen,
      appBar: const _AppBarFirstScreen(),
      body: Padding(
        padding: const EdgeInsets.only(top: 19.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          child: Container(
            color: Colors.white,
            child: Container(
                margin:
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 26.0),
                child: CustomScrollView(
                  slivers: <Widget>[
                    const SliverPadding(
                      padding: EdgeInsets.only(bottom: 16.0),
                      sliver: ColorSilverGridWidget(),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5.23,
                        decoration: BoxDecoration(
                          color: const Color(0xFF58C18F),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Stack(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 16.0, top: 16.0),
                              child: Text(
                                'Grass Википедия',
                                softWrap: true,
                                maxLines: 2,
                                style: style,
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Image.asset('assets/images/books.png')),
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(14)),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
                // Column(
                //   children: [
                //     ColorGridWidget(),
                //     const SizedBox(
                //       height: 14,
                //     ),
                //     Container(
                //       height: MediaQuery.of(context).size.height / 5.23,
                //       decoration: BoxDecoration(
                //         color: const Color(0xFF6FD4D4),
                //         borderRadius: BorderRadius.circular(14),
                //       ),
                //       child: Stack(
                //         children: [
                //           const Padding(
                //             padding: EdgeInsets.only(left: 16.0, top: 16.0),
                //             child: Text(
                //               'Grass Википедия',
                //               softWrap: true,
                //               maxLines: 2,
                //               style: style,
                //               textAlign: TextAlign.left,
                //             ),
                //           ),
                //           Align(
                //               alignment: Alignment.bottomRight,
                //               child: Image.asset(
                //                   'assets/images/first_screen/bus.png')),
                //         ],
                //       ),
                //     ),
                //   ],
                // ),
                ),
          ),
        ),
      ),
    );
  }
}

class ColorSilverGridWidget extends StatelessWidget {
  final List<Color> colors = const [
    Color(0xFF6FD4D4),
    Color(0xFF72A5F4),
    Color(0xFF9068F2),
    Color(0xFFE4B537),
    Color(0xFF90ADBF),
    Color(0xFF58C3E5),
    Color(0xFFE3C1A6),
    Color(0xFFFF9900),
  ];

  final List<String> text = const [
    'Справки\nи заявления',
    'Бережливое\nпроизврдство',
    'График\nотпусков',
    'Командировки',
    'Расписание\nавтобусов',
    'Режим работы',
    'Структура\nорганизации',
    'Интерактивная\nкарта помещений',
  ];

  final List<String> pathImages = const [
    'assets/images/note.png',
    'assets/images/thumbs_up.png',
    'assets/images/airplane.png',
    'assets/images/globe.png',
    'assets/images/bus.png',
    'assets/images/alarm.png',
    'assets/images/tree_structure.png',
    'assets/images/map.png',
  ];

  const ColorSilverGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.44,
        crossAxisSpacing: 13,
        mainAxisSpacing: 14,
      ),
      itemCount: colors.length,
      itemBuilder: (BuildContext context, int index) {
        // обычный контейнер
        return Container(
          // height: MediaQuery.of(context).size.height / 5.23,
          // width: MediaQuery.of(context).size.width / 2.27,
          decoration: BoxDecoration(
            color: colors[index],
            borderRadius: BorderRadius.circular(14),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                child: Text(
                  text[index],
                  softWrap: true,
                  maxLines: 2,
                  style: style,
                  textAlign: TextAlign.left,
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(pathImages[index])),
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(14)),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {},
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class ColorGridWidget extends StatelessWidget {
//   final List<Color> colors = const [
//     Color(0xFF6FD4D4),
//     Color(0xFF72A5F4),
//     Color(0xFF9068F2),
//     Color(0xFFE4B537),
//     Color(0xFF90ADBF),
//     Color(0xFF58C3E5),
//     Color(0xFFE3C1A6),
//     Color(0xFFFF9900),
//   ];

//   final List<String> text = const [
//     'Справки\nи заявления',
//     'Бережливое\nпроизврдство',
//     'График\nотпусков',
//     'Командировки',
//     'Расписание\nавтобусов',
//     'Режим работы',
//     'Структура\nорганизации',
//     'Интерактивная\nкарта помещений',
//   ];

//   final List<String> pathImages = const [
//     'assets/images/first/note.png',
//     'assets/images/first/thumbs_up.png',
//     'assets/images/first/airplane.png',
//     'assets/images/first/globe.png',
//     'assets/images/first/bus.png',
//     'assets/images/first/alarm.png',
//     'assets/images/first/tree_structure.png',
//     'assets/images/first/map.png',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       scrollDirection: Axis.vertical,
//       shrinkWrap: true,
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1.44,
//         crossAxisSpacing: 13,
//         mainAxisSpacing: 14,
//       ),
//       itemCount: colors.length,
//       itemBuilder: (BuildContext context, int index) {
//         // обычный контейнер
//         return Container(
//           // height: MediaQuery.of(context).size.height / 5.23,
//           // width: MediaQuery.of(context).size.width / 2.27,
//           decoration: BoxDecoration(
//             color: colors[index],
//             borderRadius: BorderRadius.circular(14),
//           ),
//           child: Stack(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 16.0, top: 16.0),
//                 child: Text(
//                   text[index],
//                   softWrap: true,
//                   maxLines: 2,
//                   style: style,
//                   textAlign: TextAlign.left,
//                 ),
//               ),
//               Align(
//                   alignment: Alignment.bottomRight,
//                   child: Image.asset('assets/images/bus.png')),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

class _AppBarFirstScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const _AppBarFirstScreen();

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Container(
            height: 34,
            width: 34,
            decoration: BoxDecoration(
              color: const Color.fromARGB(70, 255, 255, 255),
              borderRadius: BorderRadius.circular(17),
            ),
            child: MaterialButton(
              onPressed: () {},
              textColor: Colors.white,
              padding: const EdgeInsets.all(2),
              shape: const CircleBorder(),
              child: const Icon(
                Icons.search,
              ),
            ),
          ),
        ),
      ],
      leading: const Avatar(),
      title: const Row(
        children: [
          Text('Александр', style: StyleTextCustom.textAppBar),
          SizedBox(width: 4.0),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: SizedBox(
              height: 24,
              width: 24,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: ColorsForWidget.colorGreen,
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 16.0,
          ),
          child: Center(
            child: CircleAvatar(
              radius: 17,
              child: Image.asset(
                'assets/images/man.png',
                color: Colors.grey,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: ColorsForWidget.colorRed,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                '123',
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              )),
        ),
      ],
    );
  }
}
