import 'package:bizkit/src/components/basic_detail.dart';
import 'package:bizkit/src/res/colors.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/views/create/bmc.dart';
import 'package:bizkit/src/views/create/identity.dart';
import 'package:bizkit/src/views/create/pyi.dart';
import 'package:bizkit/src/views/create/swot.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  bool generate = false;
  TextEditingController industryController = TextEditingController();
  TextEditingController targetAudience = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController benefitsController = TextEditingController();
  @override
  void initState() {
    super.initState();
    industryController.addListener(() => setState(() {}));
    targetAudience.addListener(() => setState(() {}));
    descriptionController.addListener(() => setState(() {}));
    benefitsController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
        child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: generate
                ? const GeneratePage()
                : BasicDetailCard(
                    industryController: industryController,
                    targetAudience: targetAudience,
                    descriptionController: descriptionController,
                    benefitsController: benefitsController,
                    onPressed: () {
                      setState(() {
                        generate = true;
                      });
                    },
                  )));
  }
}

class GeneratePage extends StatefulWidget {
  const GeneratePage({super.key});

  @override
  State<GeneratePage> createState() => _GeneratePageState();
}

class _GeneratePageState extends State<GeneratePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .8,
            height: 50,
            child: TabBar(
                labelPadding: const EdgeInsets.all(0),
                indicatorPadding: const EdgeInsets.only(bottom: 12),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black54,
                dividerColor: Colors.black,
                labelColor: lightTextColor,
                labelStyle: customTextStyle(20,
                    fontWeight: FontWeight.bold, color: lightTextColor),
                unselectedLabelStyle:
                    customTextStyle(18, fontWeight: FontWeight.bold),
                indicatorColor: Colors.amber,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: Text(
                      "Identity",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Business Model Canvas",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Pitch Your Idea",
                    ),
                  ),
                  Tab(
                    child: Text(
                      "SWOT",
                    ),
                  ),
                ]),
          ),
        ),
        Expanded(
            child: TabBarView(
                controller: _tabController,
                children: const [IdentityPage(), BMC(), Pyi(), Swot()]))
      ],
    );
  }
}
