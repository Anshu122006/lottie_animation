// import 'package:animations/database/database.dart';
import 'dart:ffi';

import 'package:animations/theme/theme_data.dart';
import 'package:flutter/material.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key, required this.addItem});
  final Future<void> Function(String) addItem;

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _textController = TextEditingController();
  final String _hintText = "please enter the url";
  final String _buttonText = "Add";
  bool _hasError = false;
  final String _errorText = "INVALID URL";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: TextField(
                controller: _textController,
                cursorColor: const Color.fromARGB(255, 79, 79, 79),
                decoration: InputDecoration(
                  hintText: _hintText,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w200,
                  ),
                  contentPadding: EdgeInsets.all(20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(34)),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(255, 35, 35, 35),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 29),
              child: ElevatedButton(
                onPressed: () async {
                  try {
                    String url = _textController.text;
                    await widget.addItem(url);
                    setState(() {
                      _hasError = false;
                    });
                    Navigator.pop(context);
                  } catch (e) {
                    // print(e);
                    setState(() {
                      _hasError = true;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 28, 28, 28),
                  shadowColor: AppThemes.light.colorScheme.shadow,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    _buttonText,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: AnimatedOpacity(
              opacity: _hasError ? 1 : 0,
              duration: Duration(microseconds: 400),
              child: Text(
                _errorText,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
