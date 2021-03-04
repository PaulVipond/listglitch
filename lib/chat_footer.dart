import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:emoji_picker/emoji_picker.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/services.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'dart:async';

import 'app_state.dart';
import 'send_icon.dart';

class ChatFooter extends StatefulWidget  {
  final bool isActive;

  ChatFooter({this.isActive});

  @override
  _ChatFooterState createState() => _ChatFooterState();
}

class _ChatFooterState extends State<ChatFooter> {
  TextEditingController textController;
  FocusNode focusNode;
  StreamSubscription<bool> keyboardVisibilityStream;
  bool showEmojiKeyboard = false;
  bool isKeyboardVisible = false;
  bool showKeyboard = false;

  @override
  void initState() {
    super.initState();
    
    textController = TextEditingController();
    BackButtonInterceptor.add(backButtonInterceptor);

    // Keep the reference so we can cancel it in dispose(), othewise we get setState() called after dispose()
    keyboardVisibilityStream = KeyboardVisibility.onChange.listen((bool isKeyboardVisible) {
      setState(() {
        this.isKeyboardVisible = isKeyboardVisible;
        //print("A!");
        if (isKeyboardVisible && showEmojiKeyboard) {
          //print("B!");
          showEmojiKeyboard = false;
        }
      });
    });
  }

  bool backButtonInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    if (showEmojiKeyboard) {
      toggleEmojiKeyboard();
      return true;
    }
    return false;
  }

  void toggleEmojiKeyboard() async {
    bool newShowEmojiKeyboardState = !showEmojiKeyboard;
    bool initialKeyboardIsVisible = isKeyboardVisible;

//print("Made it!1");
    if (initialKeyboardIsVisible) {
      await SystemChannels.textInput.invokeMethod('TextInput.hide');
//print("Made it!2");
      //await Future.delayed(Duration(milliseconds: 100));
    } else if (showEmojiKeyboard) {
//print("Made it!3");
      FocusScope.of(context).requestFocus(focusNode);
    }

    // About to show emoji keyboard?
    if (newShowEmojiKeyboardState && !initialKeyboardIsVisible) {
//print("Made it!4");
      setState(() {
        // Only need to rebuild state when swapping to emoji keyboard
        showEmojiKeyboard = newShowEmojiKeyboardState;
      });
    } else {
//print("Made it!5");
      showEmojiKeyboard = newShowEmojiKeyboardState;
    }
  }

  @override
  void dispose() {
    textController?.dispose();
    focusNode?.dispose();
    keyboardVisibilityStream?.cancel();
    BackButtonInterceptor.remove(backButtonInterceptor);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    focusNode = FocusNode();

//print("Made it!6");
    return Container(
      decoration: new BoxDecoration(
        color: AppState.i.chatFooterBoxColour,
      ),
      child: SizedBox(
        width: AppState.i.chatFooterBoxWidth,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlatformIconButton(
                  onPressed: toggleEmojiKeyboard,
                  materialIcon: Icon(showEmojiKeyboard ? Icons.keyboard_rounded : Icons.emoji_emotions_outlined, 
                    size: AppState.i.chatFooterKeyboardOrEmojiIconSize,
                    color: AppState.i.chatFooterHighlightedIconsColour),
                  cupertinoIcon: Icon(
                    showEmojiKeyboard ? Icons.keyboard : CupertinoIcons.smiley,
                    size: AppState.i.chatFooterKeyboardOrEmojiIconSize,
                    color: AppState.i.chatFooterHighlightedIconsColour
                  ),
                ),
                Expanded(
                  child: Container(
                    child: TextField(
                      readOnly: !widget.isActive,
                      focusNode: focusNode,
                      autofocus: showKeyboard,
                      textCapitalization: TextCapitalization.sentences,
                      controller: textController,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 5,
                      textInputAction: TextInputAction.newline,
                      cursorColor: AppState.i.chatFooterSendBoxCursorColour,
                      style: TextStyle(
                        fontSize: AppState.i.chatFooterSendBoxFontSize, //sh * 0.022
                        decoration: TextDecoration.none,
                        color: AppState.i.chatFooterSendBoxFontColour
                      ),
                      textAlignVertical: TextAlignVertical(y: 0.0),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: AppState.i.chatFooterSendBoxBackgroundColour,
                        hintText: "chat_EnterMessage",
                        hintStyle: TextStyle(color: AppState.i.chatFooterSendBoxHintFontColour),
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ),
                textController.text.isEmpty ? PlatformIconButton(
                  materialIcon: Icon(Icons.attach_file, size: AppState.i.chatFooterStandardIconSize),
                  cupertinoIcon: Icon(
                    CupertinoIcons.paperclip,
                    size: AppState.i.chatFooterStandardIconSize,
                  ),
                ) : Container(),
                textController.text.isEmpty ? PlatformIconButton(
                  materialIcon: Icon(Icons.camera_alt, size: AppState.i.chatFooterStandardIconSize),
                  cupertinoIcon: Icon(
                    CupertinoIcons.camera_fill,
                    size: AppState.i.chatFooterStandardIconSize,
                  ),
                ) : Container(),
                textController.text.isEmpty ?
                  PlatformIconButton(
                    materialIcon: Icon(Icons.mic_rounded, size: AppState.i.chatFooterStandardIconSize, color: AppState.i.chatFooterHighlightedIconsColour),
                    cupertinoIcon: Icon(
                      CupertinoIcons.mic_circle_fill,
                      size: AppState.i.chatFooterStandardIconSize,
                      color: AppState.i.chatFooterHighlightedIconsColour
                    ),
                  ) :
                  SendIcon(
                    textController: textController,
                  ),
              ],
            ),
            Visibility(
              visible: showEmojiKeyboard,
              child: EmojiPicker(
                rows: 4,
                columns: 8,
                bgColor: AppState.i.chatFooterEmojiKeyboardBackgroundColour,
                indicatorColor: AppState.i.chatFooterEmojiKeyboardIndicatorColour,
                onEmojiSelected: (emoji, category) {
                  textController.text = textController.text + emoji.emoji;
                },
              )
            )
          ],
        )
      )
    );
  }
}