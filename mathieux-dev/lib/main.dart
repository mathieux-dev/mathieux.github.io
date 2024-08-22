import 'package:flutter/material.dart';
import 'package:portifolio/home-page/desktop/about-me.desktop.dart';
import 'package:portifolio/home-page/desktop/contact.desktop.dart';
import 'package:portifolio/home-page/desktop/education.desktop.dart';
import 'package:portifolio/home-page/desktop/experience.desktop.dart';
import 'package:portifolio/home-page/desktop/footer.desktop.dart';
import 'package:portifolio/home-page/desktop/header.desktop.dart';
import 'package:portifolio/home-page/mobile/about-me.mobile.dart';
import 'package:portifolio/home-page/mobile/contact.mobile.dart';
import 'package:portifolio/home-page/mobile/education.mobile.dart';
import 'package:portifolio/home-page/mobile/experience.mobile.dart';
import 'package:portifolio/home-page/mobile/foorter.mobile.dart';
import 'package:portifolio/home-page/mobile/header.mobile.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:portifolio/themes/responsive_provider.dart';
import 'package:portifolio/widgets/bars/navigation-bar.widget.dart' as app_bar;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mateus Mourão',
      debugShowCheckedModeBanner: false,
      theme: AppThemeData.darkTheme,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          DesktopHeader(),
          DesktopAboutMe(),
          DesktopEducation(),
          DesktopExperience(),
          DesktopContact(),
          DesktopFooter(),
        ],
      );
    }

    Widget mobileUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          MobileHeader(),
          MobileAboutMe(),
          MobileEducation(),
          MobileExperience(),
          MobileContact(),
          MobileFooter(),
        ],
      );
    }

    return Scaffold(
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : AppBar(elevation: 0.0),
      drawer: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : app_bar.NavigationBar().mobileNavBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: AppThemeData.backgroundGrey,
          child: ResponsiveScreenProvider.isDesktopScreen(context)
              ? desktopUI()
              : mobileUI(),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Go to top',
              backgroundColor: AppThemeData.buttonPrimary,
              foregroundColor: AppThemeData.iconSecondary,
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
            ),
    );
  }
}
