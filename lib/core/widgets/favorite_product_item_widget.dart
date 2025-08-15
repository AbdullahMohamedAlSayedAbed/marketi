import 'package:flutter/material.dart';

class FavoriteProductItemWidget extends StatelessWidget {
  const FavoriteProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
      ),
      child: Icon(Icons.favorite_outlined),
    );
  }
}
