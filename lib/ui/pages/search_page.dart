import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: ListView(
        children: [
          Container(
              height: size.height * 0.3,
              child: Row(
                children: [
                  Expanded(flex: 1, child: Container(color: Colors.blueAccent))
                ],
              )),
          Container(
            height: size.height * 0.3,
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.pinkAccent)),
                Expanded(
                    child: Container(
                        child: Column(
                  children: [
                    Expanded(child: Container(color: Colors.redAccent)),
                    Expanded(child: Container(color: Colors.black))
                  ],
                )))
              ],
            ),
          ),
          Container(
            height: size.height * 0.15,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.orangeAccent)),
                Expanded(flex: 1, child: Container(color: Colors.blueAccent)),
                Expanded(flex: 1, child: Container(color: Colors.orange))
              ],
            ),
          ),
          Container(
            height: size.height * 0.15,
            child: Row(
              children: [
                Expanded(flex: 1, child: Container(color: Colors.red)),
                Expanded(flex: 1, child: Container(color: Colors.black)),
                Expanded(flex: 1, child: Container(color: Colors.pink))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
