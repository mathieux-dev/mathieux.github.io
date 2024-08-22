import "package:flutter/material.dart";
import "package:portifolio/themes/app_theme.dart";
import "package:portifolio/widgets/buttons/button-theme.widget.dart";
import "package:portifolio/widgets/texts/text-pairs.widget.dart";
import "package:url_launcher/url_launcher.dart";
import "dart:developer";

class ContainerCard {
  Widget type1({
    required String title,
    required String description,
    required String image,
    required String message,
    required Uri url,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, height: 72.0, width: 72.0),
                const SizedBox(height: 24.0),
                Text(
                  textAlign: TextAlign.justify,
                  title,
                  style: TextStyle(
                    fontSize:
                        AppThemeData.darkTheme.textTheme.titleMedium!.fontSize,
                    fontWeight: AppThemeData
                        .darkTheme.textTheme.headlineSmall!.fontWeight,
                    color: AppThemeData.textWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            SelectableText(description,
                style: AppThemeData.darkTheme.textTheme.labelLarge),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget type2({
    required String image,
    required String title,
    required List values,
    required String message,
    required Uri url,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  // child: Image.asset("assets/images/$image.png", height: 72.0),
                ),
                SelectableText(title,
                    style: TextStyle(
                      fontSize: AppThemeData
                          .darkTheme.textTheme.titleMedium!.fontSize,
                      fontWeight: AppThemeData
                          .darkTheme.textTheme.headlineSmall!.fontWeight,
                      color: AppThemeData.terciaryColor,
                    )),
                const SizedBox(height: 8.0),
                TextPairs().type2(
                  title: values[0],
                  value1: values[1],
                  value2: values[2],
                  isThreeLines: false,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            ButtonTextSmall(
              text: "Ver Mais >>",
              message: message,
              url: url,
            ),
          ],
        ),
      ),
    );
  }

  Widget type3({
    required String image,
    required String title,
    required String role,
    required String years,
    required String values,
    required String message,
    required Uri url,
    required bool isButtonEnabled,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  //padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  /* child:
                        Image.asset("assets/images/$image.png", height: 72.0) */
                ),
                SelectableText(title,
                    style: TextStyle(
                      fontSize: AppThemeData
                          .darkTheme.textTheme.titleMedium!.fontSize,
                      fontWeight: AppThemeData
                          .darkTheme.textTheme.headlineSmall!.fontWeight,
                      color: AppThemeData.terciaryColor,
                    )),
                TextPairs().type2(
                  title: role,
                  value1: years,
                  value2: values,
                  isThreeLines: true,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            isButtonEnabled
                ? ButtonTextSmall(
                    text: "Ver Mais >>",
                    message: message,
                    url: url,
                  )
                : Text(
                    "See you soon with the link :)",
                    style: AppThemeData.darkTheme.textTheme.labelMedium,
                  ),
          ],
        ),
      ),
    );
  }

  Widget type4({
    required String image,
    required String title,
    required String message,
    required Uri url,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Tooltip(
          message: "Visite $message",
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                if (!await launchUrl(url)) {
                  throw "Could not launch $url";
                }
                log("Direct to: $url");
              },
              child: Text(
                message,
                style: TextStyle(
                  fontSize:
                      AppThemeData.darkTheme.textTheme.labelLarge!.fontSize,
                  fontWeight:
                      AppThemeData.darkTheme.textTheme.labelLarge!.fontWeight,
                  color: AppThemeData.textWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
