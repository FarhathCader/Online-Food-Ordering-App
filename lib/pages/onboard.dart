// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/signup.dart';
// import 'package:flutter_application_1/widget/content_model.dart';
// import 'package:flutter_application_1/widget/widget_support.dart';

// class Onboard extends StatefulWidget {
//   const Onboard({super.key});

//   @override
//   State<Onboard> createState() => _OnboardState();
// }

// class _OnboardState extends State<Onboard> {
//   int currentIndex = 0;
//   late PageController _controller;

//   @override
//   void initState() {
//     _controller = PageController(initialPage: 0);

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           // Logo Image
//           Container(
//             padding:
//                 EdgeInsets.only(top: 50.0), // Adjust the top padding as needed
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(35),
//               child: Image.asset(
//                 'images/logo.png', // Replace with the actual path to your logo image
//                 height: 40.0, // Adjust the height of the logo as needed
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: PageView.builder(
//                     controller: _controller,
//                     itemCount: contents.length,
//                     onPageChanged: (int index) {
//                       setState(() {
//                         currentIndex = index;
//                       });
//                     },
//                     itemBuilder: (_, i) {
//                       return Padding(
//                         padding:
//                             EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Expanded(
//                               child: Image.asset(
//                                 contents[i].image,
//                                 width: MediaQuery.of(context).size.width,
//                                 fit: BoxFit.fill,
//                               ),
//                             ),
//                             SizedBox(
//                               height: 40.0,
//                             ),
//                             Text(
//                               contents[i].title,
//                               style: AppWidget.HeadLineTextFeildStyle(),
//                             ),
//                             SizedBox(
//                               height: 20.0,
//                             ),
//                             Text(
//                               contents[i].description,
//                               style: AppWidget.LightTextFeildStyle(),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Container(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       contents.length,
//                       (index) => buildDot(index, context),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (currentIndex == contents.length - 1) {
//                       Navigator.pushReplacement(context,
//                           MaterialPageRoute(builder: (context) => SignUp()));
//                     }
//                     _controller.nextPage(
//                       duration: Duration(milliseconds: 100),
//                       curve: Curves.bounceIn,
//                     );
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(20)),
//                     height: 60,
//                     margin: EdgeInsets.all(40),
//                     width: double.infinity,
//                     child: Center(
//                       child: Text(
//                         currentIndex == contents.length - 1 ? "Start" : "Next",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container buildDot(int index, BuildContext context) {
//     return Container(
//       height: 10.0,
//       width: currentIndex == index ? 18 : 7,
//       margin: EdgeInsets.only(right: 5),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6), color: Colors.black38),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/signup.dart';
import 'package:flutter_application_1/widget/content_model.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Updated background color

      body: Column(
        children: [
          // Logo Image
          Container(
            padding: EdgeInsets.only(top: 50.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: Image.asset(
                'images/logo.png',
                height: 40.0,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: contents.length,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Padding(
                        padding:
                            EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  contents[i].image,
                                  width: MediaQuery.of(context).size.width,
                                  fit: BoxFit.cover,
                                  // borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            Text(
                              contents[i].title,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              contents[i].description,
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16.0,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                      (index) => buildDot(index, context),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    }
                    _controller.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    height: 60,
                    margin: EdgeInsets.all(40),
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        currentIndex == contents.length - 1 ? "Start" : "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.blue,
      ),
    );
  }
}
