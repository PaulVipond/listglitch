import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_state.dart';
import 'enums.dart';
import 'chat_item.dart';
import 'content_message_embellished.dart';

// extension ExtendedFlex on SharedPreference {
//   int get childCount => this.children.length;
// }
extension MessageTypeExtensions on MessageType {
  Widget getMessageWidget(ContentMessageEmbellished message) {
    switch (this) {
      case MessageType.text:
        return TextMessage(message: message);
      case MessageType.audio:
        return AudioMessage(message: message);
      case MessageType.image:
        return ImageMessage(message: message);
      case MessageType.video:
        return VideoMessage(message: message);
      case MessageType.admin:
        return TextMessage(message: message);
      case MessageType.action:
        return TextMessage(message: message);
      case MessageType.form:
        return TextMessage(message: message);
      default:
        return TextMessage(message: message);
    }
  }
}

extension EmbellishedMessageExtensions on ContentMessageEmbellished {
  CircleAvatar getCreatorAvatar() {
    bool profileImageIsEmpty = this.profileImageIsEmpty();
  
    return CircleAvatar(
      radius: AppState.i.chatItemOtherUserAvatarRadius,
      backgroundColor: profileImageIsEmpty ? this.avatarBackgroundColour : null,
      child: profileImageIsEmpty ? Text(this.creatorLastName == null || this.creatorLastName.length == 0 ? 
        this.creatorFirstName.substring(0) : 
        this.creatorFirstName.substring(0) + ' ' + this.creatorLastName.substring(1),
        style: TextStyle(color: this.avatarFontColour)) : 
        null,
      backgroundImage: profileImageIsEmpty ? null :
        this.profileImage.substring(0, 3) == 'ass' ?
          AssetImage(profileImage) :
          FileImage(File(this.profileImage))
    );
  }

  bool profileImageIsEmpty() {
    return this.profileImage == null || this.profileImage.isEmpty;
  }
}

extension MessageExtensions on ContentMessage {
  Icon getReadReceiptIcon() {
    if (this.sentAt == null) {
      return Icon(Icons.access_time, size: AppState.i.chatItemMessageReceiptIconSize, color: AppState.i.chatItemMessageReceiptIconWaitingColour);
    } else if (this.receivedAt == null) {
      return Icon(Icons.done, size: AppState.i.chatItemMessageReceiptIconSize, color: AppState.i.chatItemMessageReceiptIconSentColour);
    } else if (this.readAt == null) {
      return Icon(Icons.done_all, size: AppState.i.chatItemMessageReceiptIconSize, color: AppState.i.chatItemMessageReceiptIconDeliveredColour);
    } else {
      return Icon(Icons.done_all, size: AppState.i.chatItemMessageReceiptIconSize, color: AppState.i.chatItemMessageReceiptIconReadColour);
    }
  }

  bool isFromAppUser(String appUserId) {
    return this?.creatorId == appUserId;
  }

  DateTime messageDisplayTime(String appUserId) {
    return (this.isFromAppUser(appUserId)) ? this.createdAt.toLocal() : this.receivedAt.toLocal();
  }

  bool isFirstMessageInDay(String appUserId) {
    final DateTime displayDate = this.messageDisplayTime(appUserId);
    final DateTime previousDate = this.previousMessageDisplayDate?.toLocal();

    return !(displayDate.day == previousDate?.day && 
            displayDate.month == previousDate?.month && 
            displayDate.year == previousDate?.year);
  }

  bool senderIsSameAsPreviousOnSameDay(String appUserId) {
    return this.creatorId == this.previousMessageCreatorId && 
      !isFirstMessageInDay(appUserId);
  }
}

extension DateTimeExtensions on DateTime {
  String localeFormattedMessageDateTime(BuildContext context) {
    String dateText;
    int dateDifference = this.toLocal().differenceInDaysToNow();
    if (dateDifference == 0) {
      dateText = 'todayCaps';
    } else if (dateDifference == -1) {
      dateText = 'yesterdayCaps';
    } else {
      dateText = DateFormat.yMMMMEEEEd(Localizations.localeOf(context).toString()).format(this);
    }

    return dateText;
  }

  int secondsSinceEpochUtc() {
    // ~/ = truncating division
    return DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000;
  }

  int differenceInDaysToNow() {
    DateTime now = DateTime.now();
    return DateTime(this.year, this.month, this.day).difference(DateTime(now.year, now.month, now.day)).inDays;
  }
}
