import 'package:fiverr_haircut/variables.dart' as vr;
import 'package:flutter/material.dart';

class CheckCut extends StatefulWidget {
  String cutName = "";
  CheckCut({required this.cutName});

  @override
  _CheckCutState createState() => _CheckCutState();
}

class _CheckCutState extends State<CheckCut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "기록 확인",
          style: TextStyle(
            // fontSize: 1,
            color: vr.blackColor,
            fontFamily: vr.basicFont,
          ),
        ),
        backgroundColor: vr.backGround,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: vr.blackColor),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width / 20,
            MediaQuery.of(context).size.height / 40,
            MediaQuery.of(context).size.width / 20,
            MediaQuery.of(context).size.height / 40),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 20 * 5,
                      child: Text(
                        "커트 타입: ",
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "커트 타입",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(color: vr.themeColor, thickness: 1.5),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 20 * 5,
                      child: Text(
                        "미용실: ",
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "미용실 이름",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: vr.themeColor, thickness: 1.5),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 15,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 20 * 5,
                      child: Text(
                        "날짜: ",
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Text(
                        "날짜",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: vr.themeColor, thickness: 1.5),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 20 * 5,
                      child: Text(
                        "이미지: ",
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Container(
                      width: MediaQuery.of(context).size.width / 3,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 10 * 4,
                        decoration: BoxDecoration(
                          color: vr.whiteColor,
                          border: Border.all(color: vr.blackColor),
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Divider(color: vr.themeColor, thickness: 1.5),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 20 * 5,
                      child: Text(
                        "메모: ",
                        style: TextStyle(
                          fontSize: 20,
                          color: vr.blackColor,
                          fontFamily: vr.basicFont,
                        ),
                      ),
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width / 50),
                    Container(
                      width: MediaQuery.of(context).size.width / 10 * 6,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 5,
                        width: MediaQuery.of(context).size.width / 10 * 6,
                        decoration: BoxDecoration(
                          color: vr.whiteColor,
                          border: Border.all(color: vr.blackColor),
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                        ),
                      ),
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
