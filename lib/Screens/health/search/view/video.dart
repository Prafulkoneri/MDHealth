// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerWidget extends StatefulWidget {
//   final String videoUrl;

//   const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
// }

// class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.network(widget.videoUrl)
//       ..initialize().then((_) {
//         setState(() {});
//         _controller.play();
//       });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _controller.value.isInitialized
//         ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//         : Center(child: CircularProgressIndicator());
//   }
// }
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

// Widget to display media (image or video)
class MediaWidget extends StatefulWidget {
  final String url;
  final bool isVideo;

  const MediaWidget({
    required this.url,
    this.isVideo = false,
    Key? key,
  }) : super(key: key);

  @override
  _MediaWidgetState createState() => _MediaWidgetState();
}

class _MediaWidgetState extends State<MediaWidget> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.isVideo) {
      _controller = VideoPlayerController.network(widget.url)
        ..initialize().then((_) {
          setState(() {});
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isVideo
        ? _controller == null || !_controller!.value.isInitialized
            ? Center(child: CircularProgressIndicator())
            : AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
        : Image.network(widget.url, fit: BoxFit.cover);
  }

  @override
  void dispose() {
    if (widget.isVideo) {
      _controller?.dispose();
    }
    super.dispose();
  }
}
