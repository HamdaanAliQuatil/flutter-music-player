import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ui_test/models/cardModel.dart';
import 'package:ui_test/ui_components/cards/recentCard.dart';
import 'package:ui_test/ui_components/cards/recommendedCard.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({
    Key? key,
    required this.recommendationCards,
    required this.recentCards,
  }) : super(key: key);

  final List<Cards> recommendationCards;
  final List<Cards> recentCards;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended',
                  style: TextStyle(
                    color: Color(0xff515979),
                    fontSize: 15,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xff4A80F0),
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 220,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommendationCards.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Recommendation_Card(
                        recommendationCards: recommendationCards, index: index),
                  );
                }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent',
                  style: TextStyle(
                    color: Color(0xff515979),
                    fontSize: 15,
                    fontFamily: 'SF Pro Display',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'See all',
                    style: TextStyle(
                      color: Color(0xff4A80F0),
                      fontSize: 15,
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: GridView.builder(
              itemCount: min(4, recentCards.length),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 150,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 15,
                  maxCrossAxisExtent: 250.0),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {},
                  child: Recent_Card(recentCards: recentCards, index: index),
                );
              },
              // children: recentCards.map((data) => Recent_Cards(data: data)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
