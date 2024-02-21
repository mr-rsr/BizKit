import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(0.05 * width, 50, 0.05 * width, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: width < 720
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: width < 720
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text("Welcome to",
                      style: customTextStyle(
                          width > 720
                              ? 48
                              : width > 400
                                  ? 32
                                  : 24,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Flexible(
                  child: Text(
                    "Your Ultimate Business Strategy Toolkit",
                    textAlign: width < 400 ? TextAlign.center : TextAlign.start,
                    softWrap: true,
                    style: customTextStyle(width > 720
                        ? 32
                        : width > 400
                            ? 24
                            : 16),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                AnimatedTextKit(
                  // totalRepeatCount: 10,
                  repeatForever: true,
                  animatedTexts: [
                    TyperAnimatedText('Create Business Canvas Model',
                        textStyle: customTextStyle(
                            width > 720
                                ? 32
                                : width > 400
                                    ? 24
                                    : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber)),
                    TyperAnimatedText('Perform SWOT Analysis',
                        textStyle: customTextStyle(
                            width > 720
                                ? 32
                                : width > 400
                                    ? 24
                                    : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber)),
                    TyperAnimatedText('Craft Your Business Identity',
                        textStyle: customTextStyle(
                            width > 720
                                ? 32
                                : width > 400
                                    ? 24
                                    : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber)),
                    TyperAnimatedText('Create Pitch Your Idea Model',
                        textStyle: customTextStyle(
                            width > 720
                                ? 32
                                : width > 400
                                    ? 24
                                    : 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber)),
                  ],
                ),
                const SizedBox(height: 50),
                width < 720
                    ? const Image(
                        image: AssetImage('../../../assets/images/home.png'),
                        height: 240,
                      )
                    : const SizedBox(),
                const SizedBox(height: 50),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Transform Your Ideas Into Reality. Lets Explore",
                      style: customTextStyle(width > 720
                          ? 20
                          : width > 400
                              ? 16
                              : 14),
                    ),
                    const SizedBox(width: 10, height: 20),
                    Center(
                      child: SizedBox(
                        height: width > 720
                            ? 35
                            : width > 400
                                ? 30
                                : 25,
                        width: width > 720
                            ? 140
                            : width > 400
                                ? 120
                                : 100,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 2,
                                backgroundColor: Colors.amber,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onPressed: () {},
                            child: Text(
                              "Get Started",
                              style: customTextStyle(
                                width > 720
                                    ? 18
                                    : width > 400
                                        ? 14
                                        : 12,
                              ),
                            )),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          width < 720
              ? const SizedBox()
              : const Expanded(
                  child: Image(
                    image: AssetImage('../../../assets/images/home.png'),
                  ),
                )
        ],
      ),
    );
  }
}
