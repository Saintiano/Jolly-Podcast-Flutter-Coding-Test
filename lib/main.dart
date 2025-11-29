import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jolly_podcast_test/components/app_bar.dart';
import 'package:jolly_podcast_test/components/empty_state_widget.dart';
import 'package:jolly_podcast_test/components/loading_overlay.dart';
import 'package:jolly_podcast_test/controllers/get_controller/Controller_Bindings.dart';
import 'package:jolly_podcast_test/styles/dark_theme.dart';
import 'package:jolly_podcast_test/styles/light_theme.dart';
import 'package:jolly_podcast_test/utils/config.dart';
import 'package:jolly_podcast_test/views/splash_screen/splash_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Config.loadEnv();
    await GetStorage.init();
  } catch (e) {
    //
  } finally {
    ErrorWidget.builder = ((details) => const Material(
        child: Scaffold(
          appBar: CustomAppBar(text: ""),
          body: EmptyStateWidget(
              isException: true,
              isError: true,
              message:
              "Oops! An error occurred. Please contact support@yolanda.co to report this issue ",
              icon: null),
        )));
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    runApp(ProviderScope(
      child: new Directionality(textDirection: TextDirection.ltr, child: MyApp(savedThemeMode: savedThemeMode)),
    ));
  }
}

class MyApp extends ConsumerWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return AdaptiveTheme(
      // light: ThemeData(
      //   useMaterial3: true,
      //   brightness: Brightness.light,
      //   colorSchemeSeed: Colors.blue,
      // ),
      light: lightTheme2,
      dark: darkTheme2,
      // dark: ThemeData(
      //   useMaterial3: true,
      //   brightness: Brightness.dark,
      //   colorSchemeSeed: Colors.blue,
      // ),
      // themeMode: ThemeMode.system,
      initial: savedThemeMode ?? AdaptiveThemeMode.dark,
      // overrideMode: AdaptiveThemeMode.dark,
      builder: (theme, darkTheme) => LoadingOverlayWidget(
        child: GetMaterialApp(
          initialBinding: Controler_Binding(),
          title: 'Jolly Podcast',
          debugShowCheckedModeBanner: false,
          darkTheme: darkTheme,
          theme: theme,
          // themeMode: ThemeMode.light,
          home: const Splash_Screen(),
        ),
      ),
      debugShowFloatingThemeButton: false,
    );
  }
}
