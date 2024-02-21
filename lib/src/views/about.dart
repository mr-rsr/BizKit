import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.02 * width, 50, 0.02 * width, 0),
        child: LayoutBuilder(builder: (context, constraints) {
          return Row(
            mainAxisAlignment: constraints.maxWidth < 600
                ? MainAxisAlignment.center
                : MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: constraints.maxWidth < 600
                    ? width - 100
                    : width * 0.5 - 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: constraints.maxWidth > 600
                          ? Alignment.centerLeft
                          : Alignment.center,
                      child: Text(
                        "About BizKit",
                        style: customTextStyle(
                          width > 720
                              ? 32
                              : width > 400
                                  ? 24
                                  : 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    constraints.maxWidth < 600
                        ? const Flexible(
                            child: Image(
                            image:
                                AssetImage('../../../assets/images/home.png'),
                            // height: 300,
                            // width: 300,
                          ))
                        : const SizedBox(),
                    constraints.maxWidth < 600
                        ? const SizedBox(height: 50)
                        : const SizedBox(),
                    Flexible(
                      child: Text(
                        "BizKit is your ultimate business strategy toolkit. With just four short descriptions (industry, target customers, product/service info, and key benefits), BizKit can build your entire business model canvas, business identity, and a full SWOT analysis to get you started up the right way. All with a click.",
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: customTextStyle(
                          width > 720
                              ? 18
                              : width > 400
                                  ? 16
                                  : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Why Choose BizKit? ",
                      softWrap: true,
                      style: customTextStyle(
                        width > 720
                            ? 18
                            : width > 400
                                ? 16
                                : 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    AnimatedTextKit(
                      // totalRepeatCount: 10,
                      repeatForever: true,
                      animatedTexts: [
                        TyperAnimatedText('Create Business Canvas Model',
                            textStyle: customTextStyle(
                                width > 720
                                    ? 18
                                    : width > 400
                                        ? 16
                                        : 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber)),
                        TyperAnimatedText('Perform SWOT Analysis',
                            textStyle: customTextStyle(
                                width > 720
                                    ? 18
                                    : width > 400
                                        ? 16
                                        : 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber)),
                        TyperAnimatedText('Craft Your Business Identity',
                            textStyle: customTextStyle(
                                width > 720
                                    ? 18
                                    : width > 400
                                        ? 16
                                        : 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber)),
                        TyperAnimatedText('Create Pitch Your Idea Model',
                            textStyle: customTextStyle(
                                width > 720
                                    ? 18
                                    : width > 400
                                        ? 16
                                        : 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.amber)),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Get Started with BizKit Today",
                      softWrap: true,
                      style: customTextStyle(
                        width > 720
                            ? 18
                            : width > 400
                                ? 16
                                : 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        "Don't let the complexities of business development hold you back. With BizKit, you can streamline the process and focus on what truly matters - bringing your vision to life.",
                        softWrap: true,
                        textAlign: TextAlign.justify,
                        style: customTextStyle(
                          width > 720
                              ? 18
                              : width > 400
                                  ? 16
                                  : 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
              ),
              constraints.maxWidth > 600
                  ? const Flexible(
                      child: Image(
                          image: AssetImage('../../../assets/images/home.png')))
                  : const SizedBox()
            ],
          );
        }),
      ),
    );
  }
}
