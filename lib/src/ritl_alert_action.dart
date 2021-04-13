import 'package:flutter/cupertino.dart';
import 'package:flutter_ritl_alert/flutter_ritl_alert.dart';

/// 按钮的类型
enum RITLAlertActionType { normal, destructive, custom }

extension RITLAlertActionExtension on RITLAlertActionType {
  // textStyle
  TextStyle actionTextStyle() {
    switch (this) {
      case RITLAlertActionType.normal:
        return TextStyle(
          color: Color.fromRGBO(89, 89, 89, 1),
          fontSize: 15,
          fontWeight: FontWeight.w400,
        );
      case RITLAlertActionType.destructive:
        return TextStyle(
          color: CupertinoColors.destructiveRed,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        );
      default:
        return TextStyle(
          color: Color.fromRGBO(89, 89, 89, 1),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        );
    }
  }
}

/// Alert的按钮选项
class RITLAlertAction extends StatelessWidget {
  /// id
  final String id;

  /// 显示的文本
  final String title;

  /// 类型的style
  final TextStyle? style;

  /// 按钮的类型,如果是custom则必须传递自定义的style
  final RITLAlertActionType type;

  /// 点击的回调
  final Function(RITLAlert, RITLAlertAction)? onPressed;

  /// 自己点击进行的回调,不需要自己设置
  // final Function(RITLAlertAction)? actionOnPressed;

  /// 构建方法
  const RITLAlertAction(
      {required this.title,
      this.id = "",
      this.style,
      this.type = RITLAlertActionType.normal,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // GestureDetector()
        Expanded(
          child: Text(
            title,
            style: _textStyle(),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  _textStyle() {
    if (type == RITLAlertActionType.custom) {
      return style;
    }
    return type.actionTextStyle();
  }
}
