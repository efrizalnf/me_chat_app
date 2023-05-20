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
        Container(
          height: 66.0,
          color: Colors.green,
          child: Row(
            children: [
              Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: widget.showEmoji,
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
                      controller: widget.chatController,
                      textCapitalization: TextCapitalization.sentences,
                      autocorrect: true,
                      enableSuggestions: true,
                      keyboardType: TextInputType.multiline,
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
                      print('Send message');
                      widget.onSendMessage(widget.chatController.text);
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    )),
              )
            ],
          ),
        ),
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
      ],
    );
  }
}
