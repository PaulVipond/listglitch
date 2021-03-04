import 'dart:ui';

import 'package:flutter/material.dart';
import 'device_config.dart';

class AppState {
  static AppState i;
  Brightness _systemBrightness;
  DeviceData _deviceData;
  Color progressIndicatorColour;

  // Group settings
  String activeUserId;
  String activeGroupId;
  String chatBackgroundImage;
  
  // Chat item settings
  double chatItemDateInset;
  double chatItemDateTextHorInset;
  double chatItemDateTextVerInset;
  Color chatItemDateBackgroundColour;
  double chatItemDateBorderRadius;
  double chatItemDateFontSize;
  Color chatItemDateFontColour;
  double chatItemHorVerInsets;
  double chatItemLeftRightInsets;
  double chatItemUserSpacerWidth;
  double chatItemUserLeftInset;
  double chatItemOtherUserLeftInset;
  double chatItemOtherUserAvatarRadius;
  double chatItemOtherUserAvatarRightPadding;
  double chatItemOtherUserMessageRightPadding;
  double chatItemMessageVerticalInset;
  double chatItemMessageBorderRadius;
  double chatItemMessageCurvedBorderRadius;
  Color chatItemUserMessageBackgroundColour;
  Color chatItemMessageBoxShadowColour;
  double chatItemMessageBoxShadowSpreadRadius;
  double chatItemMessageBoxShadowBlurRadius;
  Offset chatItemMessageBoxShadowOffset;
  double chatItemMessageVerInset;
  double chatItemMessageHorInset;
  double chatItemMessageTextFontSize;
  Color chatItemMessageUserTextFontColour;
  Color chatItemMessageOtherUserTextFontColour;
  Color chatItemMessageUserTimeFontColour;
  Color chatItemMessageOtherUserTimeFontColour;
  double chatItemMessageTimeFontSize;
  double chatItemMessageReceiptLeftInset;
  double chatItemMessageReceiptIconSize;
  Color chatItemMessageReceiptIconSentColour;
  Color chatItemMessageReceiptIconDeliveredColour;
  Color chatItemMessageReceiptIconReadColour;
  Color chatItemMessageReceiptIconWaitingColour;
  
  // Chat footer settings
  String chatPreviousMessageCreatorId;
  Color chatFooterBoxColour;
  double chatFooterBoxWidth;
  Color chatFooterHighlightedIconsColour;
  Color chatFooterSendBoxCursorColour;
  Color chatFooterSendBoxBackgroundColour;
  Color chatFooterSendBoxFontColour;
  double chatFooterSendBoxFontSize;
  Color chatFooterSendBoxHintFontColour;
  double chatFooterKeyboardOrEmojiIconSize;
  double chatFooterStandardIconSize;
  Color chatFooterEmojiKeyboardBackgroundColour;
  Color chatFooterEmojiKeyboardIndicatorColour;
  double chatFooterSendIconHorVerInsets;
  double chatFooterSendIconLeftRightInsets;
  
  Brightness get systemBrightness {
    return _systemBrightness;
  }

