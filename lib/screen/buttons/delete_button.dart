import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key, required this.id, required this.removeItem});

  final int id;
  final void Function(int) removeItem;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        removeItem(id);
        // DatabaseManager.deleteAnimation(id);
      },
      icon: Transform.scale(
        scale: 1.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
    );
  }
}
