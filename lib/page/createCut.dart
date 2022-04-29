import 'package:fiverr_haircut/variables.dart' as vr;
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class CreateCut extends StatefulWidget {
  @override
  _CreateCutState createState() => _CreateCutState();
}

class _CreateCutState extends State<CreateCut> {
  String dropdownValue = "커트";
  var selectedTime;
  var time = "";
  TextEditingController shopName = TextEditingController();
  TextEditingController memo = TextEditingController();

  uploadLog() async {
    var date = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy_MM_dd_HH_mm_ss');
    String uname = FirebaseAuth.instance.currentUser!.uid;
    setState(() {
      time = formatter.format(date);
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uname)
        .collection("logs")
        .doc(time)
        .set({
      "timeStamp": DateTime.now(),
      "typeofCut": dropdownValue,
      "shop": shopName.text,
      "date": selectedTime,
      "pictures": "",
      "memos": memo.text,
    }).then((value) {
      shopName.clear();
      memo.clear();
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SingleChildScrollView(
        child: Padding(
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
                      GestureDetector(
                        onTap: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(2022, 1, 1),
                              maxTime: DateTime(2030, 12, 31),
                              onChanged: (date) {
                            setState(() {
                              selectedTime = date;
                            });
                          },
                              onConfirm: (date) {},
                              currentTime: DateTime.now(),
                              locale: LocaleType.ko);
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            selectedTime == null
                                ? "날짜를 선택해주세요"
                                : selectedTime.toString(),
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: vr.blackColor,
                              fontFamily: vr.basicFont,
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
                      GestureDetector(
                        onTap: () {
                          // 사진 더하기 기능 Add
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 5,
                            width: MediaQuery.of(context).size.width / 10 * 4,
                            decoration: BoxDecoration(
                              color: vr.whiteColor,
                              border: Border.all(color: vr.blackColor),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
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
                      GestureDetector(
                        onTap: () {
                          // 사진 더하기 기능 Add
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            minLines: 1,
                            maxLines: 5,
                            controller: memo,
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
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: vr.themeColor, thickness: 1.5),
              SizedBox(height: MediaQuery.of(context).size.height / 30),
              GestureDetector(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 15,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: vr.blackColor,
                      border: Border.all(color: vr.blackColor),
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "기록하기",
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
                    uploadLog();
                  }),
              SizedBox(height: MediaQuery.of(context).size.height / 2),
            ],
          ),
        ),
      ),
    );
  }
}
