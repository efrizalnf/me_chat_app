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
    String poto = "";
    String username = "";
    return Scaffold(
      backgroundColor: Colors.black,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              forceElevated: innerBoxIsScrolled,
              backgroundColor: Colors.black,
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
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
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
                    ? Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 45.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 24.0,
                              backgroundImage: NetworkImage(
                                poto,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  username,
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        color: Colors.white,
                                        offset: Offset.zero,
                                        blurRadius: 10.0,
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Text(
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
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            radius: 24.0,
                            backgroundImage: NetworkImage(
                              poto,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            username,
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                background: Image.network(
                  "https://source.unsplash.com/9aCkSl6YcXg",
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
                            poto = chatMessage['photo'];
                            username = chatMessage['username'];
                            // print(nextChatMessage['createdAt']);
                            final currentMessageUserId = chatMessage['uid'];
                            final nextMessageUserId = nextChatMessage != null
                                ? nextChatMessage['uid']
                                : null;
                            final nextUserIsSame =
                                nextMessageUserId == currentMessageUserId;
                            // final timeMessage = chatMessage['createdAt'] != nextChatMessage['createdAt'];
                            if (nextUserIsSame) {
                              return MessageBubble.next(
                                  message: chatMessage['message'],
                                  isMe: controller.authUser!.uid ==
                                      currentMessageUserId);
                            } else {
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
  }

  @override
  State<HomeView> createState() => HomeController();
}
