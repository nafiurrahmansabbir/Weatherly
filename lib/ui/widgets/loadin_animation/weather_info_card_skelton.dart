import 'package:flutter/material.dart';
import 'package:weatherly/ui/widgets/loadin_animation/skelton.dart';

class WeatherInfoCardSkelton extends StatelessWidget {
  const WeatherInfoCardSkelton({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Skelton(height: 300,width: screenWidth,opacity: 0.04,
      child: Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skelton(height: 20, width: 200, opacity: 0.08),
            const SizedBox(height: 10,),
            Skelton(height: 20, width: 80, opacity: 0.08),
            const SizedBox(height: 10,),
            Skelton(height: 20, width: 130, opacity: 0.08),
            Center(child: Skelton(height: 100, width: 130, opacity: 0.04)),
            const SizedBox(height: 10,),
            Center(child: Skelton(height: 20, width: 130, opacity: 0.04)),
          ],
        ),
      ),
    );
  }
}