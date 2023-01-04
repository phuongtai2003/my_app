import 'package:flutter/material.dart';
import 'package:my_app/constants/global_variables.dart';

class TopDeal extends StatelessWidget {
  const TopDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Deal of the day",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "Show all",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueAccent,
                ),
              )
            ],
          ),
          Image.network(
            "https://phucanhcdn.com/media/product/46683_ideapad_5_pro_14_cloud_ha1.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              "\$999",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 5,
              right: 5,
            ),
            child: const Text(
              "Laptop Lenovo Ideapad 5 PRO 14ACN6 82L700MAVN",
              style: TextStyle(
                fontSize: 18,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          Container(
            height: 150,
            padding: const EdgeInsets.all(
              8,
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                final image = GlobalVariables.topDeals[index];
                return Container(
                  margin: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                    width: 100,
                    height: 100,
                  ),
                );
              },
              itemCount: GlobalVariables.topDeals.length,
            ),
          ),
        ],
      ),
    );
  }
}
