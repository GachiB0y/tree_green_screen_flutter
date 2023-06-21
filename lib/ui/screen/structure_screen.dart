import 'package:flutter/material.dart';

class StructureScreen extends StatelessWidget {
  const StructureScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> name =[
      "Малыхин Дмитрий",
      "Смирнов Александр",
      "Шалаев Алексей",
      "Климов Алексей",
    ];
    const style =  TextStyle(color: Colors.white);
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title:const Text('Структура организации', style: style,),backgroundColor: Colors.green,),
      body: ClipRRect(
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(top:8.0),
                      child: _StructRowWidget(
                        isGeneral: true,
                      ),
                    ),
                    const Divider(height: 3.0,),
                    const SizedBox(height: 10.0,),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount:  4,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: _StructRowWidget(
                            index: index,
                            isGeneral: false,
                            name: name,
                          ),
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


class _StructRowWidget extends StatelessWidget {
  final int? index;
  final List<String>? name;
  final bool isGeneral;

  const _StructRowWidget({Key? key,this.index, required this.isGeneral, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 16);
    return Column(
      children: [
        Row(children: [
          isGeneral ? Container(
            padding: const EdgeInsets.all(4),
            width: 35,
            height: 35,
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Image.asset('assets/images/man_green.png'),
          ) :
          const SizedBox(
           width: 35,
           height: 35,
           child:  CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.green),
            ),
         ),
          const SizedBox(width: 10,),
          name == null ? const Text("Генеральный директор",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),) :
          Text(name![index!],style: style,),
        ],),
        isGeneral ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              leading: const Text('Подразделения',style: style),
              trailing:const Icon(Icons.arrow_drop_down),
              onTap: () {
              },
            ),
          ),
        )
            :Padding(
              padding: const EdgeInsets.only(top:8.0,left: 20.0,right: 8.0,bottom: 8.0),
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Text('Подразделения',style: style),
                    trailing:const Icon(Icons.arrow_drop_down),
                    onTap: () {
                    },
                  ),
          ),
        ),
      ],
    );
  }
}

