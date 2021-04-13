import 'dart:async';

import 'package:flutter/cupertino.dart';

import './ritl_alert_style.dart';
import './ritl_alert_action.dart';

/// [青岛地铁]iOS风格下最简易的alertController样式
class RITLAlert {
  /// 标记的id
  final String? id;
  final RITLAlertStyle style;

  final BuildContext context;

  /// 顶部的标题
  final String title;
  final TextStyle titleStyle;

  /// 中间的描述
  final String? message;
  final TextStyle messageStyle;

  /// 下方的按钮
  final List<RITLAlertAction>? buttons;
  final bool onWillPopActive;
  final bool useRootNavigator;
  // final AlertAnimation? alertAnimation;

  /// ARITLAlertlert constructor
  ///
  /// [context], [title] are required.
  RITLAlert(
      {required this.context,
      this.id,
      required this.title,
      this.style = const RITLAlertStyle(),
      this.titleStyle = const TextStyle(),
      this.message = "",
      this.messageStyle = const TextStyle(),
      this.buttons,
      this.onWillPopActive = false,
      this.useRootNavigator = true});

  //展示方法
  Future<bool?> show() async {
    return await showGeneralDialog(
        context: context,
        pageBuilder: (context, animation, secondAnimation) =>
            _alertContainerView());
  }

  //消失
  Future<void> dismiss() async {
    Navigator.of(context, rootNavigator: useRootNavigator).pop();
  }

  /// alert的容器
  Widget _alertContainerView() {
    //存在并且不为空
    var hasMessage = message != null && !(message?.isEmpty ?? true);

    final Widget _child = ConstrainedBox(
      constraints: style.constraints ??
          BoxConstraints(maxHeight: double.infinity, maxWidth: double.infinity),
      //自适应大小
      child: Align(
        alignment: style.alertAlignment,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              // height: 300,
              width: 280.0,
              decoration: BoxDecoration(
                color: style.backgroundColor,
                borderRadius: style.borderRadius,
              ),
              child: Column(
                children: [
                  Container(
                    padding: style.alertPadding,
                    child: Column(children: [
                      Text(
                        title,
                        textAlign: style.titleTextAlign,
                        style: style.titleStyle,
                      ),
                      SizedBox(height: 8),
                      !hasMessage
                          ? Container()
                          : Text(
                              message!,
                              textAlign: style.messageTextAlign,
                              style: style.messageStyle,
                            ),
                      SizedBox(height: hasMessage ? 8 : 16),
                    ]),
                  ),
                  //底部的按钮
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _getButtons(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return _child;
  }

  /// 获得所有的button
  List<Widget> _getButtons() {
    List<Widget> expandedButtons = [];
    var hasButton = !(buttons == null && (buttons?.isEmpty ?? true));
    //如果按钮不存在，添加默认的取消即可
    if (!hasButton) {
      expandedButtons.add(
        Expanded(
          child: GestureDetector(
            child: Container(
              height: 46,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 1, color: style.separateColor),
                ),
              ),
              child: RITLAlertAction(
                title: "知道啦",
                type: RITLAlertActionType.normal,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
    //如果存在自定义的按钮
    else {
      var buttons = this.buttons!;
      expandedButtons.addAll(
        buttons.map(
          (button) => Expanded(
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                          width: 1,
                          color: style.separateColor,
                        ),
                        left: buttons.indexOf(button) == 0
                            ? BorderSide.none
                            : BorderSide(
                                width: 1,
                                color: style.separateColor,
                              ))),
                height: 46,
                child: button,
              ),
              onTap: () {
                //执行回调
                Navigator.pop(context);
                if (button.onPressed != null) {
                  button.onPressed!(this, button);
                }
              },
            ),
          ),
        ),
      );
    }
    return expandedButtons;
  }
}
