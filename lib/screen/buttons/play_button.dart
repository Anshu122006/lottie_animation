import 'package:flutter/material.dart';

class PlayButton extends StatefulWidget {
  const PlayButton({super.key, required this.controller});

  final AnimationController controller;

  @override
  State<PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<PlayButton> {
  IconData icon = Icons.play_arrow;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            setState(() {
              if (widget.controller.isAnimating) {
                widget.controller.stop();
                icon = Icons.play_arrow;
              } else {
                widget.controller.repeat();
                icon = Icons.pause;
              }
            });
          },
          icon: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
