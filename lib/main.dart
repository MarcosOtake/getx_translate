import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_translate/core/translation/translation_keys.dart';
import 'package:getx_translate/pages/home_page.dart';

late TranslationKeys translationKeys;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  translationKeys = TranslationKeys();
  await translationKeys.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: translationKeys,
      locale: const Locale('pt', 'BR'),
      //locale: const Locale('en', 'US'),
      //locale: const Locale('jp', 'JP'),
      fallbackLocale: const Locale('pt', 'BR'),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
      ],
    );
  }
}
