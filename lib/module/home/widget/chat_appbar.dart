import 'package:flutter/material.dart';

class ChatAppbar extends StatefulWidget {
  const ChatAppbar({super.key});

  @override
  State<ChatAppbar> createState() => _ChatAppbarState();
}

List<Map> products = [
  {
    "id": 1,
    "photo":
        "https://i.ibb.co/dG68KJM/photo-1513104890138-7c749659a591-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    "product_name": "Frenzy Pizza",
    "price": 25,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 2,
    "photo":
        "https://i.ibb.co/mHtmhmP/photo-1521305916504-4a1121188589-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    "product_name": "Beef Burger",
    "price": 22,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 3,
    "photo":
        "https://images.unsplash.com/photo-1625869016774-3a92be2ae2cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Seperait",
    "price": 33,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 4,
    "photo":
        "https://images.unsplash.com/photo-1578160112054-954a67602b88?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80",
    "product_name": "Fried Rice",
    "price": 31,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 5,
    "photo":
        "https://i.ibb.co/mHCx9Nj/photo-1517487881594-2787fef5ebf7-crop-entropy-cs-tinysrgb-fit-max-fm-jpg-ixid-Mnwy-ODA4-ODh8-MHwxf-H.jpg",
    "product_name": "Terrano Milk",
    "price": 32,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 6,
    "photo":
        "https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    "product_name": "Fried Chicken",
    "price": 49,
    "category": "Food",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 7,
    "photo":
        "https://images.unsplash.com/photo-1525385133512-2f3bdd039054?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=685&q=80",
    "product_name": "Mango Juice",
    "price": 62,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 8,
    "photo":
        "https://images.unsplash.com/photo-1600271886742-f049cd451bba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Orange Juice",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 9,
    "photo":
        "https://images.unsplash.com/photo-1604085792782-8d92f276d7d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80",
    "product_name": "Avocado Juice",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 10,
    "photo":
        "https://images.unsplash.com/photo-1622240506921-042a4e71c172?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Puncak Coffe",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 11,
    "photo":
        "https://images.unsplash.com/photo-1594631252845-29fc4cc8cde9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Silvana Tea",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
  {
    "id": 12,
    "photo":
        "https://images.unsplash.com/photo-1576092768241-dec231879fc3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
    "product_name": "Paradox Tea",
    "price": 56,
    "category": "Drink",
    "description":
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
  },
];

final List<String> categories = [
  'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
      'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
      'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
      'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
      'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
      'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
      'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
      'All',
  'Living Room',
  'Bed Room',
  'Dining Room',
  'Kitchen'
];

SliverList _getSlivers(
    List myList, String category, String photo, BuildContext context) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (BuildContext context, int index) {
        return buildRow(myList[index]["product_name"], myList[index][category],
            myList[index][photo]);
      },
      childCount: myList.length,
    ),
  );
}

buildRow(String product, String price, String photo) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    color: Colors.white,
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.0,
              backgroundImage: NetworkImage(
                photo,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Text(
                  price,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal, fontSize: 14.0),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _ChatAppbarState extends State<ChatAppbar> {
  bool pinned = true;
  bool snap = false;
  bool floating = false;
  @override
  Widget build(BuildContext context) {
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
                  height: 33,
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
          _getSlivers(products, "category", "photo", context)
        ],
      ),
    );
  }
}
