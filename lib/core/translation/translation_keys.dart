import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

enum TranslateKey {
  titleApp('title_app'),
  welcome('welcome'),
  sigleUser('sigle_user', plural: 'plural_users'),
  exampleSingle('example_single', plural: 'example_plural');

  final String key;
  final String? plural;

  const TranslateKey(this.key, {this.plural});

  String get tr => key.tr;

  String trParams(Map<String, String> params) {
    return key.trParams(params);
  }

  String trPlural(int total) {
    if (plural != null) {
      return key.trPlural(plural, total);
    }
    return '';
  }

  String trPluralParams(int total, Map<String, String> params) {
    if (plural != null) {
      return key.trPluralParams(plural, total, params);
    }
    return '';
  }
}

class TranslationKeys extends Translations {
  var enKeys = <String, String>{};
  var ptKeys = <String, String>{};
  var jpKeys = <String, String>{};

  Future<void> load() async {
    enKeys = Map<String, String>.from(
        jsonDecode(await rootBundle.loadString('assets/locales/en.json')));
    ptKeys = Map<String, String>.from(
        jsonDecode(await rootBundle.loadString('assets/locales/pt.json')));
    jpKeys = Map<String, String>.from(
        jsonDecode(await rootBundle.loadString('assets/locales/jp.json')));
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enKeys,
        'pt_BR': ptKeys,
        'jp_JP': jpKeys,
      };
}

/* OUTRA MANEIRA DE CRIAR AS VARIAVÈIS DE TRADUÇÂO*/
//   Map<String, Map<String, String>> get keys => {
//         'en_US': {
//           TranslateKey.titleApp.key: 'GetX Translate',
//           TranslateKey.welcome.key: 'Hello @name',
//           TranslateKey.sigleUser.key: 'User',
//           TranslateKey.sigleUser.plural!: 'Users',
//           TranslateKey.exampleSingle.key: ' @qtd User',
//           TranslateKey.exampleSingle.plural!: ' @qtd Users',
//         },
//         'pt_BR': {
//           TranslateKey.titleApp.key: 'GetX Tradução',
//           'welcome': 'Olá @name',
//           'sigle_user': 'Usuário',
//           'plural_users': 'Usuarios',
//           'example_single': '@qtd Usuário',
//           'example_plural': '@qtd Usuarios',
//         },
//         'jp_JP': {
//           TranslateKey.titleApp.key: 'GetX 翻訳 - Hon\'yaku',
//         }
//       };
// }


/* LEMBRETE ESTES ENUNS CRIADOS ACIMA NÃO FUNCINARAM EM VERSÃO 
DE DART ABAIXO DE sdk: ">=2.17.0 <3.0.0"
FOI NECESSÁRIO MIGRAR PARA (FLUTTER 3.0.5)
 */
/* --------COMO ERA ANTES DE CRIAR OS ENUNS--------- */

  // Map<String, Map<String, String>> get keys => {
  //       'en_US': {
  //         'title_app': 'GetX Translate',
  //         'welcome': 'Hello @name',
  //         'sigle_user': 'User',
  //         'plural_users': 'Users',
  //         'example_single': ' @qtd User',
  //         'example_plural': ' @qtd Users',
  //       },
  //       'pt_BR': {
  //         'title_app': 'GetX Tradução',
  //         'welcome': 'Olá @name',
  //         'sigle_user': 'Usuário',
  //         'plural_users': 'Usuarios',
  //         'example_single': '@qtd Usuário',
  //         'example_plural': '@qtd Usuarios',
  //       },
  //       'jp_JP': {
  //         'title_app': 'GetX 翻訳 - Hon\'yaku',
  //       }
  //     };

