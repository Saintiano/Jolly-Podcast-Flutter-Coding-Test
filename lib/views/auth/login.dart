import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jolly_podcast_test/components/custom_card_shape.dart';
import 'package:jolly_podcast_test/components/custom_form_field_v2.dart';
import 'package:jolly_podcast_test/components/custom_text_field.dart';
import 'package:jolly_podcast_test/components/custom_text_with_Images.dart';
import 'package:jolly_podcast_test/components/dialogs.dart';
import 'package:jolly_podcast_test/components/image_widgets.dart';
import 'package:jolly_podcast_test/constants/constants.dart';
import 'package:jolly_podcast_test/constants/images.dart';
import 'package:jolly_podcast_test/constants/svgs.dart';
import 'package:jolly_podcast_test/controllers/auth/auth_controller.dart';
import 'package:jolly_podcast_test/repositories/auth/auth_repository.dart';
import 'package:jolly_podcast_test/services/loading_overlay_service.dart';
import 'package:jolly_podcast_test/styles/app_colors.dart';
import 'package:jolly_podcast_test/views/dashboard/dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  AuthController authController = Get.put(AuthController(AuthHttpsRepository()));

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool _isObscured = true;
  bool activateButton = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(checkIfAllFieldsAreFilled);
    _phoneController.addListener(checkIfAllFieldsAreFilled);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration:  BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/bg_single.png"),
          //   fit: BoxFit.cover,
          // ),
            gradient: LinearGradient(
                colors: [
                  AppColors.mainDarkColor,
                  AppColors.mainLightColor,
                  AppColors.mainLightColor,
                  AppColors.mainDarkColor,
                  // Theme.of(context).colorScheme.onPrimary,
                  // Theme.of(context).colorScheme.onPrimary,
                  // Theme.of(context).colorScheme.onPrimary,
                  // Theme.of(context).colorScheme.onPrimary,
                  //add more colors for gradient
                ],
                begin: Alignment.topRight, //begin of the gradient color
                end: Alignment.bottomRight, //end of the gradient color
                stops: const [0, 0.25, 0.15, 0.8] //stops for individual color
              //set the stops number equal to numbers of color
            ),
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0))),
        child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                Image.asset(
                  light_logo,
                  height: 77,
                  width: 172,
                ),

                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 5),
                  child: Custom_Text_Field(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    title: "PODCASTS FOR AFRICA, BY AFRICANS",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 0, left: 0, top: 20, bottom: 0),
                  child: Custom_Form_Field_V2(
                    maxLength: 11,
                    shape: BoxShape.circle,
                    textFieldBorderRadius: 100,
                    bgColor: AppColors.white,
                    inputColor: AppColors.blackPreferred,
                    cursorColor: AppColors.blackPreferred,
                    headTextColor: AppColors.blackPreferred,
                    hintColor: AppColors.disabledButton,
                    borderColor: AppColors.borderColor,
                    fillColor: AppColors.white,
                    onTap: () {

                    },
                    hint: 'Enter your phone number',
                    headtext: "Phone Number",
                    obscureText: false,
                    // contentPadding: EdgeInsets.zero,
                    pIcon: Image.asset(
                      nigeria_flag_img,
                      height: 24,
                      width: 24,
                    ),
                    keyboardType: TextInputType.number,
                    fieldType: TextFieldType.phone,
                    width: MediaQuery.of(context).size.width / 1.1,
                    formIndex: false,
                    // height: 48,
                    controller: _phoneController,
                    // headTextColor: AppColors.headerLogin,
                    onChanged: checkIfAllFieldsAreFilled(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 0, left: 0, top: 20, bottom: 0),
                  child: Custom_Form_Field_V2(
                    shape: BoxShape.circle,
                    textFieldBorderRadius: 100,
                    bgColor: AppColors.white,
                    inputColor: AppColors.blackPreferred,
                    cursorColor: AppColors.blackPreferred,
                    headTextColor: AppColors.blackPreferred,
                    hintColor: AppColors.disabledButton,
                    borderColor: AppColors.borderColor,
                    fillColor: AppColors.white,
                    onTap: () {

                    },
                    hint: 'Enter your password',
                    headtext: "Password",
                    obscureText: _isObscured,
                    // contentPadding: EdgeInsets.zero,
                    pIcon: Image.asset(
                      nigeria_flag_img,
                      height: 24,
                      width: 24,
                    ),
                    sIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                        print("object");
                      },
                      child: Icon(
                          color: AppColors.blackPreferred,
                          size: 25,
                          _isObscured
                              ? Icons.visibility_off
                              : Icons.visibility),
                    ),
                    keyboardType: TextInputType.text,
                    fieldType: TextFieldType.others,
                    width: MediaQuery.of(context).size.width / 1.1,
                    formIndex: false,
                    // height: 48,
                    controller: _passwordController,
                    // headTextColor: AppColors.headerLogin,
                    onChanged: checkIfAllFieldsAreFilled(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                activateButton ?
                Custom_Shape_Card(
                  backgroundImageOpacity: 1,
                  hasBackgroundImage: false,
                  gradientColor1: AppColors.buttonColor,
                  gradientColor2: AppColors.buttonColor,
                  gradientColor3: AppColors.buttonColor,
                  gradientColor4: AppColors.buttonColor,
                  height: size.height /16,
                  width: size.width / 1.1,
                  // height: menuButtonPressed ? size.width * 0.18 : size.width * 0.14,
                  // width: menuButtonPressed ? size.width * 0.18 : size.width * 0.14,
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                  backgroundImageUrl: '',
                  hasBackGroundColor: true,
                  hasBorderColor: false,
                  borderColor: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                  borderWidth: 1,
                  child: GestureDetector(
                    onTap: (){
                      if (_key.currentState!.validate() ) {
                        FocusScope.of(context).unfocus();
                        print(_passwordController.text);
                        print(_phoneController.text);
                        login();

                      } else {

                        Get.snackbar(
                          "Error",
                          "Please fill all fields",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );

                      }
                    },
                    child: CustomTextWithImages(
                      imageRightColor: Theme.of(context).colorScheme.onPrimary,
                      imageLeftColor: Theme.of(context).colorScheme.onPrimary,
                      imageLeft: add_user,
                      imageRight: arrow_right,
                      width: 25,
                      height: 25,
                      right: 30,
                      left: 30,
                      top: 10,
                      bottom: 10,
                      hasNoImages: true,
                      imageIsRight: true,
                      textChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign : TextAlign.center,
                            text: TextSpan(
                              text: "Continue",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall
                                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary,
                              ),
                              // Default style for the entire RichText
                              // style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headlineSmall
                                      ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    decorationColor: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the tap event, e.g., launch a URL
                                      // For example: launchUrl(Uri.parse('https://example.com'));
                                      print('Clickable link tapped!');
                                    },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              arrow_right,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ):
                Custom_Shape_Card(
                  backgroundImageOpacity: 1,
                  hasBackgroundImage: false,
                  gradientColor1: AppColors.disabledButton,
                  gradientColor2: AppColors.disabledButton,
                  gradientColor3: AppColors.disabledButton,
                  gradientColor4: AppColors.disabledButton,
                  height: size.height /16,
                  width: size.width / 1.1,
                  // height: menuButtonPressed ? size.width * 0.18 : size.width * 0.14,
                  // width: menuButtonPressed ? size.width * 0.18 : size.width * 0.14,
                  bottomLeftRadius: 100,
                  bottomRightRadius: 100,
                  topLeftRadius: 100,
                  topRightRadius: 100,
                  backgroundImageUrl: '',
                  hasBackGroundColor: true,
                  hasBorderColor: true,
                  borderColor: AppColors.disabledButton,
                  borderWidth: 1,
                  child: GestureDetector(
                    onTap: (){
                      // callTokenBottomSheet(size: size, isTokenAuthorization: false);
                    },
                    child: CustomTextWithImages(
                      imageRightColor: Theme.of(context).colorScheme.onPrimary,
                      imageLeftColor: Theme.of(context).colorScheme.onPrimary,
                      imageLeft: add_user,
                      imageRight: arrow_right,
                      width: 25,
                      height: 25,
                      right: 30,
                      left: 30,
                      top: 10,
                      bottom: 10,
                      hasNoImages: true,
                      imageIsRight: true,
                      textChild: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign : TextAlign.center,
                            text: TextSpan(
                              text: "Continue",
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .headlineSmall
                                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              // Default style for the entire RichText
                              // style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: '',
                                  style: Theme.of(context)
                                      .primaryTextTheme
                                      .headlineSmall
                                      ?.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    color: Theme.of(context).colorScheme.onPrimary,
                                    decorationColor: Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Handle the tap event, e.g., launch a URL
                                      // For example: launchUrl(Uri.parse('https://example.com'));
                                      print('Clickable link tapped!');
                                    },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: SvgPicture.asset(
                              arrow_right,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 5),
                  child: Custom_Text_Field(
                    title: "By proceeding, you agree and accept our T&C",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: size.height/22,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, top: 5),
                  child: Custom_Text_Field(
                    fontSize: 18,
                    title: "BECOME A PODCAST CREATOR",
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 40,
                )
              ],
            ),
        )
      )
    );
  }

  checkIfAllFieldsAreFilled() {
    if(_phoneController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      setState(() {
        activateButton = true;
      });
    }else{
      setState(() {
        activateButton = false;
      });
    }
  }

  void login(){
    authController.loginController(
        phoneNumber: _phoneController.text.removeAllWhitespace,
        password: _passwordController.text.removeAllWhitespace,
        loading: (isLoading){
          if (isLoading) {
            OverlayService.showOverlay(context);
          } else {
            OverlayService.hideOverlay(context);
          }
        }
    ).then((onValue){

      if(onValue.success!){

        print("onValue: ${onValue.data}");
        Get.to(
              () => Dashboard(),
          fullscreenDialog: false,
          popGesture: true,
          transition: Transition.rightToLeftWithFade,
          duration: const Duration(milliseconds: 600),
        );

      }else{
        Timer(const Duration(seconds: 1), () {
          //Show errors with empty arguments
          DialogWidgets.showAlertWarning(
              isOneButton: true,
              title: "Login Not Successful",
              content: "${onValue.error}",
              context: context,
              // imageUrlString: cancel_bad,
              imageUrlString: circled_x,
              actionTexRight: "Continue",
              rightButton: (){
                Navigator.pop(context);
              }
          );
        });
      }

    });
  }

}
