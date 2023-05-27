import 'package:fively/core.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Get.width * 0.02),
          color: ColorLib.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Get.width * 0.02),
                bottomLeft: Radius.circular(Get.width * 0.02)),
            child: Image.asset(
              'assets/images/banner.jpeg',
              width: Get.width * 0.28,
              height: Get.height * 0.13,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: Get.width * 0.03,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pullover'),
                      Row(
                        children: [Text('Color: Black'), Text('Size:L')],
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.more_vert))
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.remove)),
                      const Text('1'),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  const Text('5\$')
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
