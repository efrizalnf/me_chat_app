import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import '../controller/home_controller.dart';
import 'package:flutter/foundation.dart' as foundation;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: const [],
      ),
      body: Column(
        children: [
          const Spacer(),
          Container(
              height: 66.0,
              color: Colors.green,
              child: Row(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () {
                        controller.showEmoji();
                      },
                      icon: const Icon(
                        Icons.emoji_emotions,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextField(
                          controller: controller.controller,
                          style: const TextStyle(
                              fontSize: 20.0, color: Colors.black87),
                          decoration: InputDecoration(
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                left: 16.0, bottom: 8.0, top: 8.0, right: 16.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          )),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        onPressed: () {
                          // send message
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        )),
                  )
                ],
              )),
          Offstage(
            offstage: !controller.emojiShowing,
            child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  textEditingController: controller.controller,
                  config: Config(
                    columns: 7,
                    // Issue: https://github.com/flutter/flutter/issues/28894
                    emojiSizeMax: 32 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
                            ? 1.30
                            : 1.0),
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: const Color(0xFFF2F2F2),
                    indicatorColor: Colors.green,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.green,
                    backspaceColor: Colors.green,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    showRecentsTab: true,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: const Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    loadingIndicator: const SizedBox.shrink(),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: const CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                    checkPlatformCompatibility: true,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  @override
  State<HomeView> createState() => HomeController();
}
