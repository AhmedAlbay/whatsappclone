import 'package:flutter/material.dart';

class OwnFiledCard extends StatelessWidget {
  const OwnFiledCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
       // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        width: MediaQuery.of(context).size.width / 1.8,
        height: MediaQuery.of(context).size.height / 2.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green[300],
        ),
        child: Card(
          margin: EdgeInsets.all(3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15)
          ),
        ),
      ),
    );
  }
}
