import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/service/database.dart';
import 'package:flutter_application_1/service/shared_pref.dart';
import 'package:flutter_application_1/widget/widget_support.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String? id, wallet;
  int total = 0, amount2 = 0;

  void startTimer() {
    Timer(Duration(seconds: 3), () {
      amount2 = total;
      setState(() {});
    });
  }

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    wallet = await SharedPreferenceHelper().getUserWallet();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    foodStream = await DatabaseMethods().getFoodCart(id!);
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    startTimer();
    super.initState();
  }

  Stream? foodStream;

  // Widget foodCart() {
  //   return StreamBuilder(
  //       stream: foodStream,
  //       builder: (context, AsyncSnapshot snapshot) {
  //         return snapshot.hasData
  //             ? ListView.builder(
  //                 padding: EdgeInsets.zero,
  //                 itemCount: snapshot.data.docs.length,
  //                 shrinkWrap: true,
  //                 scrollDirection: Axis.vertical,
  //                 itemBuilder: (context, index) {
  //                   DocumentSnapshot ds = snapshot.data.docs[index];
  //                   total = total + int.parse(ds["Total"]);
  //                   return Container(
  //                     margin: EdgeInsets.only(
  //                         left: 20.0, right: 20.0, bottom: 10.0),
  //                     child: Material(
  //                       elevation: 5.0,
  //                       borderRadius: BorderRadius.circular(10),
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                             borderRadius: BorderRadius.circular(10)),
  //                         padding: EdgeInsets.all(10),
  //                         child: Row(
  //                           children: [
  //                             Container(
  //                               height: 20,
  //                               width: 20,
  //                               decoration: BoxDecoration(
  //                                   border: Border.all(),
  //                                   borderRadius: BorderRadius.circular(2)),
  //                               child: Center(child: Text(ds["Quantity"])),
  //                             ),
  //                             SizedBox(
  //                               width: 20.0,
  //                             ),
  //                             ClipRRect(
  //                                 borderRadius: BorderRadius.circular(60),
  //                                 child: Image.network(
  //                                   ds["Image"],
  //                                   height: 60,
  //                                   width: 60,
  //                                   fit: BoxFit.cover,
  //                                 )),
  //                             SizedBox(
  //                               width: 20.0,
  //                             ),
  //                             Column(
  //                               children: [
  //                                 FittedBox(
  //                                   child: Text(
  //                                     ds["Name"],
  //                                     style: AppWidget.semiBoldTextFeildStyle(),
  //                                   ),
  //                                 ),
  //                                 FittedBox(
  //                                   child: Text(
  //                                     "Rs " + ds["Total"],
  //                                     style: AppWidget.semiBoldTextFeildStyle(),
  //                                   ),
  //                                 )
  //                               ],
  //                             ),
  //                             Spacer(), // Adds space between item details and delete button
  //                             GestureDetector(
  //                               onTap: () async {
  //                                 // Delete item from the cart
  //                                 await DatabaseMethods()
  //                                     .deleteFoodFromCart(id!, ds.id);
  //                                 print("Hello");
  //                                 setState(() {
  //                                   total = total - int.parse(ds["Total"]);
  //                                 });
  //                               },
  //                               child: Container(
  //                                 padding: EdgeInsets.all(8),
  //                                 decoration: BoxDecoration(
  //                                   color: Colors.red,
  //                                   borderRadius: BorderRadius.circular(5),
  //                                 ),
  //                                 child: Icon(
  //                                   Icons.delete,
  //                                   color: Colors.white,
  //                                 ),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ),
  //                   );
  //                 })
  //             : CircularProgressIndicator();
  //       });
  // }
  Widget foodCart() {
    return StreamBuilder(
      stream: foodStream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  total = total + int.parse(ds["Total"]);
                  return Container(
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 10.0,
                    ),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(child: Text(ds["Quantity"])),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.network(
                                    ds["Image"],
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  children: [
                                    FittedBox(
                                      child: Text(
                                        ds["Name"],
                                        style:
                                            AppWidget.semiBoldTextFeildStyle2(),
                                      ),
                                    ),
                                    FittedBox(
                                      child: Text(
                                        "Rs " + ds["Total"],
                                        style:
                                            AppWidget.semiBoldTextFeildStyle2(),
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(), // Adds space between item details and delete button
                              ],
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () async {
                                  // Delete item from the cart
                                  await DatabaseMethods()
                                      .deleteFoodFromCart(id!, ds.id);

                                  setState(() {
                                    total = amount2 - int.parse(ds["Total"]);
                                    amount2 = total;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
                elevation: 2.0,
                child: Container(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Center(
                        child: Text(
                      "Food Cart",
                      style: AppWidget.HeadLineTextFeildStyle(),
                    )))),
            SizedBox(
              height: 20.0,
            ),
            Container(
                height: MediaQuery.of(context).size.height / 2,
                child: foodCart()),
            Spacer(),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total Price",
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                  Text(
                    "Rs " + total.toString(),
                    style: AppWidget.semiBoldTextFeildStyle(),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () async {
                int amount = int.parse(wallet!) - amount2;
                await DatabaseMethods()
                    .UpdateUserwallet(id!, amount.toString());
                await SharedPreferenceHelper()
                    .saveUserWallet(amount.toString());
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Item hasbeen purchased Successfully successfully!"),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 15, 95, 255),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Center(
                    child: Text(
                  "CheckOut",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
