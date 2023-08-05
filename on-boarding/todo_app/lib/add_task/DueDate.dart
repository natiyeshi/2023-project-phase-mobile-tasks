import 'package:flutter/material.dart';

class DueDate extends StatefulWidget {
  const DueDate({super.key});

  @override
  State<DueDate> createState() => _DueDateState();
}

class _DueDateState extends State<DueDate> {
   void  _showDate () {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8),
            child: Text(
              "Due Date",
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 238, 111, 87),
                  fontWeight: FontWeight.w400),
            ),
          ),
           Container(
          padding: const EdgeInsets.only(left: 25,right:25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child:TextField(
            readOnly: true,
            onTap: (){
              setState(() {
                  _showDate();
                });
            },
            controller: TextEditingController(text:"April 29, 2023 12:30"),
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
          // Container(
          //   padding: const EdgeInsets.only(left: 12),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.all(Radius.circular(10)),
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.grey.withOpacity(0.5),
          //         spreadRadius: 2,
          //         blurRadius: 5,
          //         offset: Offset(0, 3),
          //       ),
          //     ],
          //   ),
          //   child: MaterialButton(
          //     minWidth: double.infinity,
          //     onPressed: () {
          //       setState(() {
          //         _showDate();
          //       });
          //     },
          //     child: const Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           "April 29, 2023 12:30 am",
          //           style: TextStyle(
          //             fontSize: 18,
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(right: 20),
          //           child: Icon(
          //             Icons.date_range,
          //             color: Colors.red,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
