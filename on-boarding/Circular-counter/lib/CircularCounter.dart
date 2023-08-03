import 'package:flutter/material.dart';

class CircularCounter extends StatefulWidget {
  const CircularCounter({super.key});

  @override
  State<CircularCounter> createState() => _CircularCounterState();
}

class _CircularCounterState extends State<CircularCounter> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Circular Counter"),
          backgroundColor: const Color.fromARGB(255, 29, 95, 75),
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                num.toString(),
                style: const TextStyle(
                  fontSize: 60,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            num = num <= 0 ? 10 : num - 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: num == 0
                              ? const Color.fromARGB(255, 159, 161, 161)
                              : const Color.fromARGB(255, 29, 95, 75),
                          padding:const EdgeInsets.all(10),

                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.remove),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text("Decreament",
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            num = num >= 10 ? 0 : num + 1;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: num == 10
                              ? const Color.fromARGB(255, 159, 161, 161)
                              : const Color.fromARGB(255, 29, 95, 75),
                          padding:const EdgeInsets.all(10),
                          
                        ),
                        child: const Row(
                          children: [
                            Icon(Icons.add),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text("Decreament",
                                  style: TextStyle(
                                    fontSize: 17,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
