import 'package:flutter/material.dart';

class MenuItemsBuilder {
  MenuItemsBuilder._() {
    buildList();
  }
  static final MenuItemsBuilder _instance = MenuItemsBuilder._();

  factory MenuItemsBuilder() => _instance;

  List<List<Color>> colors = [
    [Colors.pink.shade900, Colors.blue.shade900, Colors.grey.shade900],
    [Colors.pink.shade900, Colors.purple.shade900, Colors.grey.shade900],
    [Colors.pink.shade900, Colors.pinkAccent.shade700, Colors.grey.shade900],
    [Colors.blueGrey.shade900, Colors.green.shade900, Colors.teal.shade900],
    [Colors.blueGrey.shade900, Colors.yellow.shade900, Colors.teal.shade900],
    [Colors.cyan.shade900, Colors.deepPurple.shade900, Colors.grey.shade800],
    [Colors.lime.shade900, Colors.lightBlue.shade900, Colors.blue.shade900],
    [Colors.blue.shade900, Colors.pink.shade900, Colors.green.shade900],
    [Colors.green.shade900, Colors.blue.shade900, Colors.pink.shade900],
    [Colors.deepPurple.shade900, Colors.blue.shade900, Colors.grey.shade900],
    [Colors.lightBlue.shade900, Colors.pink.shade900, Colors.green.shade900],
    [Colors.grey.shade900, Colors.blue.shade900, Colors.purple.shade900],
  ];

  final List<DropdownMenuItem<String>> _list = [];
  List<DropdownMenuItem<String>> get list => _list;

  void buildList() {
    for (List<Color> themeColors in colors) {
      _list.add(DropdownMenuItem<String>(
          // child: Text(value),
          value:
              '${themeColors[0].value}_${themeColors[1].value}_${themeColors[2].value}',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lens,
                color: themeColors[0],
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.lens,
                color: themeColors[1],
              ),
              const SizedBox(
                width: 10,
              ),
              Icon(
                Icons.lens,
                color: themeColors[2],
              ),
            ],
          )));
    }
  }
}

void main() {
  for (List<Color> themeColors in MenuItemsBuilder().colors) {
    print(
        '${themeColors[0].value}_${themeColors[1].value}_${themeColors[2].value}');
  }
}
