import 'package:flutter/material.dart';

import 'app_state.dart';
import 'device_config.dart';

class SendIcon extends StatelessWidget {
  final TextEditingController textController;

  const SendIcon({
    Key key,
    @required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceData = DeviceData.init(context);
    return Container(
      padding: EdgeInsets.only(
          top: AppState.i.chatFooterSendIconHorVerInsets,
          bottom: AppState.i.chatFooterSendIconHorVerInsets,
          left: AppState.i.chatFooterSendIconHorVerInsets,
          right: AppState.i.chatFooterSendIconLeftRightInsets),
      child: InkResponse(
        child: Icon(
          Icons.send,
          color: AppState.i.chatFooterHighlightedIconsColour,
          size: AppState.i.chatFooterStandardIconSize,
        ),
        // onTap: () async {
        //   if (controller.text.trim().isNotEmpty) {
        //         BlocProvider.of<MessagesBloc>(context).add(
        //         MessageSent(message: controller.text, friendId: friendId));
        //   }
        // },
      ),
    );
  }
}