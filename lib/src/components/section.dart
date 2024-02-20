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
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.5))),
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  border: const Border(bottom: BorderSide(color: Colors.grey))),
              padding: const EdgeInsets.all(8),
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.label,
                    style: customTextStyle(14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30,
                    width: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0.5,
                            backgroundColor: Colors.amber,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        onPressed: () {},
                        child: Text(
                          "Fill",
                          style:
                              customTextStyle(14, fontWeight: FontWeight.w600),
                        )),
                  ),
                ],
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 300.0,
              ),
              child: const TextField(
                decoration: null,
                maxLines: null,
              ),
            ),
          )
        ]),
      ),
    );
  }
}
