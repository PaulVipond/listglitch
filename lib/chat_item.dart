import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'content_message_embellished.dart';
import 'extensions.dart';
import 'app_state.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    Key key,
    @required this.message,
  }) : super(key: key);
  final ContentMessageEmbellished message;

  @override
  Widget build(BuildContext context) {
    Widget widget;

    if (message.cm.isFirstMessageInDay(AppState.i.activeUserId)) {
      widget = Padding(
        padding: EdgeInsets.only(
          top: AppState.i.chatItemDateInset,
        ),
        child: Column(children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
          Flexible(
            fit: FlexFit.loose,
            child: 
          Padding(
            padding: EdgeInsets.only(
              bottom: AppState.i.chatItemDateInset,
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: AppState.i.chatItemDateTextVerInset,
                horizontal: AppState.i.chatItemDateTextHorInset),
              decoration: BoxDecoration(
                color: AppState.i.chatItemDateBackgroundColour,
                    //.withOpacity(!message.isFromAppUser ? 0.1 : 0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppState.i.chatItemDateBorderRadius),
                  topRight: Radius.circular(AppState.i.chatItemDateBorderRadius),
                  bottomRight: Radius.circular(AppState.i.chatItemDateBorderRadius),
                  bottomLeft: Radius.circular(AppState.i.chatItemDateBorderRadius),
                )
              ),
              child: Text(
                message.cm.messageDisplayTime(AppState.i.activeUserId).localeFormattedMessageDateTime(context),
                style: TextStyle(
                  fontSize: AppState.i.chatItemDateFontSize,
                  color: AppState.i.chatItemDateFontColour
                )
              )
            )
            ),
          )],
          ),
          getRow()
        ])
      );
    } else {
      widget = getRow();
    }

    AppState.i.chatPreviousMessageCreatorId = message.cm.creatorId;
    return widget;
  }

  Widget getRow() {
    bool isFromAppUser = message.cm.isFromAppUser(AppState.i.activeUserId);

    return Padding(
      padding: EdgeInsets.only(
        bottom: AppState.i.chatItemHorVerInsets,
        left: AppState.i.chatItemLeftRightInsets,
        right: AppState.i.chatItemLeftRightInsets,
      ),
      child: isFromAppUser ? getAppUserMessageRow() : getOtherUserMessageRow()
    );
  }

  Widget getAppUserMessageRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: AppState.i.chatItemUserLeftInset),
        Flexible(
          fit: FlexFit.loose,
          child: message.cm.messageType.getMessageWidget(message),
        ),
      ],
    );
  }

  Widget getOtherUserMessageRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        message.cm.senderIsSameAsPreviousOnSameDay(AppState.i.activeUserId)
          ? SizedBox(width: AppState.i.chatItemOtherUserLeftInset)  // If sender is previous message sender on same day, don't repeat avatar
          : message.getCreatorAvatar(),
        SizedBox(width: AppState.i.chatItemOtherUserAvatarRightPadding),  // Leave fixed gap for other messages
        Flexible(
          fit: FlexFit.loose,
          // For testing expansion - should not expand to fit width
          //child: Container(child: Text("Test"), decoration: BoxDecoration(color: Theme.of(context).primaryColor)),
          child: message.cm.messageType.getMessageWidget(message),
        ),
        SizedBox(width: AppState.i.chatItemOtherUserMessageRightPadding),  // Fixed gap for non-user messages
      ],
    );
  }
}

class TextMessage extends StatelessWidget{
  const TextMessage({
    Key key,
    @required this.message
  }) : super(key: key);
  final ContentMessageEmbellished message;

  @override
  Widget build(BuildContext context) {
    bool isFromAppUser = message.cm.isFromAppUser(AppState.i.activeUserId);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: AppState.i.chatItemMessageVerticalInset),
      child:
      Container(
        decoration: BoxDecoration(
          color: isFromAppUser ? AppState.i.chatItemUserMessageBackgroundColour : Colors.white,
              //.withOpacity(!message.isFromAppUser ? 0.1 : 0.8),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isFromAppUser ? AppState.i.chatItemMessageBorderRadius : 0),
            topRight: Radius.circular(isFromAppUser ? 0 : AppState.i.chatItemMessageBorderRadius),
            bottomRight: Radius.circular(isFromAppUser ? AppState.i.chatItemMessageCurvedBorderRadius : AppState.i.chatItemMessageBorderRadius),
            bottomLeft: Radius.circular(isFromAppUser ? AppState.i.chatItemMessageBorderRadius : AppState.i.chatItemMessageCurvedBorderRadius),
          ),
          boxShadow: [
                BoxShadow(
                  color: AppState.i.chatItemMessageBoxShadowColour,
                  spreadRadius: AppState.i.chatItemMessageBoxShadowSpreadRadius,
                  blurRadius: AppState.i.chatItemMessageBoxShadowBlurRadius,
                  offset: AppState.i.chatItemMessageBoxShadowOffset, // changes position of shadow
                ),
              ],                
        ),
        padding: EdgeInsets.symmetric(
            vertical: AppState.i.chatItemMessageVerInset,
            horizontal: AppState.i.chatItemMessageHorInset),
        child: Stack(
          children: [
            Text(
                // WTF? This calculates enough space for the message receipt time to wrap
                message.cm.messageText + (isFromAppUser ? '              \u202F' : '        \u202F'),
                style: TextStyle(
                  fontSize: AppState.i.chatItemMessageTextFontSize,
                  color:
                      isFromAppUser ? AppState.i.chatItemMessageUserTextFontColour : AppState.i.chatItemMessageOtherUserTextFontColour,
                )
              ),
              Positioned(
                width: 60,
                height: 15,
                right: 0,
                bottom: -2,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      DateFormat.Hm().format(message.cm.messageDisplayTime(AppState.i.activeUserId)),
                      style: TextStyle(
                        fontSize: AppState.i.chatItemMessageTimeFontSize,
                        color: isFromAppUser ? AppState.i.chatItemMessageUserTimeFontColour : AppState.i.chatItemMessageOtherUserTimeFontColour,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    !isFromAppUser ? Container() : 
                    Padding(
                      padding: EdgeInsets.only(left: AppState.i.chatItemMessageReceiptLeftInset),
                      child: message.cm.getReadReceiptIcon()
                    )
                  ],
                ),
              ),              
          ],
        ),
      )
    );
  }
}

class AudioMessage extends StatelessWidget{
  const AudioMessage({
    Key key,
    @required this.message,
  }) : super(key: key);
  final ContentMessageEmbellished message;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ImageMessage extends StatelessWidget{
  const ImageMessage({
    Key key,
    @required this.message,
  }) : super(key: key);
  final ContentMessageEmbellished message;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class VideoMessage extends StatelessWidget{
  const VideoMessage({
    Key key,
    @required this.message,
  }) : super(key: key);
  final ContentMessageEmbellished message;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}