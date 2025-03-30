import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> with TickerProviderStateMixin {
  AnimationController _generateController() {
    AnimationController controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    return controller;
  }

  Future<Widget> _getAnimation(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final composition = await LottieComposition.fromBytes(response.bodyBytes);
      return SizedBox(
        child: Lottie(
          composition: composition,
          controller: _generateController(),
          height: 200,
          width: 200,
          fit: BoxFit.contain,
        ),
      );
    } catch (e) {
      return Text("can't load animation");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _getAnimation(
          "https://lottie.host/9203b1c0-d7b7-4515-a92c-c1365c816b97/brB0eRNbIg.json",
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Can't load the animation");
          } else if (snapshot.hasData) {
            return snapshot.data!;
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
