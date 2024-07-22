import 'package:flutter/material.dart';
import 'package:modarakia/main.dart';
import 'package:modarakia/pages/genderPage.dart';
import 'package:modarakia/result_enfant.dart';
import 'package:modarakia/utils/utils.dart';

import '../utils/constants.dart';

class EnfantPage extends StatefulWidget {
  const EnfantPage({super.key});

  @override
  State<EnfantPage> createState() => _EnfantPageState();
}

class _EnfantPageState extends State<EnfantPage> {
  TextEditingController statureController = TextEditingController();
  String resultMessage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GenderPage(),
              ),
            );
          },
        ),
        title: const Text(
          'مقاس الطفل',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primaryColor,
        elevation: 8,
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width * .9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'أدخل طول الطفل',
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: Image.asset('assets/images/stature.jpg'),
              ),
              TextFormField(
                controller: statureController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  suffixText: '82-164',
                  contentPadding: EdgeInsets.symmetric(horizontal: 13),
                  labelText: 'طول الطفل',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 92, 91, 91),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    letterSpacing: 0.8,
                    height: 1.5,
                    decoration: TextDecoration.none,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 29, 28, 28),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: InkWell(
                      highlightColor: const Color.fromARGB(255, 0, 0, 0),
                      splashColor: Colors.transparent,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 189, 187, 187),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'رجوع',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: MaterialButton(
                        onPressed: () {
                          int commercialHeight = 0;
                          int age = 0;
                          int stature =
                              int.tryParse(statureController.text) ?? 0;
                          if (statureController.text.isEmpty) {
                            showSnackBar(
                                'لم يتم إدخال قياس طول الطفل. يُرجى ملء هذا الحقل',
                                context);
                          }
                          if (stature == 0 || stature > 164 || stature < 82) {
                            showSnackBar(
                                'هناك خطأ في قياس طول الطفل الذي أدخلته. يُرجى التأكد من إدخال قيمة صحيحة',
                                context);
                            setState(() {
                              statureController.text = '';
                            });

                            return;
                          }
                          (commercialHeight, age) =
                              calaculateComercialHightAndAge(stature);

                          if (commercialHeight != 0) {
                            setState(() {
                              resultMessage =
                                  "المقاس التجاري $commercialHeight والعمر $age";
                            });
                          } else {
                            setState(
                              () {
                                resultMessage =
                                    'لا يمكننا تحديد مقاس الطفل باستخدام هذه القياسات';
                              },
                            );
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultEnfant(
                                resultMessage: resultMessage,
                                stature: stature.toInt(),
                              ),
                            ),
                          );
                        },
                        color: AppColor.primaryColor,
                        minWidth: 120,
                        height: 50,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        padding: const EdgeInsets.all(0),
                        child: const Row(
                          children: [
                            Text(
                              'التالي',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  (int commercialHeight, int age) calaculateComercialHightAndAge(int height) {
    int age = 0;
    int commercialHeight = 0;

    if (height >= 82 && height <= 89) {
      commercialHeight = 86;
      age = 2;
    } else if (height >= 90 && height <= 97) {
      commercialHeight = 94;
      age = 3;
    } else if (height >= 98 && height <= 105) {
      commercialHeight = 102;
      age = 4;
    } else if (height >= 106 && height <= 110) {
      commercialHeight = 108;
      age = 5;
    } else if (height >= 111 && height <= 116) {
      commercialHeight = 114;
      age = 6;
    } else if (height >= 117 && height <= 128) {
      commercialHeight = 126;
      age = 8;
    } else if (height >= 129 && height <= 140) {
      commercialHeight = 138;
      age = 10;
    } else if (height >= 141 && height <= 152) {
      commercialHeight = 150;
      age = 12;
    } else if (height >= 153 && height <= 158) {
      commercialHeight = 156;
      age = 14;
    } else if (height >= 159 && height <= 164) {
      commercialHeight = 162;
      age = 16;
    }

    return (commercialHeight, age);
  }
}
