import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_translate/core/translation/translation_keys.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(TranslateKey.titleApp.key.tr),
        title: Text(TranslateKey.titleApp.tr), // com uso do método get
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(TranslateKey.welcome.trParams({'name': 'Marcos Otake'})),
          const SizedBox(height: 10),
          // Text(TranslateKey.sigleUser.key
          //     .trPlural(TranslateKey.sigleUser.plural, 1)),
          Text(TranslateKey.sigleUser.trPlural(1)),
          const SizedBox(height: 10),
          // Text(TranslateKey.sigleUser.key
          //     .trPlural(TranslateKey.sigleUser.plural, 2)),
          Text(TranslateKey.sigleUser.trPlural(2)),
          const SizedBox(height: 20),
          // Text('example_single'
          //     .trPluralParams('example_plural', 1, {'qtd': 'QTD = 1,'})),
          Text(TranslateKey.exampleSingle.trPluralParams(1, {'qtd': '1'})),
          const SizedBox(height: 10),
          // Text('example_single'
          //     .trPluralParams('example_plural', 2, {'qtd': 'QTD = 2,'})),
          Text(TranslateKey.exampleSingle.trPluralParams(3, {'qtd': '3'})),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('en', 'US'));
              },
              child: const Text('Alterar para US')),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('pt', 'BR'));
              },
              child: const Text('Alterar para BR')),
          ElevatedButton(
              onPressed: () {
                Get.updateLocale(const Locale('jp', 'JP'));
              },
              child: const Text('Alterar para JP')),
        ],
      )),
    );
  }
}
