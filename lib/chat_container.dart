import 'dart:async';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'content_message_embellished.dart';
import 'enums.dart';
import 'chat_item.dart';
import 'device_config.dart';
import 'app_state.dart';

class ChatContainer extends StatefulWidget {
  @override
  _ChatContainerState createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer> {
  final String activeChatGroupId = "1";
  final String activeUserId = "1";
  final _scrollController = ItemScrollController();
  final _scrollControllerList = ScrollController();
  //final listKey = GlobalKey<HugeListViewState>();
  final myController = TextEditingController();
  bool isFirstDisplay = true;
  int previousCount = -1;
  int currentItemCount = 0;
  GlobalKey<AnimatedListState> _hlvKey1 = GlobalKey();
  GlobalKey _hlvKey = GlobalKey();
  Timer _timer;
  bool callbackScheduled = false;
  StreamController<int> watchStream = StreamController<int>();

  _ChatContainerState();

  @override
  void initState() {
    super.initState();
    watchStream.add(currentItemCount);
    // For testing add a new item every X seconds - this can be varied to demo
    // different levels of glitchiness
    // 1 / sec is enough to cause glitch / bouncy scroll
    _timer = Timer.periodic(Duration(seconds:1), (t) {
      Random random = new Random();
      int items = random.nextInt(10);
      for (int i = 0; i < 1; i++) {
        // watchStream.add(++currentItemCount);
        // watchStream.add(++currentItemCount);
        // watchStream.add(++currentItemCount);
        watchStream.add(++currentItemCount);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String getRandString() {
    var random = Random.secure();
    var values = List<int>.generate(random.nextInt(20), (i) =>  random.nextInt(20));
    return base64UrlEncode(values);
  }

  @override
  Widget build(BuildContext context) {
    DeviceData deviceData = DeviceData.init(context);
print("ListBuild!!!");
    return Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splash.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: deviceData.screenHeight * 0.009),
                    child: Container(
                      color: Colors.transparent,
                      child:
                        StreamBuilder<int>(
                          stream: watchStream.stream,
                          builder: (BuildContext context, AsyncSnapshot snapshot) {
                            //print('Made it to builder: ${snapshot.hasData}${chatBloc.groupMessageCountStream}');
                            if (!snapshot.hasData) return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppState.i.progressIndicatorColour)));
                            if (snapshot.data == 0) return Container();
                            // Smoooooooth :-)
                            //return getListView(snapshot);
                            // Gliiiiiiiiiiitchy :-(
                            return getScrollablePositionedListView(snapshot);
                          }
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
  }

  Widget getScrollablePositionedListView(AsyncSnapshot snapshot) {
    if (previousCount != snapshot.data) {
      if (!callbackScheduled) {
        callbackScheduled = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print('ScrollConfirmed AnimatedListView: ${snapshot.data}');
          if (isFirstDisplay) {
            _scrollController.jumpTo(
              index: snapshot.data - 1
            );
            isFirstDisplay = false;
          } else {
            _scrollController.scrollTo(
              index: snapshot.data - 1,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOutCubic
            );
          }
          callbackScheduled = false;
        });          
      }
    }    
    previousCount = snapshot.data;
    return ScrollablePositionedList.builder(
      reverse: false,
      key: _hlvKey,
      itemScrollController: _scrollController,
      //itemPositionsListener: ,
      //physics: _MaxVelocityPhysics(velocityThreshold: widget.velocityThreshold),
      initialScrollIndex: snapshot.data - 1,
      itemCount: snapshot.data,
      itemBuilder: (context, index) {
        print('Item: $index requested');
        return ChatItem(key: GlobalKey(), message: ContentMessageEmbellished(cm: ContentMessage(messageText: index.toString() * 20, contentGroupId: activeChatGroupId, messageFlow: MessageFlow.outgoing,
                        messageType: MessageType.text, createdAt: DateTime.now(), creatorId: AppState.i.activeUserId,
                        previousMessageCreatorId: AppState.i.activeUserId, isPinned: false, messageStatus: MessageStatusType.created),
                        ));
      },
    );
  }

  Widget getListView(AsyncSnapshot snapshot) {
    print('Rebuilding list view');
    if (previousCount != snapshot.data) {
      if (previousCount != -1) {
        if (_hlvKey1.currentState != null) {
          for (int i = 0; i < snapshot.data - previousCount; i++) {
            _hlvKey1.currentState.insertItem(previousCount + i);
          }
          previousCount = snapshot.data;
        }
      } else {
        previousCount = snapshot.data;
      }
      if (!callbackScheduled) {
        callbackScheduled = true;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          print('ScrollConfirmed AnimatedListView: ${snapshot.data}');
          if (isFirstDisplay) {
            _scrollControllerList.jumpTo(
              _scrollControllerList.position.maxScrollExtent
            );
            isFirstDisplay = false;
          } else {
            _scrollControllerList.animateTo(
              _scrollControllerList.position.maxScrollExtent,
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOutCubic
            );
          }
          callbackScheduled = false;
        });          
      }
    }
    return AnimatedList(
      key: _hlvKey1,
      initialItemCount: snapshot.data,
      controller: _scrollControllerList,
      itemBuilder: (context, index, entry) {
        print('Item: $index requested');
        return ChatItem(message: ContentMessageEmbellished(cm: ContentMessage(messageText: index.toString() * 20, contentGroupId: activeChatGroupId, messageFlow: MessageFlow.outgoing,
                        messageType: MessageType.text, createdAt: DateTime.now(), creatorId: AppState.i.activeUserId,
                        previousMessageCreatorId: AppState.i.activeUserId, isPinned: false, messageStatus: MessageStatusType.created),
                        ));
      },
    );
  }
}