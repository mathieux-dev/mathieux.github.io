import 'package:flutter/material.dart';
import 'package:portifolio/statics/data_values.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:portifolio/widgets/bars/social-media.widget.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  List<Widget> headerData() {
    return [
      Image.asset('assets/images/logo.png', height: 248.0, width: 248.0),
      const SizedBox(height: 40.0),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: AppThemeData.darkTheme.textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: AppThemeData.darkTheme.textTheme.displayMedium,
            textAlign: TextAlign.center,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: SelectableText(
              "Estudante, Desenvolvedor,\nParceiro estratégico",
              style: AppThemeData.darkTheme.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
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
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: headerData(),
              ),
              const SizedBox(height: 40.0),
            ],
          )),
    );
  }
}
