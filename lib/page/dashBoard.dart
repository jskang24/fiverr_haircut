import 'package:fiverr_haircut/variables.dart' as vr;
import 'package:flutter/material.dart';
import './createCut.dart';
import './checkCut.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashBoard extends StatefulWidget {
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  signInAnon() async {
    bool isAlready = false;
    await FirebaseAuth.instance.signInAnonymously();
    String uname = FirebaseAuth.instance.currentUser!.uid;
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    final allData = await querySnapshot.docs.map((doc) => doc.data()).toList();
    for (var i in allData) {
      if ((i as Map<String, dynamic>)['uid'] == uname) {
        isAlready = true;
      }
    }
    if (isAlready == false) {
      await FirebaseFirestore.instance.collection("users").doc(uname).set({
        "uid": uname,
      });
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uname)
          .collection("logs")
          .doc("dummy")
          .set({
        "timeStamp": "",
        "typeofCut": "",
        "shop": "",
        "date": "",
        "pictures": "",
        "memos": "",
      });
    }
  }

  retrieveData() async {}

  initState() {
    signInAnon();
    retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: vr.backGround,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 15,
                    color: vr.backGround2,
                    child: Center(
                        child: Text("광고",
                            style: TextStyle(
                                fontSize: 20,
                                color: vr.blackColor,
                                fontFamily: vr.basicFont)))),
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width / 20,
                      MediaQuery.of(context).size.height / 40,
                      MediaQuery.of(context).size.width / 20,
                      MediaQuery.of(context).size.height / 40),
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 10,
                        child: Text(
                          "나의 기록",
                          style: TextStyle(
                            fontSize: 30,
                            color: vr.blackColor,
                            fontFamily: vr.basicFont,
                          ),
                        ),
                      ),
                      GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 3,
                            // color: vr.whiteColor,
                            decoration: BoxDecoration(
                              color: vr.whiteColor,
                              border: Border.all(color: vr.blackColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        child: Text(
                                          "커트 타입",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: vr.blackColor,
                                            fontFamily: vr.basicFont,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5,
                                        child: Text(
                                          "날짜",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: vr.blackColor,
                                            fontFamily: vr.basicFont,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(color: vr.blackColor),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              40),
                                  Row(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                10 *
                                                4,
                                        decoration: BoxDecoration(
                                          color: vr.whiteColor,
                                          border:
                                              Border.all(color: vr.blackColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18.0)),
                                        ),
                                      ),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20),
                                      Column(
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20 *
                                                7,
                                            child: Text(
                                              "미용실: ",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: vr.blackColor,
                                                fontFamily: vr.basicFont,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                10,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                20 *
                                                7,
                                            child: Text(
                                              "메모: ",
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: vr.blackColor,
                                                fontFamily: vr.basicFont,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CheckCut(cutName: "TMP"),
                              ),
                            );
                          }),
                      SizedBox(height: MediaQuery.of(context).size.height / 30),
                      GestureDetector(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 3,
                          // color: vr.whiteColor,
                          decoration: BoxDecoration(
                            color: vr.whiteColor,
                            border: Border.all(color: vr.blackColor),
                            borderRadius:
                                BorderRadius.all(Radius.circular(18.0)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      child: Text(
                                        "커트 타입",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: vr.blackColor,
                                          fontFamily: vr.basicFont,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 4,
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Text(
                                        "날짜",
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: vr.blackColor,
                                          fontFamily: vr.basicFont,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(color: vr.blackColor),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        40),
                                Row(
                                  children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              5,
                                      width: MediaQuery.of(context).size.width /
                                          10 *
                                          4,
                                      decoration: BoxDecoration(
                                        color: vr.whiteColor,
                                        border:
                                            Border.all(color: vr.blackColor),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(18.0)),
                                      ),
                                    ),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                20),
                                    Column(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20 *
                                              7,
                                          child: Text(
                                            "미용실: ",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: vr.blackColor,
                                              fontFamily: vr.basicFont,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              20 *
                                              7,
                                          child: Text(
                                            "메모: ",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: vr.blackColor,
                                              fontFamily: vr.basicFont,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 20),
                      GestureDetector(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 15,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: vr.blackColor,
                              border: Border.all(color: vr.blackColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: Text(
                                  "새로 기록하기",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: vr.whiteColor,
                                    fontFamily: vr.basicFont,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CreateCut(),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
