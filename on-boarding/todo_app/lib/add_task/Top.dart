import "package:flutter/material.dart";

class Top extends StatefulWidget {
  const Top({super.key});

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, top: 20),
            child: const Icon(
              Icons.navigate_before,
              size: 45,
              color: const Color.fromARGB(255, 238, 111, 87),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, top: 20),
            child: const Icon(
              Icons.more_vert,
              size: 40,
              color: Color.fromARGB(255, 54, 54, 54),
            ),
          ),
        ],
      ),
    );
  }
}
