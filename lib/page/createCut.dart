import 'package:fiverr_haircut/variables.dart' as vr;
import 'package:flutter/material.dart';

class CreateCut extends StatefulWidget {
  @override
  _CreateCutState createState() => _CreateCutState();
}

class _CreateCutState extends State<CreateCut> {
  String dropdownValue = "커트";
  TextEditingController shopName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "새로 기록하기",
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
                      width: MediaQuery.of(context).size.width / 4,
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        enableFeedback: true,
                        borderRadius: BorderRadius.circular(10),
                        dropdownColor: vr.backGround,
                        style: TextStyle(
                          fontFamily: vr.basicFont,
                          fontSize: 15,
                        ),
                        underline: Container(
                          height: 2,
                          color: vr.whiteColor,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>[
                          '커트',
                          '염색',
                          '파마',
                          '매직',
                          '클리닉',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(
                                fontSize: 20,
                                color: vr.blackColor,
                                fontFamily: vr.basicFont,
                              ),
                            ),
                          );
                        }).toList(),
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
                      child: TextFormField(
                        controller: shopName,
                        keyboardType: TextInputType.text,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        validator: (String? value) {
                          if (value!.isEmpty) return '필수 항목입니다!';
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: vr.blackColor),
                          ),
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
          ],
        ),
      ),
    );
  }
}
