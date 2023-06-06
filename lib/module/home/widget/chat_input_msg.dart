import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;

class ChatInputMsg extends StatefulWidget {
  final VoidCallback showEmoji;
  final Function onSendMessage;
  final TextEditingController chatController;
  final bool isShowEmoji;

  const ChatInputMsg({
    Key? key,
    required this.showEmoji,
    required this.chatController,
    required this.isShowEmoji,
    required this.onSendMessage,
  }) : super(key: key);

  @override
  State<ChatInputMsg> createState() => _ChatInputMsgState();
}

class _ChatInputMsgState extends State<ChatInputMsg> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Offstage(
          offstage: widget.isShowEmoji,
          child: SizedBox(
            height: 250,
            child: EmojiPicker(
              textEditingController: widget.chatController,
              config: Config(
                columns: 7,
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
              onBackspacePressed: () {},
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              left: 24.0, right: 24.0, bottom: 24.0, top: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(width: 0.1, color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: const Offset(
                    1.0,
                    1.0,
                  ),
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                ), //BoxShadow
              ],
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: MaterialButton(
                        minWidth: 8,
                        onPressed: widget.showEmoji,
                        color: Colors.amber[300],
                        textColor: Colors.black,
                        padding: const EdgeInsets.all(5),
                        shape: const CircleBorder(),
                        child: const Icon(
                          size: 24,
                          Icons.emoji_emotions,
                        ),
                      )

                      // ClipOval(
                      //   child: Material(
                      //     color: Colors.amber, // Button color
                      //     child: InkWell(
                      //       splashColor: Colors.white, // Splash color
                      //       onTap: widget.showEmoji,
                      //       child: const SizedBox(
                      //           width: 35,
                      //           height: 35,
                      //           child: Icon(Icons.emoji_emotions)),
                      //     ),
                      //   ),
                      // ),
                      ),
                  Expanded(
                    child: TextField(
                      controller: widget.chatController,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: false,
                      enableSuggestions: false,
                      keyboardType: TextInputType.multiline,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black87,
                      ),
                      decoration: const InputDecoration(
                          hintText: 'Type a message',
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.only(
                              left: 16.0, bottom: 8.0, top: 8.0, right: 8.0),
                          border: InputBorder.none),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: VerticalDivider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        onPressed: () {
                          widget.onSendMessage(widget.chatController.text);
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.black54,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
