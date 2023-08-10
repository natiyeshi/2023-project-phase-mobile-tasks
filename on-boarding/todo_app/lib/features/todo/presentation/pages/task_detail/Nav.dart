import 'package:flutter/material.dart';

class Nav extends StatelessWidget {
  
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 23),
      color: Colors.white,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              Icons.navigate_before,
              size: 45,
              color: Color.fromARGB(255, 238, 111, 87),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 10),
            child: const Text(
              "Task Detail",
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          const Icon(
            Icons.more_vert,
            size: 40,
            color: Color.fromARGB(255, 54, 54, 54),
          ),
        ],
      ),
    );
  }
}
