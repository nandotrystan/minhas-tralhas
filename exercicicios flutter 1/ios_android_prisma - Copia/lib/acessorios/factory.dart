import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ios_android_prisma/acessorios/enum.dart';
import 'package:ios_android_prisma/pages/android_test.dart';

import '../pages/ios_test.dart';

Widget GetApp2(
    {required MeuSistema meuSistema}) {
  if (meuSistema == MeuSistema.iOS) {
    return MyCupertino();
  } else {
    return MyMaterial();
  }
}

// Widget GetApp(
//     {required MeuSistema meuSistema, required Widget home, required title}) {
//   switch (meuSistema) {
//     case MeuSistema.iOS:
//       return CupertinoApp(
//         home: home,
//         title: title,
//       );
//     case MeuSistema.android:
//       return MaterialApp(
//         home: home,
//         title: title,
//       );
//       break;
//   }
// }
// Widget GetApp() {
//   if (Platform.isIOS) {
//     return CupertinoApp(
//       home: CupertinoPageScaffold(
//           navigationBar: const CupertinoNavigationBar(
//             leading: Icon(Icons.arrow_back_ios_new),
//             middle: Text('Ajuda'),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               const Text('Como podemos te ajudar?'),
//               CupertinoButton(child: const Text('Enviar'), onPressed: () {})
//             ],
//           )),
//     );
//   } else {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xff6200EE),
//           title: Text('Ajuda'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(15.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   const Text('Como podemos te ajudar?'),
//                 ],
//               ),
//               MaterialButton(
//                   color: Color(0xff6200EE),
//                   child: const Text('Enviar'),
//                   onPressed: () {})
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