  set systemBrightness(Brightness brightness) {
    _systemBrightness = brightness;
    if (brightness == Brightness.dark) {
      progressIndicatorColour = Color.fromRGBO(95, 111, 237, 1);
      chatFooterBoxColour = Colors.grey.shade300;
      chatFooterHighlightedIconsColour = Color.fromRGBO(95, 111, 237, 1);
      chatFooterSendBoxCursorColour = chatFooterHighlightedIconsColour;
      chatFooterSendBoxBackgroundColour = Colors.grey.shade300;
      chatFooterSendBoxFontColour = Colors.black;
      chatFooterSendBoxHintFontColour = Colors.grey;
      chatFooterEmojiKeyboardIndicatorColour = chatFooterHighlightedIconsColour;
      chatFooterEmojiKeyboardBackgroundColour = Colors.grey.shade200;
      chatItemDateBackgroundColour = Color.fromRGBO(208, 216, 252, 1);
      chatItemDateFontColour = chatFooterHighlightedIconsColour;
      chatItemUserMessageBackgroundColour = chatFooterHighlightedIconsColour;
      chatItemMessageBoxShadowColour = Colors.grey.withOpacity(0.7);
      chatItemMessageUserTextFontColour = Colors.white;
      chatItemMessageOtherUserTextFontColour = Colors.black;
      chatItemMessageUserTimeFontColour = chatItemDateBackgroundColour;
      chatItemMessageOtherUserTimeFontColour = Colors.grey;
      chatItemMessageReceiptIconWaitingColour = Colors.grey;
      chatItemMessageReceiptIconSentColour = Colors.grey;
      chatItemMessageReceiptIconDeliveredColour = Colors.grey;
      chatItemMessageReceiptIconReadColour = Color(0xff44AFDB); //Colors.yellow;
    } else {
      progressIndicatorColour = Color.fromRGBO(95, 111, 237, 1);
      chatFooterBoxColour = Colors.grey.shade300;
      chatFooterHighlightedIconsColour = Color.fromRGBO(95, 111, 237, 1);
      chatFooterSendBoxCursorColour = chatFooterHighlightedIconsColour;
      chatFooterSendBoxBackgroundColour = Colors.grey.shade300;
      chatFooterSendBoxFontColour = Colors.black;
      chatFooterSendBoxHintFontColour = Colors.grey;
      chatFooterEmojiKeyboardIndicatorColour = chatFooterHighlightedIconsColour;
      chatFooterEmojiKeyboardBackgroundColour = Colors.grey.shade200;
      chatItemDateBackgroundColour = Color.fromRGBO(208, 216, 252, 1);
      chatItemDateFontColour = chatFooterHighlightedIconsColour;
      chatItemUserMessageBackgroundColour = chatFooterHighlightedIconsColour;
      chatItemMessageBoxShadowColour = Colors.grey.withOpacity(0.7);
      chatItemMessageUserTextFontColour = Colors.white;
      chatItemMessageOtherUserTextFontColour = Colors.black;
      chatItemMessageUserTimeFontColour = chatItemDateBackgroundColour;
      chatItemMessageOtherUserTimeFontColour = Colors.grey;
      chatItemMessageReceiptIconWaitingColour = Colors.grey;
      chatItemMessageReceiptIconSentColour = Colors.grey;
      chatItemMessageReceiptIconDeliveredColour = Colors.grey;
      chatItemMessageReceiptIconReadColour = Color(0xff44AFDB); //Colors.yellow;
    }
    chatItemMessageBoxShadowSpreadRadius = 1;
    chatItemMessageBoxShadowBlurRadius = 5;
    chatItemMessageBoxShadowOffset = Offset(2, 5);
  }  

  DeviceData get deviceData {
    return _deviceData;
  }

  double percentOfScreenWidth(double percent) {
    return _deviceData.screenWidth * percent / 100.0;
  }

  double percentOfScreenHeight(double percent) {
    return _deviceData.screenHeight * percent / 100.0;
  }
  set deviceData(DeviceData data) {
    _deviceData = data;
    chatFooterBoxWidth = data.screenWidth;
    chatFooterKeyboardOrEmojiIconSize = percentOfScreenWidth(9);
    chatFooterSendBoxFontSize = percentOfScreenHeight(2.2);
    chatFooterStandardIconSize = percentOfScreenWidth(8);
    chatFooterSendIconHorVerInsets = percentOfScreenHeight(1);
    chatFooterSendIconLeftRightInsets = percentOfScreenHeight(2);
    chatItemDateInset = percentOfScreenHeight(2);
    chatItemDateTextVerInset = percentOfScreenHeight(0.5);
    chatItemDateTextHorInset = percentOfScreenWidth(3);
    chatItemDateBorderRadius = percentOfScreenWidth(5);
    chatItemDateFontSize = percentOfScreenHeight(1.8);
    chatItemHorVerInsets = percentOfScreenWidth(1);
    chatItemLeftRightInsets = percentOfScreenWidth(2);
    chatItemUserSpacerWidth = percentOfScreenWidth(2);
    chatItemUserLeftInset = percentOfScreenWidth(8);
    chatItemOtherUserLeftInset = percentOfScreenWidth(10.5);
    chatItemOtherUserAvatarRadius = chatItemOtherUserLeftInset / 2;
    chatItemOtherUserAvatarRightPadding = percentOfScreenWidth(1.5);
    chatItemOtherUserMessageRightPadding = percentOfScreenWidth(10);
    chatItemMessageVerticalInset = percentOfScreenHeight(0.4);
    chatItemMessageBorderRadius = percentOfScreenWidth(2);
    chatItemMessageCurvedBorderRadius = percentOfScreenWidth(5);
    chatItemMessageVerInset = percentOfScreenHeight(0.8);
    chatItemMessageHorInset = percentOfScreenWidth(3);
    chatItemMessageTextFontSize = percentOfScreenHeight(2);
    chatItemMessageTimeFontSize = percentOfScreenHeight(1.5);
    chatItemMessageReceiptLeftInset = percentOfScreenWidth(1);
    chatItemMessageReceiptIconSize = percentOfScreenHeight(2);
  }
}