import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNetworkImages extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? imageUrl;
  final bool? showShopImage;
  const AppNetworkImages(
      {Key? key,
      this.width,
      this.height,
      this.fit,
      this.imageUrl,
      this.showShopImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.2.w, color: const Color.fromARGB(255, 163, 160, 160)),
          borderRadius: BorderRadius.circular(10)),
      height: height,
      width: width,
      child: Image.network(
        imageUrl ?? "",
        fit: fit,
        errorBuilder: (context, exception, stackTrace) {
          print("hello");
          return showShopImage == true
              ? Image.asset("assets/images/defaultimage.png")
              : Image.asset(
                  "assets/images/defaultimage.png",
                  // fit: BoxFit.contain,
                );
        },
        loadingBuilder:
            (context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}
