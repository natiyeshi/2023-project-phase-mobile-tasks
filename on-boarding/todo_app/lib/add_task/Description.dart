import "package:flutter/material.dart";
import '../route/Route.dart' as route;
class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            padding: EdgeInsets.only(top: 15, left: 27, right: 0, bottom: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Text(
              'first i have to animate the logo and later prototyping my design, its very important',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.all(80),
              padding: EdgeInsets.all(0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 238, 111, 87),
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pushNamed(context,route.todoListPage);
                },
                child: const Text(
                  "Add Task",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
