import 'package:bizkit/src/res/styles.dart';
import 'package:flutter/material.dart';

class SectionComponent extends StatefulWidget {
  const SectionComponent({super.key, required this.label});
  final String label;
  @override
  State<SectionComponent> createState() => _SectionComponentState();
}

class _SectionComponentState extends State<SectionComponent> {
  @override
  Widget build(BuildContext context) {
    debugPrint("section");
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.withOpacity(0.5))),
      child: Column(children: [
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 50,
            minHeight: 20,
          ),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  border: const Border(bottom: BorderSide(color: Colors.grey))),
              padding: const EdgeInsets.all(8),
              // height: 40,
              child: LayoutBuilder(builder: (context, constraint) {
                double width = constraint.maxWidth;
                // debugPrint(width.toString());
                return Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.label,
                      softWrap: true,
                      style: customTextStyle(width < 300 ? 12 : 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: width < 300 ? 20 : 30,
                      width: width < 300 ? 55 : 60,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0.5,
                              backgroundColor: Colors.amber,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          onPressed: () {},
                          child: Text(
                            "Fill",
                            style: customTextStyle(width < 300 ? 12 : 14,
                                fontWeight: FontWeight.w600),
                          )),
                    ),
                  ],
                );
              })),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 700),
          child: const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: null,
                maxLines: null,
              ),
            ),
          ),
        )

        // Container(
        //   constraints: const BoxConstraints(maxHeight: 600),
        //   child: const Flexible(
        //     child: SingleChildScrollView(
        //       padding: EdgeInsets.all(8.0),
        //       scrollDirection: Axis.vertical,
        //       child: TextField(
        //         keyboardType: TextInputType.multiline,
        //         decoration: null,
        //         maxLines: null,
        //       ),
        //     ),
        //   ),
        // )
      ]),
    );
  }
}
/* Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              textAlign: TextAlign.justify,
            ), */