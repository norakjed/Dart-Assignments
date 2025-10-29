import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        padding: EdgeInsets.all(40),
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Color(0xFF4e7df5), Color(0xFF0335b6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            ),
                child: Center(
                  child: Text(
                    "Hello 1",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Color(0xFF4e7df5), Color(0xFF0335b6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            ),
                child: Center(
                  child: Text(
                    "Hello 2",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: LinearGradient(
                    colors: [Color(0xFF4e7df5), Color(0xFF0335b6)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
            ),
                child: Center(
                  child: Text(
                    "Hello 3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
              ),
            ],
          ), 
        )
      )
    )
  );
}

// class GradientButton extends StatelessWidget{
//   const GradientButton({super.key}),

//   @override
//   State @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }