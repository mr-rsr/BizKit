import 'package:bizkit/src/res/colors.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/views/create.dart';
import 'package:bizkit/src/views/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BizKit',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: null,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(
              image: AssetImage("../assets/images/logo.png"),
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 15),
            Text(
              "Biz",
              style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 24,
                  color: Colors.black),
            ),
            Text(
              "Kit",
              style: GoogleFonts.merriweather(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: 24,
                  color: Colors.black),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .3,
            height: 50,
            child: TabBar(
                labelPadding: const EdgeInsets.all(0),
                indicatorPadding: const EdgeInsets.only(bottom: 16),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.amber,
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text(
                      "Home",
                      style: customTextStyle(16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Create",
                      style: customTextStyle(16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Tab(
                    child: Text("About",
                        style:
                            customTextStyle(16, fontWeight: FontWeight.bold)),
                  ),
                  Tab(
                    child: Text(
                      "Account",
                      style: customTextStyle(16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ]),
          ),
          const SizedBox(width: 20)
        ],
      ),
      body: SizedBox.expand(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(controller: _tabController, children: const [
                HomePage(),
                CreatePage(),
                Text("HEllo"),
                Text("HEllo")
              ]),
            ),
            SizedBox(
              height: 30,
              child: Center(
                child: Text("2024 © Raj Aryan",
                    style: GoogleFonts.lato(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: lightTextColor)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
