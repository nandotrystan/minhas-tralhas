import 'package:flutter/material.dart';
import 'package:login/strings.dart';

void main() {
  runApp(const Login());
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool escuro = true;
  TextEditingController userController = TextEditingController(text: '');
  TextEditingController senhaController = TextEditingController();
  final usuarioPadrao = 'Binho';
  final senhaPadrao = '123456*';

  //final userRegex = RegExp(r'[([A-Z])\w+]');

  void entrarLogin(BuildContext context) {
    String mensagem;
    final usuario = userController.text;
    final senha = senhaController.text;
    
    setState(() {
      if (usuario.isEmpty) {
        mensagem = 'Informe o Usuário';
        information(context, mensagem);
      } else if (senha.isEmpty) {
        mensagem = 'Infome a Senha';
        information(context, mensagem);
      } else if (usuario != usuarioPadrao || senha != senhaPadrao) {
        mensagem = 'Usuário ou Senha inválidos';
        information(context, mensagem);
      } else {
        mensagem = '$usuario logado(a) no sistema!';
        information(context, mensagem);
      }
    });
  }

  void information(BuildContext context, String mensagem) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(mensagem),
          );
        });
  }

  void senhaEscondida() {
    setState(() {
      escuro = !escuro;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.amberAccent.shade100,
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Center(
                    child: Text(
                  Strings.pag,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: userController,
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: Strings.user),
                  textCapitalization: TextCapitalization.words,
                ),
                TextFormField(
                  controller: senhaController,
                  obscureText: escuro,
                  decoration: const InputDecoration(labelText: Strings.password)
                      .copyWith(
                          suffixIcon: ExcludeFocus(
                              child: IconButton(
                                  icon: Icon(escuro
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: senhaEscondida))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Builder(builder: (context) {
                  return ElevatedButton(
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(Strings.login, style: TextStyle(fontSize: 20),),
                      ),
                      onPressed: () {
                        entrarLogin(context);
                      });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    userController.dispose();
    senhaController.dispose();
    super.dispose();
  }
}
