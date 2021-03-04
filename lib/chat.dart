import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state.dart';
import 'chat_header.dart';
import 'chat_container.dart';
import 'chat_footer.dart';
import 'device_config.dart';

class ChatScreen extends StatelessWidget {
  FocusNode dummyFocusNode;
  ChatScreen();

  @override
  Widget build(BuildContext context) {
    AppState.i.deviceData = DeviceData.init(context);
    AppState.i.systemBrightness = Brightness.light;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(dummyFocusNode),
      child: Container(
          //color: kBackgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: <Widget>[
                    //const WhiteFooter(),
                    ChatContainer()
                  ],
                ),
              ),
              ChatFooter(isActive: true)
            ],
          ),
        ),
    );
  }
}