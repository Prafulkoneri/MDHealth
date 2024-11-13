import 'package:flutter/material.dart';

class NewAppNetworkImages extends StatelessWidget {
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? imageUrl;
  final bool? showShopImage;

  const NewAppNetworkImages({
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.imageUrl,
    this.showShopImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: showShopImage == true && !imageUrl!.endsWith('.mp4')
          ? Image.network(
              imageUrl ?? "",
              fit: fit,
              errorBuilder: (context, exception, stackTrace) {
                print("Image load failed");
                return Image.asset("assets/images/image 54.png");
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
            )
          : VideoThumbnail(videoUrl: imageUrl),
    );
  }
}

class VideoThumbnail extends StatelessWidget {
  final String? videoUrl;

  VideoThumbnail({Key? key, this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Placeholder image for videos
        Image.asset(
          "assets/images/download.png",
          fit: BoxFit.cover,
        ),
        Center(
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 50.0,
          ),
        ),
      ],
    );
  }
}
