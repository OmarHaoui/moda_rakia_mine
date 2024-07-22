import 'package:flutter/material.dart';
import 'package:modarakia/main.dart';

class ResultEnfant extends StatefulWidget {
  final String resultMessage;
  final int stature;

  const ResultEnfant(
      {super.key, required this.stature, required this.resultMessage});

  @override
  State<ResultEnfant> createState() => _ResultEnfantState();
}

class _ResultEnfantState extends State<ResultEnfant> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'النتيجة',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 4, 26),
        elevation: 8,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/button.png',
                          width: 25,
                        ),
                        Text(' الطول ${widget.stature}')
                      ],
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 60),
            Text(
              widget.resultMessage,
              style: widget.resultMessage ==
                      'لا يمكننا تحديد مقاس الطفل باستخدام هذه القياسات'
                  ? TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 228, 49, 49))
                  : TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
            ),
            SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromARGB(255, 139, 138, 138),
                minWidth: 50,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'رجوع',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
