# flutter_ritl_alert

青岛地铁APP中使用的AlertController flutter版本

[![Version](https://img.shields.io/badge/version-0.0.1-green.svg)](https://pub.dev/packages/flutter_ritl_alert)
 
## 引用

```yaml
dependencies:
 flutter_ritl_alert: ^0.0.1
```

or

```yaml
dependencies:
 flutter_ritl_alert:
   git: git@github.com:RITL/flutter_ritl_alert.git
```


then run `flutter packages get`

## 无按钮
```dart
RITLAlert(
  context: context,
  title: "我是RITLAlert",
  message: "开启一下GPS定位吧。",
).show();
```
<img width="320" src="https://raw.githubusercontent.com/wiki/RITL/flutter_ritl_alert/none.png"></img>


## 默认方式
```dart
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
```
<img width="320" src="https://raw.githubusercontent.com/wiki/RITL/flutter_ritl_alert/default.png"></img>


## 自定义方式
```dart
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
```

<img width="320" src="https://raw.githubusercontent.com/wiki/RITL/flutter_ritl_alert/custom2.png"></img>
<img width="320" src="https://raw.githubusercontent.com/wiki/RITL/flutter_ritl_alert/custom1.png"></img>

## 自定义Style
```dart
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
  style: RITLAlertStyle(
    backgroundColor: CupertinoColors.black,
    separateColor: CupertinoColors.white,
    titleStyle: TextStyle(color: CupertinoColors.white),
    messageStyle: TextStyle(color: CupertinoColors.white),
  ),
).show();
```
<img width="320" src="https://raw.githubusercontent.com/wiki/RITL/flutter_ritl_alert/custom_UI.png"></img>
