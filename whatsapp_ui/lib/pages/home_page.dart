import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  int selectedTab = 1;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.green,
            controller: _tabController,
            onTap: (int index) {
              setState(() {
                selectedTab = index;
              });
            },
            tabs: [
              Container(
                  width: 20,
                  child: Tab(
                    icon: Icon(Icons.camera_alt_rounded),
                  )),
              Container(
                  width: 80,
                  child: Tab(
                    child: Text(
                      "Chats",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedTab == 1 ? Colors.green : Colors.grey),
                    ),
                  )),
              Container(
                  width: 80,
                  child: Tab(
                    child: Text(
                      "Status",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedTab == 2 ? Colors.green : Colors.grey),
                    ),
                  )),
              Container(
                  width: 80,
                  child: Tab(
                    child: Text(
                      "Calls",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: selectedTab == 3 ? Colors.green : Colors.grey),
                    ),
                  )),
            ],
          ),
          title: Text('WhatsApp'),
          actions: [Icon(Icons.search), Icon(Icons.more_vert)],
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}
