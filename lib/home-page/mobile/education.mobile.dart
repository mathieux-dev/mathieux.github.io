import 'package:flutter/material.dart';
import 'package:portifolio/statics/data_values.dart';
import 'package:portifolio/statics/key_holders.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:portifolio/widgets/containers/container-card.widget.dart';
import 'package:portifolio/widgets/texts/frame-tittle.widget.dart';

class MobileEducation extends StatelessWidget {
  const MobileEducation({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.educationKey,
      color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.educationTitle,
                description: DataValues.educationDescription),
            const SizedBox(height: 32.0),
            ContainerCard().type2(
              image: 'ufc',
              title: DataValues.educationOrg1Title,
              values: [
                DataValues.educationOrg1CourseName,
                DataValues.educationOrg1CourseType,
                DataValues.educationOrg1CoursePeriod,
              ],
              message: DataValues.linkedinURL.toString(),
              url: DataValues.linkedinURL,
            ),
            const SizedBox(height: 24.0),
            ContainerCard().type2(
              image: 'fam',
              title: DataValues.educationOrg2Title,
              values: [
                DataValues.educationOrg2CourseName,
                DataValues.educationOrg2CourseType,
                DataValues.educationOrg2CoursePeriod,
              ],
              message: DataValues.linkedinURL.toString(),
              url: DataValues.linkedinURL,
            ),
          ],
        ),
      ),
    );
  }
}
