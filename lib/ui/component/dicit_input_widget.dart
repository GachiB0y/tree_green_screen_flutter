import 'package:flutter/material.dart';

class DigitInputWidget extends StatefulWidget {
  final int length;
  final TextEditingController controller;

  DigitInputWidget({required this.length, required this.controller});

  @override
  _DigitInputWidgetState createState() => _DigitInputWidgetState();
}

class _DigitInputWidgetState extends State<DigitInputWidget> {
  List<String> digits = [];

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      String text = widget.controller.text;
      if (text.length <= widget.length) {
        setState(() {
          digits = text.split("");
        });
      } else {
        widget.controller.text = widget.controller.text.substring(0, widget.length);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

   return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          const double numberSize = 32.0;
          final boxWidth = constraints.constrainWidth().toDouble();
          final  numberWidth = 32 * widget.length.toInt();
          final padding =(boxWidth - numberWidth)/ (widget.length.toInt() - 1);
          return SizedBox(
            width: double.infinity,
            height: 64,
            child: Stack(
              children: [
                for (int i = 0; i < widget.length; i++)
                  Padding(
                    padding: EdgeInsets.only(left: i * (padding + numberSize), top: 8),
                    child: SizedBox(
                      width: numberSize,
                      height: numberSize,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Center(
                          child: Text(
                            digits.length > i ? digits[i] : "",
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ),
                Positioned.fill(
                  child: TextField(
                    controller: widget.controller,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(fontSize: 0),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

