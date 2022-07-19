import 'package:flutter/material.dart';
import '/models/cardModel.dart';

class AppBar_Card extends StatelessWidget {
  const AppBar_Card({
    Key? key,
    required this.index,
    required this.clickedIndex,
    required this.appBarCards,
  }) : super(key: key);

  final int index;
  final int clickedIndex;
  final List<Cards> appBarCards;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: index==0? const EdgeInsets.only(right: 20, top: 30, bottom: 10, left: 20) : const EdgeInsets.only(right: 20, top: 30, bottom: 10, left: 0),
      decoration: BoxDecoration(
          color: clickedIndex==index? appBarCards[index].color: const Color.fromRGBO(28, 32, 49, 1),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          boxShadow: [BoxShadow(
            color: appBarCards[index].color!.withOpacity(0.5),
            blurRadius: clickedIndex==index? 10.0 : 0,
          ),]
      ),
      child: Center(child: Text(
        appBarCards[index].title!,
        style: TextStyle(
          fontFamily: 'SF Pro Display',
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),

      )
      ),
    );
  }
}