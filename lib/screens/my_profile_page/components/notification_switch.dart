import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter1/main.dart';




class NotificationSwitchScreen extends StatelessWidget {
  static String routeName = "/notification";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Notification",
      home: NotificationSwitch(),
    );
  }
}


class NotificationSwitch extends StatefulWidget{
  const NotificationSwitch({Key? key}) : super(key: key);

  @override
  _NotificationSwitchState createState() => _NotificationSwitchState();
}

class _NotificationSwitchState extends State<NotificationSwitch>{
  bool _isChecked = false;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50),
              Center(
                child: Row(
                  children: [
                    SizedBox(width: 60,),
                    Text("알림 허용 : "),
                    SizedBox(width: 20,),
                    Switch(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value;
                          // Update the ValueNotifier
                          numOfItemNotifier.value = value ? 1 : 0;
                          if (_isChecked) {
                            Fluttertoast.showToast(
                              msg: "알림이 켜졌습니다",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                            );
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
