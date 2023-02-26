import 'package:chewie/chewie.dart';
import 'Package:flutter/material.dart';
import 'package:video_player/video_player.dart';


class ChewiVideo extends StatefulWidget {

  final VideoPlayerController? videoPlayerController;
  final bool? looping;

  const ChewiVideo({super.key, this.videoPlayerController, this.looping});


  @override
  _ChewiVideoState createState() => _ChewiVideoState();
}

class _ChewiVideoState extends State<ChewiVideo> {

  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
        videoPlayerController: widget.videoPlayerController!,
      aspectRatio: 16/9,
      autoInitialize: true,
      looping: widget.looping!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(15),
      child:Chewie(controller: _chewieController!),
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.videoPlayerController!.dispose();
    _chewieController!.dispose();

  }

}
