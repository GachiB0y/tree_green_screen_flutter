import 'package:flutter/material.dart';
import 'package:tree_green_screen_flutter/ui/component/dicit_input_widget.dart';

class ReferencesScreen extends StatelessWidget {
  const ReferencesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title:const Text('Справки и заявления', style: style,),backgroundColor: Colors.green,),
      body: ClipRRect(
        borderRadius:const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text('История заявок',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(padding:const EdgeInsets.all(15.0),
                child:   Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed:
                          () => showDialog(
                        context: context,
                        builder: (BuildContext context) => _AlertDialogWidget(),
                      ),

                    child: const Text('Создать заявку',style: style,),
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
    const styleBlack =  TextStyle(fontWeight: FontWeight.w500);
    const styleGrey=  TextStyle(color: Colors.grey);
    return
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(20.0)), //this right here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              // height: MediaQuery.of(context).size.height * 0.54,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text('Заявление на отпуск',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                   const SizedBox(height: 20,),
                   const Text('Количество календарных дней отпуска',style: styleGrey,),
                    const SizedBox(height: 5,),
                    const Text('28',style:styleBlack,),
                    const SizedBox(height: 20,),
                    const Text('Даты отпуска',style: styleGrey,),
                    Text('$dateStringOne - $dateStringTwo',style:styleBlack,),
                    const SizedBox(height: 20,),
                    const Text('Введите шестизначный код',style: styleGrey,),
                    DigitInputWidget(length: 6, controller: controller),
                    const SizedBox(height: 10,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('ОТМЕНА',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),),
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

