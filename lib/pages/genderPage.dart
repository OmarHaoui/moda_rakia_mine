import 'package:flutter/material.dart';
import 'package:modarakia/utils/constants.dart';
import 'package:modarakia/utils/widgets.dart';

class GenderPage extends StatefulWidget {
  const GenderPage({super.key});

  @override
  State<GenderPage> createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          '',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shadowColor: Colors.black,
        backgroundColor: AppColor.primaryColor,
        elevation: 8,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'اختر المناسب',
                style: TextStyle(
                  fontSize: 25,
                  color: AppColor.primaryColor,
                ),
              ),
              const SizedBox(height: 30),
              defaultButtton(
                onPressed: () {
                  Navigator.pushNamed(context, '/femme');
                },
                childText: 'امرأة',
                halfWidth: (MediaQuery.of(context).size.width * .6) / 2.5,
                halfHeight: 8,
              ),
              const SizedBox(
                height: 20,
              ),
              defaultButtton(
                onPressed: () {
                  Navigator.pushNamed(context, '/enfant');
                },
                childText: 'طفل',
                halfWidth: (MediaQuery.of(context).size.width * .6) / 2.5,
                halfHeight: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
