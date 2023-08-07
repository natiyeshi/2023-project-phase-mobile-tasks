import 'package:flutter/material.dart';
import "../route/Route.dart" as route;

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 238, 111, 87),
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 100),
              child: Image.asset("images/image1.png"),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Container(
                width: 400,
                height: 100,
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.only(bottom: 90),
                child: SizedBox(
                  width: 256,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, route.todoListPage),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 12, 140, 233),
                    ),
                    child: const Text("Get started",
                        style: TextStyle(fontSize: 19)),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
