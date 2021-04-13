import 'package:flutter/cupertino.dart';
import 'package:flutter_ritl_alert/flutter_ritl_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoButton(
              child: Text("RITLAlert(无buttons)"),
              onPressed: () {
                _alertWithNoButtons();
              },
            ),
            CupertinoButton(
              child: Text("RITLAlert(default)"),
              onPressed: () {
                _alertWithDefaultButtons();
              },
            ),
            CupertinoButton(
              child: Text("RITLAlert(Custom)"),
              onPressed: () {
                _alertWithCustom();
              },
            ),
          ],
        ),
      ),
    );
  }

  // 无按钮的弹出
  _alertWithNoButtons() {
    RITLAlert(
      context: context,
      title: "我是RITLAlert",
      message: "开启一下GPS定位吧。",
    ).show();
  }

  // 默认的按钮弹出
  _alertWithDefaultButtons() {
    RITLAlert(
      context: context,
      title: "我是RITLAlert",
      message: "开启一下GPS定位吧。",
      buttons: [
        RITLAlertAction(
          title: "知道啦",
          type: RITLAlertActionType.normal,
          onPressed: (alert, action) => print("我点击啦知道啦"),
        ),
        RITLAlertAction(
          title: "取消吧",
          type: RITLAlertActionType.destructive,
          onPressed: (alert, action) => print("我点击啦取消吧"),
        ),
      ],
    ).show();
  }

  _alertWithCustom() {
    RITLAlert(
        context: context,
        title: "我是RITLAlert",
        message: "开启一下GPS定位吧。",
        buttons: [
          RITLAlertAction(
            title: "自定义啦",
            type: RITLAlertActionType.custom,
            style: TextStyle(
              color: Color.fromRGBO(47, 189, 75, 1),
              fontWeight: FontWeight.w500,
            ),
            onPressed: (alert, action) => print("我点击自定义"),
          ),
          RITLAlertAction(
            title: "知道啦",
            type: RITLAlertActionType.normal,
            onPressed: (alert, action) => print("我点击啦知道啦"),
          ),
          RITLAlertAction(
            title: "取消吧",
            type: RITLAlertActionType.destructive,
            onPressed: (alert, action) => print("我点击啦取消吧"),
          ),
        ]).show();
  }
}
