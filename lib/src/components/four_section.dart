import 'package:bizkit/src/components/section.dart';
import 'package:flutter/material.dart';

class FourSection extends StatefulWidget {
  const FourSection({
    super.key,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.label4,
  });
  final String label1;
  final String label2;
  final String label3;
  final String label4;
  @override
  State<FourSection> createState() => _FourSectionState();
}

class _FourSectionState extends State<FourSection> {
  @override
  Widget build(BuildContext context) {
    debugPrint("four section");
    return LayoutBuilder(builder: (context, constraint) {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: constraint.maxWidth,
                child: Row(
                  children: [
                    Expanded(child: SectionComponent(label: widget.label1)),
                    const SizedBox(width: 2),
                    Expanded(child: SectionComponent(label: widget.label2)),
                  ],
                ),
              )
            ],
          ));
    });
  }
}
/*
LayoutBuilder(builder: (context, constraint) {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(5)),
          child: SizedBox(
            height: constraint.maxWidth < 720 ? null : 800,
            // width: constraint.maxWidth,
            child: constraint.maxWidth < 720
                ? Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        SizedBox(
                          height: 400,
                          child: SectionComponent(label: widget.label1),
                        ),
                        SizedBox(
                          height: 400,
                          child: SectionComponent(label: widget.label2),
                        ),
                        SizedBox(
                          height: 400,
                          child: SectionComponent(label: widget.label3),
                        ),
                        SizedBox(
                          height: 400,
                          child: SectionComponent(label: widget.label4),
                        )
                      ])
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SectionComponent(label: widget.label1),
                          const SizedBox(width: 2),
                            SectionComponent(label: widget.label2),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SectionComponent(label: widget.label3),
                          const SizedBox(width: 2),
                          SectionComponent(label: widget.label4),
                        ],
                      ),
                    ],
                  ),
          ));
    });*/
