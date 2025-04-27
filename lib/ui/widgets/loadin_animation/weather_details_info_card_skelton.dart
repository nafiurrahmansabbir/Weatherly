import 'package:flutter/material.dart';
import 'package:weatherly/ui/widgets/loadin_animation/skelton.dart';

class WeatherDetailsInfoCardSkelton extends StatelessWidget {
  const WeatherDetailsInfoCardSkelton({
    super.key,
    // required this.screenWidth,
  });

  // final double screenWidth=;

  final double boxHeight=90;
  final double boxWidth=100;
  final double boxOpacity=0.05;

  @override
  Widget build(BuildContext context) {
    final double screenWidth=MediaQuery.of(context).size.width;
    return Skelton(height: 250, width: screenWidth, opacity: 0.04,
      child:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skelton(height:boxHeight, width: boxWidth, opacity: boxOpacity),
                Skelton(height:boxHeight, width: boxWidth, opacity: boxOpacity),
                Skelton(height:boxHeight, width: boxWidth, opacity: boxOpacity),
              ],
            ),
            const SizedBox(height: 8,),
            Skelton(height: 1, width: screenWidth, opacity: 0.04),
            const SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skelton(height:boxHeight, width: boxWidth, opacity: boxOpacity),
                Skelton(height:boxHeight, width: boxWidth, opacity: boxOpacity),
                Skelton(height:boxHeight, width: boxWidth, opacity: boxOpacity),
              ],
            ),

          ],
        ),
      ),
    );
  }
}