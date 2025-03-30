import 'package:animations/database/database.dart';
import 'package:animations/database/model.dart';
import 'package:animations/screen/blocks/add_block.dart';
import 'package:animations/screen/blocks/data_block.dart';
import 'package:animations/screen/input_screen.dart';
import 'package:animations/theme/gradient_theme.dart';
import 'package:animations/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class AnimationCollage extends StatefulWidget {
  const AnimationCollage({super.key});

  @override
  State<AnimationCollage> createState() => _AnimationCollageState();
}

class _AnimationCollageState extends State<AnimationCollage> {
  List<AnimationData>? _animationList;

  Future<List<AnimationData>> get animationList async {
    if (_animationList == null) {
      try {
        _animationList = await DatabaseManager.getAnimationList();

        _animationList!.add(AnimationData.fromJson({"id": -1, "url": ""}));
      } catch (e) {
        // ignore: avoid_print
        print(e);
      }
    }

    return _animationList!;
  }

  Future<void> _addItem(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      // ignore: unused_local_variable
      final composition = await LottieComposition.fromBytes(response.bodyBytes);

      int id = await DatabaseManager.addAnimation(url);
      setState(() {
        _animationList!.insert(
          _animationList!.length - 1,
          AnimationData.fromJson({"id": id, "url": url}),
        );
      });
    } catch (e) {
      // ignore: avoid_print
      print(e);
      rethrow;
    }
  }

  void _removeItem(int id) async {
    await DatabaseManager.deleteAnimation(id);
    setState(() {
      for (var animation in _animationList!) {
        if (animation.id == id) {
          _animationList!.remove(animation);
          break;
        }
      }
    });
  }

  _takeInput() {
    // TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            padding: EdgeInsets.all(16),
            child: InputScreen(addItem: _addItem),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // var url = "";
    // url =
    //     "https://lottie.host/9203b1c0-d7b7-4515-a92c-c1365c816b97/brB0eRNbIg.json";
    // _addItem(url);

    // url =
    //     "https://lottie.host/7401522f-2d8b-4049-ad18-eb0edb6af224/CE9lFrNlEH.json";
    // _addItem(url);
    // DatabaseManager.deleteDb();

    // _addItem("url");
  }

  @override
  Widget build(BuildContext context) {
    double height = HDimensions.screenHeight(context);
    double width = HDimensions.screenWidth(context);
    GradientTheme? gradientTheme = Theme.of(context).extension<GradientTheme>();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Animations!",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: gradientTheme?.appBarGradient),
        ),
        elevation: 6,
        shadowColor: Theme.of(context).colorScheme.shadow,
      ),
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(top: 10),
        // color: Theme.of(context).colorScheme.surface,
        decoration: BoxDecoration(gradient: gradientTheme?.surfaceGradient),
        child: FutureBuilder(
          future: animationList,
          builder: (context, snapshot) {
            Widget child = Center(child: CircularProgressIndicator());

            if (snapshot.hasData) {
              child = GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  Widget block;
                  if (snapshot.data![index].id == -1) {
                    block = AddBlock(ontap: _takeInput);
                  } else {
                    block = DataBlock(
                      data: snapshot.data![index],
                      removeItem: _removeItem,
                    );
                  }
                  return block;
                },
              );
            } else if (snapshot.hasError) {
              child = Center(
                child: Text(
                  "Error",
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              );
            }

            return child;
          },
        ),
      ),
    );
  }
}
