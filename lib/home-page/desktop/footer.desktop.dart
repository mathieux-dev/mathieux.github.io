import 'package:flutter/material.dart';
import 'package:portifolio/statics/data_values.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DesktopFooter extends StatelessWidget {
  const DesktopFooter({super.key});
  Widget getSourceCode(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(DataValues.repoURL);
        },
        child: Tooltip(
          message: DataValues.repoURL.toString(),
          child: Text(
            'Código fonte',
            style: TextStyle(
              color: AppThemeData.textPrimary,
              fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodyMedium!.fontWeight,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppThemeData.backgroundBlack,
      child: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          SelectableText(
            '${DataValues.appName} (v${DataValues.appVersion})',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SelectableText(
                DataValues.builtWith,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                width: 4.0,
              ),
              getSourceCode(context),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
