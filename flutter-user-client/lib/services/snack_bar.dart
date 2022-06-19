import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSnackBar {
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showCustomSnackBar({
    required BuildContext showContext,
    required String headlineText,
    required String message,
    required String snackBarType,
    int showDuration = 3,
  }) {
    ScaffoldMessenger.of(showContext).removeCurrentSnackBar();
    return ScaffoldMessenger.of(showContext).showSnackBar(
      SnackBar(
        duration: Duration(seconds: showDuration),
        content: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: 100,
              decoration: BoxDecoration(
                color: snackBarType == "success"
                    ? Colors.green
                    : snackBarType == "warning"
                        ? Colors.amber
                        : Colors.red,
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 48,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          headlineText,
                          style: TextStyle(
                            color: snackBarType == "warning"
                                ? Colors.black
                                : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          message,
                          style: TextStyle(
                            color: snackBarType == "warning"
                                ? Colors.black
                                : Colors.white,
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Bubbles
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
                child: SvgPicture.asset(
                  "assets/icons/football.svg",
                  height: 40,
                  width: 40,
                  color: Colors.black,
                ),
              ),
            ),

            // Fail
            Positioned(
              top: -20,
              left: 0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/fail.svg",
                    height: 40,
                    color: snackBarType == "success"
                        ? Colors.green
                        : snackBarType == "warning"
                            ? const Color.fromARGB(255, 183, 140, 9)
                            : Colors.red,
                  ),
                  Positioned(
                    top: 10,
                    child: SvgPicture.asset(
                      snackBarType == "success"
                          ? "assets/icons/success.svg"
                          : snackBarType == "warning"
                              ? "assets/icons/warning.svg"
                              : "assets/icons/close.svg",
                      height: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
