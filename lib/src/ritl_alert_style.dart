import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RITLAlertStyle {
  /// 背景色
  final Color backgroundColor;

  /// 底部按钮的分割颜色
  final Color separateColor;

  /// 总体的圆角
  final BorderRadius? borderRadius;

  /// 标题的风格
  final TextStyle titleStyle;
  final TextAlign titleTextAlign;

  /// 内容的风格
  final TextStyle messageStyle;
  final TextAlign messageTextAlign;

  final BoxConstraints? constraints;

  /// 容器的内部缩进
  final EdgeInsets alertPadding;
  final AlignmentGeometry alertAlignment;

  /// Alert style constructor function
  /// The [backgroundColor] parameter sets the background color.
  /// The [separateColor] parameter sets the button's separate color.
  /// The [borderRadius] parameter sets alert's borderRadius. default is 8
  /// The [titleStyle] parameter sets alert title text style.
  /// The [titleTextAlign] parameter sets alignment of the title.
  /// The [messageStyle] parameter sets alert desc text style.
  /// The [messageTextAlign] parameter sets alignment of the desc.
  /// The [constraints] parameter sets Alert size.
  /// The [alertPadding] parameter sets alert area padding.
  /// The [alertAlignment] parameter sets alert area alignment.
  const RITLAlertStyle({
    this.backgroundColor = CupertinoColors.white,
    this.separateColor = const Color.fromRGBO(247, 247, 247, 1),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.titleStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(77, 76, 77, 1),
    ),
    this.titleTextAlign = TextAlign.center,
    this.messageStyle = const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(88, 89, 89, 1),
    ),
    this.messageTextAlign = TextAlign.center,
    // this.buttonAreaPadding = const EdgeInsets.all(20.0),
    this.constraints,
    // this.buttonsDirection = ButtonsDirection.row,
    // this.alertElevation,
    this.alertPadding = const EdgeInsets.fromLTRB(15, 15, 15, 0),
    //alert的参考点
    this.alertAlignment = Alignment.center,
  });
}
