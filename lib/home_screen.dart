import 'package:flutter/material.dart';

import 'widgets/backgroundShape_left.dart';
import 'widgets/backgroundShape_right.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final weightcontroller = TextEditingController();
  final heightcontroller = TextEditingController();

  double resultBMI = 0;
  String resultText = '';
  double widthGood = 100;
  double widthBad = 100;
  bool submited = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 20, 24, 44),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          ' تو چنده؟ BMI',
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: weightcontroller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'وزن',
                        hintStyle: TextStyle(
                          color: Colors.deepOrangeAccent.withOpacity(0.7),
                          fontSize: 20,
                        )),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: heightcontroller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'قد',
                        hintStyle: TextStyle(
                          color: Colors.deepOrangeAccent.withOpacity(0.7),
                          fontSize: 20,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            InkWell(
              onTap: () {
                final weight = double.parse(weightcontroller.text);
                final height = double.parse(heightcontroller.text);
                submited = true;

                setState(() {
                  resultBMI = weight / (height * height);
                  if (resultBMI > 25) {
                    widthBad = 300;
                    widthGood = 50;
                    resultText = 'شما اضافه وزن دارید';
                  } else if (resultBMI >= 18.5 && resultBMI <= 25) {
                    widthGood = 300;
                    widthBad = 50;
                    resultText = 'وزن شما نرمال است';
                  } else {
                    widthBad = 300;
                    widthGood = 50;
                    resultText = 'وزن شما کم‌تر از حد نرمال است';
                  }
                });
                print(heightcontroller.text);
              },
              child: Text(
                '! محاسبه کن',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(height: 40),
            Text(
              '${resultBMI.toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow),
            ),
            Text(
              '$resultText',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 50),
            RightShape(width: widthBad),
            SizedBox(height: 10),
            LeftShape(width: widthGood),
            SizedBox(height: 100),
            if (submited)
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    resultBMI = 0.00;
                    resultText = '';
                    widthBad = 100;
                    widthGood = 100;
                    weightcontroller.clear();
                    heightcontroller.clear();
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 112, 34, 34),
                  minimumSize: Size(200, 40),
                ),
                child: Text(
                  'دوباره محاسبه کن',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
