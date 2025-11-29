import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jolly_podcast_test/components/buttons.dart';
import 'package:jolly_podcast_test/constants/constants.dart';
import 'package:jolly_podcast_test/constants/svgs.dart';
import 'package:jolly_podcast_test/styles/app_colors.dart';

class DialogWidgets {

  static Future customBodyDialog(
      context, {
        Function? onTap,
        required bool noDismissIcon,
        bool isScrollControlled = true,
        required MaterialType transparency,
        required Widget child,

      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: isScrollControlled,
      isDismissible: noDismissIcon,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(bottomSheetBorderRadius),
        ),
      ),
      builder: (builder) {
        return Material(
          type: transparency,
          // type: MaterialType.transparency,
          child: child,
        );
      },
    );
  }

  static Future showAlertWarning({
    required BuildContext context,
    bool? dismiss,
    bool isOneButton = false,
    bool svgPictureColor = true,
    required String title,
    required String content,
    required String imageUrlString,
    String actionTextLeft = "No",
    String actionTexRight = "Yes",
    double borderRadius = 20,
    double height = 440,
    Color color = AppColors.white,
    Color fillColor = AppColors.lightBlue,
    Color contentTextColor = AppColors.blackPreferred,
    Color titleTextColor = AppColors.blackPreferred,
    Function? leftButton,
    Function? rightButton,

  }) {
    return showDialog(
      context: context,
      builder: (context) {
        // print('hello ${MediaQuery.sizeOf(context).width}');
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Stack(
              alignment: const Alignment(0.8, -0.8),
              children: [
                Container(
                  margin: const EdgeInsets.all(25),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    color: AppColors.white,
                    // gradient: boxGradient,
                  ),
                  padding: const EdgeInsets.only(top: 350 / 14.59, bottom: 5, right: 5, left: 5),
                  // width: 350,
                  height: height,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(30),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: svgPictureColor ? AppColors.lightBlue : Colors.transparent,
                                border: Border.all(
                                  color: AppColors.lightBlue ,
                                )
                            ),
                            child: svgPictureColor ?
                            SvgPicture.asset(
                              imageUrlString,
                              height: 52,
                              width: 52,
                              color: AppColors.blue,
                            ):
                            SvgPicture.asset(
                              imageUrlString,
                              height: 120,
                              width: 120,
                            ),
                          ),
                        ),
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 22,
                              color: titleTextColor,
                              fontWeight: FontWeight.bold
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 20, right: 20),
                            child: Text(content,
                              style: TextStyle(
                                fontSize: 17,
                                color: contentTextColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: MediaQuery.sizeOf(context).height / 0.8,
                        // ),
                        isOneButton ?
                        Padding(
                            padding: const EdgeInsets.only(top: 350 / 8.75),
                            child: CustomButton(
                              // width: MediaQuery.sizeOf(context).width / 3,
                                width: MediaQuery.of(context).size.width / 1.5,
                                fillColor: fillColor,
                                actionText: actionTexRight,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: color ,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.none,
                                  // fontFamily: 'Inter',
                                ),
                                color: AppColors.lightBlue,
                                radius: 50,
                                onTap: () {
                                  rightButton!();
                                })
                        ):
                        Padding(
                          padding: const EdgeInsets.only(top: 350 / 8.75),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                // width: MediaQuery.sizeOf(context).width / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  fillColor: AppColors.lightBlue,
                                  actionText: actionTextLeft,
                                  isOutline: true,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.blackPreferred ,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    // fontFamily: 'Inter',
                                  ),
                                  radius: 50,
                                  color: AppColors.lightBlue,
                                  onTap: () {
                                    Navigator.pop(context);
                                    leftButton!();
                                  }),
                              SizedBox(
                                // width: MediaQuery.sizeOf(context).width / 50,
                                width: MediaQuery.of(context).size.width / 50,
                              ),
                              CustomButton(
                                // width: MediaQuery.sizeOf(context).width / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  fillColor: AppColors.lightBlue,
                                  actionText: actionTexRight,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: AppColors.white ,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.none,
                                    // fontFamily: 'Inter',
                                  ),
                                  color: AppColors.lightBlue,
                                  radius: 50,
                                  onTap: () {
                                    rightButton!();
                                    // DialogWidgets.modalBottomSheetMenu(
                                    //     context, const Text(''), null);
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      //perform action here.
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(circled_x)
                )
              ],
            ),
          ),
        );
      },
    );
  }

}