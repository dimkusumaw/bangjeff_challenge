import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComicBackButton extends StatelessWidget {
  const ComicBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(50),
          onTap: () => Get.back(),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2),
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(2, 2),
                  blurRadius: 0,
                )
              ],
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}