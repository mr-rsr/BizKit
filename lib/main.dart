import 'package:bizkit/src/res/colors.dart';
import 'package:bizkit/src/res/styles.dart';
import 'package:bizkit/src/services/network/auth_helper.dart';
import 'package:bizkit/src/views/about.dart';
import 'package:bizkit/src/views/account.dart';
import 'package:bizkit/src/views/create.dart';
import 'package:bizkit/src/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBDdf8G76QoMFFDdfTmuwTPJiOUqbA3RtM",
          authDomain: "hartai.firebaseapp.com",
          projectId: "hartai",
          storageBucket: "hartai.appspot.com",
          messagingSenderId: "484141652985",
          appId: "1:484141652985:web:425169f34b745cc9957b28"),
    );
  } else {
    await Firebase.initializeApp();
  }

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Auth()),
  ], child: const MyApp()));
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
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  Future<void> toLaunchUrl(Uri url) async {
    if (kIsWeb) {
      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Could Not launch the $url",
            style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 24,
                color: Colors.black),
          ),
        ));
      }
    } else {
      if (!await launchUrl(url)) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            "Could Not launch the $url",
            style: GoogleFonts.merriweather(
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 24,
                color: Colors.black),
          ),
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Uri github = Uri.parse('https://github.com/mr-rsr');
    final Uri linkedin = Uri.parse("https://www.linkedin.com/in/mrrsr");
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
          width < 720
              ? IconButton(
                  onPressed: () {
                    _key.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu))
              : SizedBox(
                  width: width < 1000 ? width * .42 : width * .3,
                  height: 50,
                  child: TabBar(
                      labelPadding: const EdgeInsets.all(0),
                      indicatorPadding: const EdgeInsets.only(bottom: 16),
                      indicatorSize: TabBarIndicatorSize.label,
                      indicatorColor: Colors.amber,
                      padding: const EdgeInsets.all(0),
                      // labelPadding:
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            "Home",
                            style: customTextStyle(16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Generate",
                            style: customTextStyle(16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text("About",
                              style: customTextStyle(16,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Tab(
                          child: Text(
                            "Account",
                            style: customTextStyle(16,
                                fontWeight: FontWeight.bold),
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
              child: TabBarView(controller: _tabController, children: [
                const CreatePage(),
                const HomePage(),
                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: const SingleChildScrollView(child: AboutPage())),
                const AuthPage(),
              ]),
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("2024 © Raj Aryan",
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: lightTextColor)),
                  const SizedBox(width: 10),
                  socialMediaIcon(github, "../assets/images/github.png"),
                  const SizedBox(width: 5),
                  socialMediaIcon(linkedin, "../assets/images/linkedin.png")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  GestureDetector socialMediaIcon(Uri github, String imagePath) {
    return GestureDetector(
      onTap: () => toLaunchUrl(github),
      child: Image(image: AssetImage(imagePath), width: 15, height: 15),
    );
  }
}
