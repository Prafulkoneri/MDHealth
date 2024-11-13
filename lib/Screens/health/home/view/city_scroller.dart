import 'package:flutter/material.dart';
import 'package:md_health/widget/city_container.dart';

class CityScroller extends StatelessWidget {
  const CityScroller({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CityContainer(
            cityName: 'İstanbul',
          ),
          CityContainer(
            cityName: 'Ankara',
          ),
          CityContainer(
            cityName: 'Jhabalpur',
          ),
          CityContainer(
            cityName: 'Kolapur',
          ),
          CityContainer(
            cityName: 'Pune',
          ),
          CityContainer(
            cityName: 'Mumbai',
          ),
        ],
      ),
    );
  }
}
