import 'package:flutter/material.dart';
import 'package:portifolio/statics/data_values.dart';
import 'package:portifolio/statics/key_holders.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:portifolio/widgets/containers/container-card.widget.dart';
import 'package:portifolio/widgets/texts/frame-tittle.widget.dart';

class MobileAboutMe extends StatelessWidget {
  const MobileAboutMe({super.key});

  Widget titles(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContainerCard().type1(
            title: DataValues.aboutMeStudentTitle,
            description: DataValues.aboutMeStudentDescription,
            image: 'assets/icons/student.png',
            message: DataValues.linkedinURL.toString(),
            url: DataValues.linkedinURL,
          ),
          const SizedBox(height: 24.0),
          ContainerCard().type1(
            title: DataValues.aboutMeDeveloperTitle,
            description: DataValues.aboutMeDeveloperDescription,
            image: 'assets/icons/developer.png',
            message: DataValues.linkedinURL.toString(),
            url: DataValues.linkedinURL,
          ),
          const SizedBox(height: 24.0),
          ContainerCard().type1(
            title: DataValues.aboutMeTargetTitle,
            description: DataValues.aboutMeTargetDescription,
            image: 'assets/icons/target.png',
            message: DataValues.linkedinURL.toString(),
            url: DataValues.linkedinURL,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.aboutKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.aboutMeTitle,
                description: DataValues.aboutMeDescription),
            const SizedBox(height: 40.0),
            titles(context),
          ],
        ),
      ),
    );
  }
}
