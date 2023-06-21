import 'package:fively/core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ReFavoriteButton extends StatelessWidget {
  const ReFavoriteButton({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box("favorites_box").listenable(),
      builder: (_, value, __) {
        var isFavorite = value.keys.toList().contains(product.id);
        return GestureDetector(
          onTap: () async {
            if (!isFavorite) {
              await Hive.box('favorites_box').put(product.id, product);
            }
            if (isFavorite) {
              await Hive.box("favorites_box").delete(product.id);
            }
          },
          child: Container(
            width: Get.width * 0.10,
            height: Get.height * 0.04,
            decoration:
                BoxDecoration(color: ColorLib.white, shape: BoxShape.circle),
            child: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? ColorLib.primary : ColorLib.gray,
            ),
          ),
        );
      },
    );
  }
}
