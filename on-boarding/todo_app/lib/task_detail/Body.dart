import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(left: 35, right: 35, top: 30),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              "Titlse",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 235, 235),
                borderRadius: BorderRadius.all(Radius.circular(7))),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15),
            height: 60,
            child: const Text(
              "Ui/Ux App Design",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 14, bottom: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              "Descriptions",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 235, 235),
                borderRadius: BorderRadius.all(Radius.circular(7))),
            // alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            height: 150,
            child: const Text(
              "First i have to animate the logo and prototyping my design. its very important",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 14, bottom: 10),
            alignment: Alignment.topLeft,
            child: const Text(
              "Deadline",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 236, 235, 235),
                borderRadius: BorderRadius.all(Radius.circular(7))),
            padding: const EdgeInsets.all(15),
            height: 50,
            width: double.infinity,
            child: const Text(
              "April 29, 2023",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
