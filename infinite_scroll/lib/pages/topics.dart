import 'package:flutter/material.dart';
import 'package:infinite_scroll/utils/topic.dart';

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  List<String> topics = [];
  String selTopic = "";

  initState() {
    super.initState();

    topics = ["aaa", "bbb", "ccc", "ddd", "eee", "ffffffff", "ggg", "hhh", "iii"];
    selTopic = topics[0];
  }
  
  List<Widget> generateTopics() {
    List<Widget> res = [];
    for (String top in topics) {
      res.add(Topic(text: top, selected: selTopic == top, onSelect: () {
        updateSelectedTopic(top);
      },));
      res.add(SizedBox(width: 10));
    }

    return res;
  }

  updateSelectedTopic(String topic) {
    setState(() {
      selTopic = topic;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("topics"),
      ),
      body: Column(
        children: [
          // topics
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: generateTopics(),
              ),
            ),
          ),

          // print topic name
          Text(selTopic)
        ],
      )
    );
  }
}