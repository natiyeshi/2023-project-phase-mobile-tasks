import "package:flutter/material.dart";

class TaskName extends StatefulWidget {
  const TaskName({super.key, required this.onchange});
  final dynamic onchange;

  @override
  State<TaskName> createState() => _TaskNameState();
}

class _TaskNameState extends State<TaskName> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8),
          child: Text(
            "Main task name",
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
            key: const Key("titleKey"),
            onChanged: widget.onchange,
            decoration: const InputDecoration(
              hintText: "task name",
              border: InputBorder.none,
              labelStyle: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
