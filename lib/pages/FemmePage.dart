import 'package:flutter/material.dart';
import 'package:modarakia/result.dart';
import 'package:modarakia/utils/constants.dart';
import 'package:modarakia/utils/utils.dart';

import 'genderPage.dart';

class FemmePage extends StatefulWidget {
  @override
  _FemmePageState createState() => _FemmePageState();
}

class _FemmePageState extends State<FemmePage> {
  int currentStep = 0; // Variable to keep track of the current step
  TextEditingController chestController = TextEditingController();
  TextEditingController waistController = TextEditingController();
  TextEditingController hipController = TextEditingController();
  String resultMessage = '';
  // final ValueNotifier<int> _button = ValueNotifier(0);

  // @override
  // void initState() {
  //   super.initState();
  //   TextEditingController chestController = TextEditingController();
  // }

  void calculateSize() {
    double chest = double.tryParse(chestController.text) ?? 0;
    double waist = double.tryParse(waistController.text) ?? 0;
    double hip = double.tryParse(hipController.text) ?? 0;

    int size = determineSize(chest, waist, hip);

    if (size != 0) {
      setState(() {
        resultMessage = "المقاس المناسب لك هو $size ";
      });
    } else {
      setState(() {
        resultMessage = 'لا يمكننا تحديد مقاسك باستخدام هذه القياسات';
      });
    }
  }

