import 'package:flutter/material.dart';
import 'package:portifolio/statics/data_values.dart';
import 'package:portifolio/statics/key_holders.dart';
import 'package:portifolio/themes/app_theme.dart';
import 'package:portifolio/widgets/containers/container-card.widget.dart';
import 'package:portifolio/widgets/texts/frame-tittle.widget.dart';

class DesktopEducation extends StatelessWidget {
  const DesktopEducation({super.key});

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ContainerCard().type2(
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
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(
                  child: ContainerCard().type2(
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
