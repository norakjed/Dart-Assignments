import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("Ronan the BEst")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(itemCount: 400, itemBuilder: _buildItem),
        ),
      ),
    ),
  );
}

Widget _buildItem(BuildContext context, int index) {
  print("Build item $index");

  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 50,
      color: Colors.red,
      child: Text("Hello widget $index"),
    ),
  );
}
