// import 'package:animations/database/database.dart';
import 'package:animations/database/model.dart';
import 'package:animations/screen/buttons/animation_buttons.dart';
import 'package:animations/theme/gradient_theme.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class DataBlock extends StatefulWidget {
  const DataBlock({super.key, required this.data, required this.removeItem});

  final AnimationData data;
  final void Function(int) removeItem;

  @override
  State<DataBlock> createState() => _DataBlockState();
}

class _DataBlockState extends State<DataBlock> with TickerProviderStateMixin {
  late AnimationController _controller;
  Widget? _animation;
  final String _errorText = "Can't load animation";

  AnimationController _generateController() {
    AnimationController controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    return controller;
  }

  Future<Widget> _getAnimation() async {
    try {
      final response = await http.get(Uri.parse(widget.data.url));
      final composition = await LottieComposition.fromBytes(response.bodyBytes);
      return SizedBox(
        child: Lottie(
          composition: composition,
          controller: _controller,
          fit: BoxFit.contain,
        ),
      );
    } catch (e) {
      return Center(
        child: Text(
          _errorText,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = _generateController();
  }

  @override
  Widget build(BuildContext context) {
    GradientTheme? gradientTheme = Theme.of(context).extension<GradientTheme>();

    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: gradientTheme?.primaryGradient,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(3, 3),
            color: Theme.of(context).colorScheme.shadow,
          ),
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                _animation ??
                FutureBuilder(
                  future: _getAnimation(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          _errorText,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      return snapshot.data!;
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: AnimationButtons.getDeleteButton(
              widget.data.id,
              widget.removeItem,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: AnimationButtons.getPlayButton(_controller),
          ),
        ],
      ),
    );
  }
}