  int determineSize(double chest, double waist, double hip) {
    int sizeDuClient = 0;

    if (77 <= chest && chest < 80) {
      sizeDuClient = 34;
    } else if (80 <= chest && chest < 84) {
      sizeDuClient = 36;
    } else if (84 <= chest && chest < 88) {
      sizeDuClient = 38;
    } else if (88 <= chest && chest < 92) {
      sizeDuClient = 40;
    } else if (92 <= chest && chest < 96) {
      sizeDuClient = 42;
    } else if (96 <= chest && chest < 100) {
      sizeDuClient = 44;
    } else if (100 <= chest && chest < 104) {
      sizeDuClient = 46;
    } else if (104 <= chest && chest < 108) {
      sizeDuClient = 48;
    } else if (108 <= chest && chest < 112) {
      sizeDuClient = 50;
    } else if (112 <= chest && chest < 116) {
      sizeDuClient = 52;
    } else if (116 <= chest && chest < 120) {
      sizeDuClient = 54;
    } else if (120 <= chest && chest < 124) {
      sizeDuClient = 56;
    } else if (124 <= chest && chest < 128) {
      sizeDuClient = 58;
    }

    if (62 <= waist && waist < 64) {
      sizeDuClient = sizeDuClient > 34 ? sizeDuClient : 34;
    } else if (64 <= waist && waist < 66) {
      sizeDuClient = sizeDuClient > 36 ? sizeDuClient : 36;
    } else if (66 <= waist && waist < 70) {
      sizeDuClient = sizeDuClient > 38 ? sizeDuClient : 38;
    } else if (70 <= waist && waist < 74) {
      sizeDuClient = sizeDuClient > 40 ? sizeDuClient : 40;
    } else if (74 <= waist && waist < 78) {
      sizeDuClient = sizeDuClient > 42 ? sizeDuClient : 42;
    } else if (78 <= waist && waist < 82) {
      sizeDuClient = sizeDuClient > 44 ? sizeDuClient : 44;
    } else if (82 <= waist && waist < 86) {
      sizeDuClient = sizeDuClient > 46 ? sizeDuClient : 46;
    } else if (86 <= waist && waist < 92) {
      sizeDuClient = sizeDuClient > 48 ? sizeDuClient : 48;
    } else if (92 <= waist && waist < 98) {
      sizeDuClient = sizeDuClient > 50 ? sizeDuClient : 50;
    } else if (98 <= waist && waist < 104) {
      sizeDuClient = sizeDuClient > 52 ? sizeDuClient : 52;
    } else if (104 <= waist && waist < 110) {
      sizeDuClient = sizeDuClient > 54 ? sizeDuClient : 54;
    } else if (110 <= waist && waist < 116) {
      sizeDuClient = sizeDuClient > 56 ? sizeDuClient : 56;
    } else if (116 <= waist && waist < 122) {
      sizeDuClient = sizeDuClient > 58 ? sizeDuClient : 58;
    }

    // Determine the size based on hip measurement
    if (85 <= hip && hip < 88) {
      sizeDuClient = sizeDuClient > 34 ? sizeDuClient : 34;
    } else if (88 <= hip && hip < 92) {
      sizeDuClient = sizeDuClient > 36 ? sizeDuClient : 36;
    } else if (92 <= hip && hip < 96) {
      sizeDuClient = sizeDuClient > 38 ? sizeDuClient : 38;
    } else if (96 <= hip && hip < 100) {
      sizeDuClient = sizeDuClient > 40 ? sizeDuClient : 40;
    } else if (100 <= hip && hip < 104) {
      sizeDuClient = sizeDuClient > 42 ? sizeDuClient : 42;
    } else if (104 <= hip && hip < 108) {
      sizeDuClient = sizeDuClient > 44 ? sizeDuClient : 44;
    } else if (108 <= hip && hip < 112) {
      sizeDuClient = sizeDuClient > 46 ? sizeDuClient : 46;
    } else if (112 <= hip && hip < 118) {
      sizeDuClient = sizeDuClient > 48 ? sizeDuClient : 48;
    } else if (118 <= hip && hip < 124) {
      sizeDuClient = sizeDuClient > 50 ? sizeDuClient : 50;
    } else if (124 <= hip && hip < 130) {
      sizeDuClient = sizeDuClient > 52 ? sizeDuClient : 52;
    } else if (130 <= hip && hip < 136) {
      sizeDuClient = sizeDuClient > 54 ? sizeDuClient : 54;
    } else if (136 <= hip && hip < 142) {
      sizeDuClient = sizeDuClient > 56 ? sizeDuClient : 56;
    } else if (142 <= hip && hip < 148) {
      sizeDuClient = sizeDuClient > 58 ? sizeDuClient : 58;
    }

    return sizeDuClient;
  }

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
          'مقاس المرأة',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 4, 26),
        elevation: 8,
      ),
      body: Stepper(
        controlsBuilder: (context, details) {
          return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                    onPressed: details.onStepCancel,
                    child: InkWell(
                      highlightColor: const Color.fromARGB(255, 0, 0, 0),
                      splashColor: Colors.transparent,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.fastLinearToSlowEaseIn,
                        height: 50,
                        width: 115,
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
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      ),
                    )),
                TextButton(
                  onPressed: details.onStepContinue,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: MaterialButton(
                      onPressed: details.onStepContinue,
                      color: AppColor.primaryColor,
                      minWidth: 115,
                      height: 50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'التالي',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]);
        },
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepTapped: (step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepContinue: () {
          if (currentStep == 0 && chestController.text.isEmpty) {
            showSnackBar(
                'لم يتم إدخال قياس الصدر. يُرجى ملء هذا الحقل', context);
            chestController.text = '';
            return;
          }
          if (currentStep == 1 && waistController.text.isEmpty) {
            showSnackBar(
                'لم يتم إدخال قياس الخصر. يُرجى ملء هذا الحقل', context);
            waistController.text = '';
            return;
          }
          if (currentStep == 2 && hipController.text.isEmpty) {
            showSnackBar(
                'لم يتم إدخال قياس الورك. يُرجى ملء هذا الحقل', context);
            hipController.text = '';
            return;
          }
          if (currentStep == 0 && chestController.text.isNotEmpty) {
            if (double.tryParse(chestController.text)! < 77 ||
                double.tryParse(chestController.text)! > 128) {
              showSnackBar(
                  'هناك خطأ في قياس الصدر الذي أدخلته. يُرجى التأكد من إدخال قيمة صحيحة. ',
                  context);
              chestController.text = '';
              return;
            }
          }
          if (currentStep == 1 && waistController.text.isNotEmpty) {
            if (double.tryParse(waistController.text)! < 62 ||
                double.tryParse(waistController.text)! > 122) {
              showSnackBar(
                  'هناك خطأ في قياس الخصر الذي أدخلته. يُرجى التأكد من إدخال قيمة صحيحة. ',
                  context);
              waistController.text = '';
              return;
            }
          }
          if (currentStep == 2 && hipController.text.isNotEmpty) {
            if (double.tryParse(hipController.text)! < 85 ||
                double.tryParse(hipController.text)! > 148) {
              showSnackBar(
                  'هناك خطأ في قياس الورك الذي أدخلته. يُرجى التأكد من إدخال قيمة صحيحة. ',
                  context);
              hipController.text = '';
              return;
            }
          }
          if (currentStep < 2) {
            setState(() {
              currentStep += 1;
            });
          } else {
            calculateSize();
            double chest = double.tryParse(chestController.text) ?? 0;
            double waist = double.tryParse(waistController.text) ?? 0;
            double hip = double.tryParse(hipController.text) ?? 0;

            int chestResult = determineSize(chest, 0, 0);
            int waistResult = determineSize(0, waist, 0);
            int hipResult = determineSize(0, 0, hip);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Result(
                        resultMessage: resultMessage,
                        chestResult: chestResult,
                        hipResult: hipResult,
                        waistResult: waistResult,
                      )),
            );
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep -= 1;
            });
          } else {
            Navigator.pop(context);
          }
        },
        steps: [
          Step(
            title: const Text('الصدر'),
            content: Container(
              height: MediaQuery.of(context).size.height * .6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'أدخلي دوران صدرك ',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset('assets/images/chest.png'),
                  ),
                  TextFormField(
                    controller: chestController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintTextDirection: TextDirection.ltr,
                      contentPadding: EdgeInsets.symmetric(horizontal: 13),
                      labelText: 'دوران الصدر',
                      suffixText: '77-128',
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
                ],
              ),
            ),
          ),
          Step(
            title: const Text('الخصر'),
            content: Container(
              height: MediaQuery.of(context).size.height * .6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'أدخلي دوران خصرك',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 20,),
                  Container(
                    child: Image.asset('assets/images/midle.jpg'),
                  ),
                  TextFormField(
                    controller: waistController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: '62-122',
                      contentPadding: EdgeInsets.symmetric(horizontal: 13),
                      labelText: 'دوران الخصر',
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
                ],
              ),
            ),
          ),
          Step(
            title: const Text('الورك'),
            content: Container(
              height: MediaQuery.of(context).size.height * .6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    ' أدخلي دوران وركك',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 20,),
                  Container(
                    child: Image.asset('assets/images/waist.png'),
                  ),
                  TextFormField(
                    controller: hipController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      suffixText: '85-148',
                      contentPadding: EdgeInsets.symmetric(horizontal: 13),
                      labelText: 'دوران الورك',
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
