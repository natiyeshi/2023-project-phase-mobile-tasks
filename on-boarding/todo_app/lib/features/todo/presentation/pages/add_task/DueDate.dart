import 'package:flutter/material.dart';

class DueDate extends StatefulWidget {
  const DueDate({super.key, required this.showDate});
  final dynamic showDate;
  @override
  State<DueDate> createState() => _DueDateState();
}

class _DueDateState extends State<DueDate> {
  DateTime? date;
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
            padding: const EdgeInsets.only(left: 25, right: 25),
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
            child: TextField(
              readOnly: true,
              key:  const Key('dateKey'),

              onTap: () {
                setState(()  async{
                  date = await widget.showDate();
                });
              },
              controller: TextEditingController(
                  text: date != null
                      ? '${date!.month} ${date!.weekday}, ${date!.year}'
                      : "choose date"),
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelStyle: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
