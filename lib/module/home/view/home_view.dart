import 'package:flutter/material.dart';
import 'package:me_chat_app/core.dart';

import '../../../helper/constant.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  Widget build(context, HomeController controller) {
    controller.view = this;
    bool pinned = true;
    bool snap = false;
    bool floating = false;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              forceElevated: innerBoxIsScrolled,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              pinned: pinned,
              snap: snap,
              toolbarHeight: 100.0,
              collapsedHeight: 100.0,
              expandedHeight: 180.0,
              primary: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top: 45.0, bottom: 15.0),
                  child: PopupMenuButton(
                    icon: const Icon(Icons.more_vert),
                    initialValue: controller.selectedMenuBar,
                    itemBuilder: (context) => <PopupMenuEntry<MenuBarItem>>[
                      PopupMenuItem(
                        value: MenuBarItem.logout,
                        onTap: controller.doLogout,
                        child: const Text('Logout'),
                      ),
                      const PopupMenuItem(
                        value: MenuBarItem.about,
                        child: Text('About'),
                      ),
                    ],
                  ),
                ),
              ],
              floating: floating,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: innerBoxIsScrolled
                    ? const Padding(
                        padding: EdgeInsets.only(left: 16.0, top: 45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 24.0,
                              backgroundImage: NetworkImage(
                                "https://i.ibb.co/PGv8ZzG/me.jpg",
                              ),
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Johny Greenwood",
                                  style: TextStyle(
                                    fontSize: 14.0,
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
                      )
                    : const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 24.0,
                            backgroundImage: NetworkImage(
                              "https://i.ibb.co/PGv8ZzG/me.jpg",
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "Johny Greenwood",
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                background: Image.network(
                  "https://source.unsplash.com/qE5K_972f48",
                  width: 64.0,
                  height: 64.0,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ];
        },
        body: Builder(
          builder: (context) {
            return Stack(
              children: [
                StreamBuilder(
                  stream: controller.getMessageList(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(
                        child: Text('No Message Found'),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something wrong'),
                      );
                    }
                    final messages = snapshot.data!.docs;
                    return Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(40),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: MediaQuery.of(context).size.height * 0.13,
                        ),
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: messages.length,
                          itemBuilder: (ctx, index) {
                            final chatMessage = messages[index].data();
                            final nextChatMessage = index + 1 < messages.length
                                ? messages[index + 1].data()
                                : null;
                            final currentMessageUserId = chatMessage['uid'];
                            final nextMessageUserId = nextChatMessage != null
                                ? nextChatMessage['uid']
                                : null;
                            final nextUserIsSame =
                                nextMessageUserId == currentMessageUserId;
                            if (nextUserIsSame) {
                              return MessageBubble.next(
                                  message: chatMessage['message'],
                                  isMe: controller.authUser!.uid ==
                                      currentMessageUserId);
                            } else {
                              print(chatMessage['photo']);
                              return MessageBubble.first(
                                  userImage: chatMessage['photo'],
                                  username: chatMessage['username'],
                                  message: chatMessage['message'],
                                  isMe: controller.authUser!.uid ==
                                      currentMessageUserId);
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: ChatInputMsg(
                    chatController: controller.chatController,
                    isShowEmoji: controller.isShowEmoji,
                    showEmoji: controller.showEmoji,
                    onSendMessage: controller.sendMessage,
                  ),
                ),
              ],
            );
          },
        ),
      ),
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
