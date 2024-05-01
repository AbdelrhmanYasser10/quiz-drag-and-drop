import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  String data = "lizard";
  bool dragAccepted = false;

  String dataSecondValue = "cow"; // 2
  bool dragAcceptedForCow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(12.0),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DragTarget<String>(
                      builder: (context, candidateData, rejectedData) {
                        return SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            "assets/image/cow.png",
                            color: dragAcceptedForCow ? null : Colors.black,
                          ),
                        );
                      },
                      onWillAcceptWithDetails: (details) {
                        return details.data == dataSecondValue;
                      },
                      onAcceptWithDetails: (details) {
                        setState(() {
                          dragAcceptedForCow = true;
                        });
                      },
                    ),
                    DragTarget<String>(
                      builder: (context, candidateData, rejectedData) {
                        return SizedBox(
                          width: 120,
                          height: 120,
                          child: Image.asset(
                            "assets/image/lizard.png",
                            color: dragAccepted ? null : Colors.black,
                          ),
                        );
                      },
                      onWillAcceptWithDetails: (details) {
                        return details.data == data;
                      },
                      onAcceptWithDetails: (details) {
                        setState(() {
                          dragAccepted = true;
                        });
                      },
                    ),
                  ],
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Draggable<String>(
                      data: data,
                      feedback: SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          "assets/image/lizard.png",
                        ),
                      ),
                      childWhenDragging:SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          "assets/image/lizard.png",
                          color: Colors.grey,
                        ),
                      ),
                      child:dragAccepted ? const SizedBox(): SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          "assets/image/lizard.png",
                        ),
                      ),
                  ),
                  Draggable<String>(
                      data: dataSecondValue,
                      feedback: SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          "assets/image/cow.png",
                        ),
                      ),
                      childWhenDragging:SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          "assets/image/cow.png",
                          color: Colors.grey,
                        ),
                      ),
                      child:dragAcceptedForCow? const SizedBox():SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset(
                          "assets/image/cow.png",
                        ),
                      ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
