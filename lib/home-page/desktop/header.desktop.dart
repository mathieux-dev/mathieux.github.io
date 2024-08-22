import 'package:flutter/material.dart';
import 'package:portifolio/statics/data_values.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:portifolio/widgets/bars/social-media.widget.dart';
import 'package:portifolio/widgets/bars/navigation-bar.widget.dart' as nav_bar;

class DesktopHeader extends StatelessWidget {
  const DesktopHeader({super.key});

  List<Widget> headerData() {
    return [
      Image.asset('assets/images/logo.png', height: 248.0, width: 248.0),
      const SizedBox(width: 64.0),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: AppThemeData.darkTheme.textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: AppThemeData.darkTheme.textTheme.displayMedium,
          ),
          SelectableText(
            DataValues.headerTitle,
            style: AppThemeData.darkTheme.textTheme.titleLarge,
          ),
          const SizedBox(height: 24.0),
          const SocialMedia(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppThemeData.backgroundBlack,
      child: Padding(
          padding: const EdgeInsets.only(top: 64.0, bottom: 40.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: headerData(),
              ),
              const SizedBox(height: 60.0),
              nav_bar.NavigationBar().desktopNavBar()
            ],
          )),
    );
  }
}
