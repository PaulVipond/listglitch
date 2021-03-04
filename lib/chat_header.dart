import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ChatHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformAppBar(
      title: new Text('Account Setup'),
      leading: PlatformIconButton(materialIcon: Icon(Icons.arrow_back)),
        // trailingActions: <Widget>[
        //   PlatformIconButton(materialIcon: Icon(Icons.arrow_back)),
        // ],
    );
  }
}