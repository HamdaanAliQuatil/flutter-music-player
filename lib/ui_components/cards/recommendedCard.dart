import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:ui_test/models/cardModel.dart';

class Recommendation_Card extends StatelessWidget {
  const Recommendation_Card({
    Key? key,
    required this.index,
    required this.recommendationCards,
  }) : super(key: key);

  final int index;
  final List<Cards> recommendationCards;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 310,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: index==0? const EdgeInsets.only(right: 20, top: 15, bottom: 15, left: 20) : const EdgeInsets.only(right: 20, top: 15, bottom: 15, left: 0),
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: const BorderRadius.all(Radius.circular(30.0)),
          boxShadow: [BoxShadow(
            color: recommendationCards[index].color!.withOpacity(0.4),
            blurRadius: 15.0,
          ),],
          image: DecorationImage(
            image: AssetImage('assets/themes/background ' + recommendationCards[index].theme! + '.png'),
            // colorFilter: ColorFilter.mode(Color(0xffFFD541), BlendMode.color),
            fit: BoxFit.cover,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recommendationCards[index].title!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  recommendationCards[index].subtitle!,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 20,
                    fontFamily: 'SF Pro Display',
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/' + recommendationCards[index].icon1! + '.svg',
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
                const SizedBox(width: 10),
                SvgPicture.asset(
                  'assets/icons/' + recommendationCards[index].icon2! + '.svg',
                  color: Colors.white,
                  width: 30,
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}