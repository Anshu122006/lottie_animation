import 'package:animations/screen/buttons/delete_button.dart';
import 'package:animations/screen/buttons/play_button.dart';
import 'package:flutter/material.dart';

class AnimationButtons {
  static getPlayButton(AnimationController controller) {
    return PlayButton(controller: controller);
  }

  static getDeleteButton(int id, void Function(int) removeItem) {
    return DeleteButton(id: id, removeItem: removeItem);
  }
}
