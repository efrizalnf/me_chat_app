import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';
import 'package:me_chat_app/module/home/widget/chat_list_msg.dart';
import '../controller/home_controller.dart';

import '../widget/chat_input_msg.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;
    bool pinned = true;
    bool snap = false;
    bool floating = true;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            leadingWidth: 0,
            pinned: pinned,
            snap: snap,
            toolbarHeight: 100.0,
            collapsedHeight: 100.0,
            primary: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 45.0, bottom: 15.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 24.0,
                    backgroundImage: NetworkImage(
                      "https://i.ibb.co/PGv8ZzG/me.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Johny Greenwood",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          shadows: [
                            Shadow(
                              color: Colors.white,
                              offset: Offset.zero,
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "Online",
                        style: TextStyle(
                          fontSize: 12.0,
                          color: Colors.green,
                          shadows: [
                            Shadow(
                              color: Colors.white,
                              offset: Offset.zero,
                              blurRadius: 4.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 45.0, bottom: 15.0),
                child: IconButton(
                    icon: const Icon(Icons.more_vert), onPressed: () {}),
              )
            ],
            floating: floating,
            expandedHeight: 155,
            flexibleSpace: Stack(children: [
              Positioned.fill(
                child: FlexibleSpaceBar(
                  background: Image.network(
                    "https://source.unsplash.com/qE5K_972f48",
                    width: 64.0,
                    height: 64.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Positioned(
                bottom: -7,
                left: 0,
                right: 0,
                child: Container(
                  // height: 33,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                ),
              )
            ]),
          ),
          Expanded(
            child: controller.getSlivers(),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ChatInputMsg(
                  chatController: controller.chatController,
                  isShowEmoji: controller.isShowEmoji,
                  showEmoji: controller.showEmoji,
                  onSendMessage: controller.sendMessage,
                ),
              ),
            ),
          )
        ],
      ),
      // bottomNavigationBar: Container(
      //   width: double.maxFinite,
      //   child: ChatInputMsg(
      //     chatController: controller.chatController,
      //     isShowEmoji: controller.isShowEmoji,
      //     showEmoji: controller.showEmoji,
      //     onSendMessage: controller.sendMessage,
      //   ),
      // ),
    );

    // Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Me Chat"),
    //     actions: [
    //       IconButton(
    //         onPressed: controller.doLogout,
    //         icon: const Icon(
    //           Icons.exit_to_app,
    //         ),
    //       )
    //     ],
    //   ),
    //   body: Column(
    //     children: [
    //       Expanded(
    //         child: ChatListMsg(
    //           stream: controller.getMessageList(),
    //           userId: controller.authUser!,
    //         ),
    //       ),
    //       ChatInputMsg(
    //         chatController: controller.chatController,
    //         isShowEmoji: !controller.isShowEmoji,
    //         showEmoji: controller.showEmoji,
    //         onSendMessage: controller.sendMessage,
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  State<HomeView> createState() => HomeController();
}
