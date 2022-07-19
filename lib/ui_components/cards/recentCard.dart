import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import '/models/cardModel.dart';

class Recent_Card extends StatelessWidget {
  const Recent_Card({
    Key? key,
    required this.recentCards, required this.index
  }) : super(key: key);

  final List<Cards> recentCards;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25.0)),
        boxShadow: [BoxShadow(
          color: recentCards[index].color!.withOpacity(0.4),
          blurRadius: 10.0,
        ),],
        image: DecorationImage(
          image: AssetImage('assets/themes/background ' + recentCards[index].theme! + '.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              recentCards[index].title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'SF Pro Display',
                fontWeight: FontWeight.w700,
              ),
            ),
            SvgPicture.asset(
              'assets/icons/' + recentCards[index].icon1! + '.svg',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}