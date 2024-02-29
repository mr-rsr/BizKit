import 'package:bizkit/src/components/basic_detail.dart';
import 'package:bizkit/src/res/colors.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/views/create/bmc.dart';
import 'package:bizkit/src/views/create/identity.dart';
import 'package:bizkit/src/views/create/pyi.dart';
import 'package:bizkit/src/views/create/swot.dart';
import 'package:bizkit/src/views/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    final FirebaseAuth auth = FirebaseAuth.instance;
    return SizedBox.expand(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16),
            child: auth.currentUser != null
                ? const WelcomeScreen()
                : !generate
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
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            width: width < 360 ? width : width * .8,
            height: 50,
            child: TabBar(
                labelPadding: const EdgeInsets.all(0),
                indicatorPadding: const EdgeInsets.only(bottom: 12),
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.black54,
                dividerColor: Colors.black,
                labelColor: lightTextColor,
                labelStyle: customTextStyle(width < 360 ? 14 : 18,
                    fontWeight: FontWeight.bold, color: lightTextColor),
                unselectedLabelStyle: customTextStyle(width < 360 ? 12 : 16,
                    fontWeight: FontWeight.bold),
                indicatorColor: Colors.amber,
                controller: _tabController,
                tabs: [
                  const Tab(
                    child: Text(
                      "Identity",
                    ),
                  ),
                  Tab(
                    child: Text(
                      width < 1200 ? "BMC" : "Business Model Canvas",
                    ),
                  ),
                  Tab(
                    child: Text(
                      width < 1200 ? "PYI" : "Pitch Your Idea",
                    ),
                  ),
                  const Tab(
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
