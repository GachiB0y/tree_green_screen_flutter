import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/theme/colors_theme.dart';

class StructureScreen extends StatelessWidget {
  const StructureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> name = [
      "Малыхин Дмитрий",
      "Смирнов Александр",
      "Шалаев Алексей",
      "Климов Алексей",
    ];
    const style = TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text(
          'Структура организации',
          style: style,
        ),
        backgroundColor: Colors.green,
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: SingleChildScrollView(
          child: Container(
            // height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 27.0, left: 16.0, right: 16.0, bottom: 17.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: ColorsForWidget.colorForBackgroundStruct,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _StructRowWidget(
                      isGeneral: true,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const Divider(
                      height: 1.0,
                    ),
                    const SizedBox(
                      height: 7.5,
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return _StructRowWidget(
                          index: index,
                          isGeneral: false,
                          name: name,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StructRowWidget extends StatefulWidget {
  final int? index;
  final List<String>? name;
  final bool isGeneral;

  const _StructRowWidget(
      {Key? key, this.index, required this.isGeneral, this.name})
      : super(key: key);

  @override
  State<_StructRowWidget> createState() => _StructRowWidgetState();
}

class _StructRowWidgetState extends State<_StructRowWidget> {
  bool dropdownOpen = false;
  String dropdownvalue = 'Item 1';
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 16);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            widget.isGeneral
                ? Container(
                    padding: const EdgeInsets.all(9),
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/images/general.png'),
                  )
                : Container(
                    padding: const EdgeInsets.all(9),
                    width: 38,
                    height: 38,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Image.asset('assets/images/user.png'),
                  ),
            const SizedBox(
              width: 16,
            ),
            widget.name == null
                ? const Text(
                    "Генеральный директор",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )
                : Text(
                    widget.name![widget.index!],
                    style: style,
                  ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        widget.isGeneral
            ? Container(
                padding:
                    const EdgeInsets.only(left: 16.0, bottom: 16.0, top: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: const Text('Подразделения', style: style),
                      trailing: dropdownOpen == true
                          ? const RotatedBox(
                              quarterTurns: 1,
                              child: Icon(Icons.arrow_back_ios))
                          : const RotatedBox(
                              quarterTurns: -1,
                              child: Icon(Icons.arrow_back_ios)),
                      onTap: () {
                        setState(() {
                          dropdownOpen = !dropdownOpen;
                        });
                      },
                    ),
                    dropdownOpen == true
                        ? ListView.builder(
                            itemCount: items.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 17.0),
                                child: SizedBox(
                                  height: 18,
                                  child: Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Colors.green,
                                        radius: 6.5,
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(items[index]),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : const SizedBox.shrink(),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 21.0, bottom: 16.0),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 16.0, bottom: 16.0, top: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: const Text('Подразделения', style: style),
                        trailing: dropdownOpen == true
                            ? const RotatedBox(
                                quarterTurns: 1,
                                child: Icon(Icons.arrow_back_ios))
                            : const RotatedBox(
                                quarterTurns: -1,
                                child: Icon(Icons.arrow_back_ios)),
                        onTap: () {
                          setState(() {
                            dropdownOpen = !dropdownOpen;
                          });
                        },
                      ),
                      dropdownOpen == true
                          ? ListView.builder(
                              itemCount: items.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 17.0),
                                  child: SizedBox(
                                    height: 18,
                                    child: Row(
                                      children: [
                                        const CircleAvatar(
                                          backgroundColor: Colors.green,
                                          radius: 6.5,
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(items[index]),
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
