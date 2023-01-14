import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final int _numPage = 3;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  Color _back = Colors.orange;
  Color _fontsColor = Colors.black;

  List<Widget> _makeList() {
    List<Widget> lista = [];
    for (int i = 0; i < _numPage; i++) {
      lista.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return lista;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isActive ? _fontsColor : null,
          border: Border.all(
            color: _fontsColor,
          ),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  String changeText() {
    switch (_currentPage) {
      case 0:
        return 'Ei, você está com fome?';
      case 1:
        return 'Escolha seu delicioso Ramen';
      case 2:
        return 'Obrigado, Naruto, Bom apetite^^';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: _back,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: _back,
          leading: _currentPage != 0
              ? IconButton(
                  onPressed: () => _pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: _fontsColor,
                  ),
                )
              : null,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Pular', style: TextStyle(color: _fontsColor, fontSize: 20))
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Lottie.asset('assets/images/naruto.zip'),
                    Lottie.asset('assets/images/ramen.zip'),
                    Lottie.asset('assets/images/naruto_ramen.zip'),
                    // Lottie.asset('assets/images/anime3.gif'),
                    // Lottie.asset('assets/images/anime2.gif'),
                  ],
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _makeList(),
              ),
              const SizedBox(
                height: 33,
              ),
              Text(
                changeText(),
                textAlign: TextAlign.center,
                style: TextStyle(color: _fontsColor, fontSize: 24),
              ),
              const SizedBox(
                height: 67,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: _fontsColor,
                onPressed: () {
                  _currentPage != 2
                      ? _pageController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.ease)
                      : _pageController.jumpToPage(0);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 62),
                  child: Text(
                    _currentPage != 2 ?
                    'Próximo' : 'Volte para o início',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: _back, fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
