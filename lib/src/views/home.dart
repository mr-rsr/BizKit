import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 0.05 * width),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Welcome to",
                    style: customTextStyle(48, fontWeight: FontWeight.bold)),
                    AnimatedTextKit( 
                 animatedTexts: [ 
                   TyperAnimatedText('BizKit', 
                       textStyle:customTextStyle(48, fontWeight: FontWeight.bold)), 
                   TyperAnimatedText('BizKit', 
                       textStyle: customTextStyle(48, fontWeight: FontWeight.bold)), 
                 ], 
                
               ),
              ],
            ),
            Image(
              image: const AssetImage('../../../assets/images/home.png'),
              width: MediaQuery.of(context).size.width * .4,
              height: MediaQuery.of(context).size.width * .4,
            )
          ],
        ),
      ),
    );
  }
}
