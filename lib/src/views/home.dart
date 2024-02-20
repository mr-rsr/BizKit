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
    return SizedBox.expand(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.05 * width, 50, 0.05 * width, 0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text("Welcome to",
                        style:
                            customTextStyle(48, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Flexible(
                    child: Text(
                      "Your Ultimate Business Strategy Toolkit",
                      softWrap: true,
                      style: customTextStyle(32),
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
                          textStyle: customTextStyle(32,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber)),
                      TyperAnimatedText('Perform SWOT Analysis',
                          textStyle: customTextStyle(32,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber)),
                      TyperAnimatedText('Craft Your Business Identity',
                          textStyle: customTextStyle(32,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber)),
                      TyperAnimatedText('Create Pitch Your Idea Model',
                          textStyle: customTextStyle(32,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber)),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Transform Your Ideas Into Reality",
                        style: customTextStyle(20),
                      ),
                      const SizedBox(width: 10, height: 20),
                      SizedBox(
                        height: 36,
                        width: 140,
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
                                18,
                              ),
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(
              child: Image(
                image: AssetImage('../../../assets/images/home.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
