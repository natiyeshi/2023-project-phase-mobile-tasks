import "package:flutter/material.dart";

class Description extends StatefulWidget {
  const Description({super.key, required this.onchange});
  final dynamic onchange;

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('descKey'),
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 15, right: 8, bottom: 8),
            child: Text(
              "Description",
              style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 238, 111, 87),
                  fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            height: 100,
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
      ),
    );
  }
}
