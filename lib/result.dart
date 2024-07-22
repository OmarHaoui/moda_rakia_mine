import 'package:flutter/material.dart';
import 'package:modarakia/main.dart';


class Result extends StatefulWidget {
  final String resultMessage;
  final int chestResult;
  final int waistResult;
  final int hipResult;
  const Result(
      {super.key,
      required this.resultMessage,
      required this.chestResult,
      required this.waistResult,
      required this.hipResult});

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'النتيجة',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 4, 26),
        elevation: 8,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
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
                        Text('مقاس خصرك ${widget.waistResult}')
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/button.png',
                          width: 25,
                        ),
                        Text('مقاس وركك ${widget.hipResult}')
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/button.png',
                          width: 25,
                        ),
                        Text('مقاس صدرك ${widget.chestResult}')
                      ],
                    ),
                  ),
                 
                ],
              ),
            ]),
            const SizedBox(height: 60),
            Text(
              widget.resultMessage,
              style: widget.resultMessage ==
                      'لا يمكننا تحديد مقاسك باستخدام هذه القياسات'
                  ? const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 228, 49, 49))
                  : const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(16),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: const Color.fromARGB(255, 139, 138, 138),
                minWidth: 50,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                padding: const EdgeInsets.all(0),
                child: const Row(
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
