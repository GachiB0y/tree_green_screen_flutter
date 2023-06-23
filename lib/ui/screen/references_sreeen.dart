import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/theme/colors_theme.dart';
import 'package:tree_green_screen_flutter/theme/style_text.dart';
import 'package:tree_green_screen_flutter/ui/component/dicit_input_widget.dart';

class ReferencesScreen extends StatelessWidget {
  const ReferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: ColorsForWidget.colorGreen,
      appBar: AppBar(
        title: const Text(
          'Справки и заявления',
          style: StyleTextCustom.textAppBar,
        ),
        backgroundColor: ColorsForWidget.colorGreen,
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 20),
                child: Text(
                  'История заявок',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 11.0),
                child: Container(
                  height: 44,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsForWidget.colorGreen,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          const _AlertDialogWidget(),
                    ),
                    child: const Text(
                      'СОЗДАТЬ ЗАЯВКУ',
                      style: style,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AlertDialogWidget extends StatelessWidget {
  const _AlertDialogWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    var patternOne = "2022-09-26";
    var patternTwo = "2022-10-24";
    DateTime dateOne = DateTime.parse(patternOne);
    DateTime dateTwo = DateTime.parse(patternTwo);
    String dateStringOne = '${dateOne.day}.${dateOne.month}.${dateOne.year}';
    String dateStringTwo = '${dateTwo.day}.${dateTwo.month}.${dateTwo.year}';
    const styleBlack = TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
    const styleGrey = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 24.0, left: 24.0, right: 24.0, bottom: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Заявление на отпуск',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Количество календарных дней отпуска',
                    style: styleGrey,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  const Text(
                    '28',
                    style: styleBlack,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Text(
                    'Даты отпуска',
                    style: styleGrey,
                  ),
                  Text(
                    '$dateStringOne - $dateStringTwo',
                    style: styleBlack,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Введите шестизначный код',
                    style: styleGrey,
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  DigitInputWidget(length: 6, controller: controller),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    height: 44,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorsForWidget.colorForButtomCancel,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'ОТМЕНА',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
