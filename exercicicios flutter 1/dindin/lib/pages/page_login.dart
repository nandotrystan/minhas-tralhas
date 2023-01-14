import 'package:dindin/controllers/login_controller.dart';
import 'package:dindin/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  bool obscure = true;
  LoginController _controller = LoginController.controle;

  @override
  Widget build(BuildContext context) {
    final altura = MediaQuery.of(context).size.height;
    final largura = MediaQuery.of(context).size.width;

    final controle = Provider.of<LoginController>(context);
    return Scaffold(
      body: Column(children: [
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(largura / 2),
                    bottomLeft: Radius.circular(largura / 2)),
                gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.purple, Colors.pink, Colors.grey])),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_balance,
                  size: altura * 0.1,
                  color: Colors.white,
                ),
              ],
            ))),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: controle.email,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: emailValidator,
                  onSaved: (value) => controle.email.text = value ?? '',
                  decoration: const InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: 'Digite seu e-mail',
                    labelText: 'E-mail *',
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: controle.password,
                  obscureText: obscure,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: passwordValidator,
                  onSaved: (value) => controle.password.text = value ?? '',
                  decoration: const InputDecoration(
                    fillColor: Colors.black12,
                    filled: true,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: 'Digite sua senha',
                    labelText: 'Senha *',
                  ).copyWith(
                    suffixIcon: ExcludeFocus(
                      child: IconButton(
                        icon: Icon(
                          obscure ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            obscure = !obscure;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  
                  onTap: (() {
                    
                    controle.loading ? null :
                    controle.submit(formKey, context);
                  }),
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Center(
                          child: Text(
                            'Entrar',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  String? passwordValidator(password) {
    final emptyError = emptyValidator(password);
    if (emptyError == null && password != null) {
      if (password.length < 6) {
        return 'Senha inválida';
      }
    }
    return emptyError;
  }

  String? emailValidator(email) {
    final emptyError = emptyValidator(email);
    if (emptyError == null && email != null) {
      if (!_controller.emailRegex.hasMatch(email)) {
        return 'E-mail inválido';
      }
    }
    return emptyError;
  }

  String? emptyValidator(String? text) {
    if (text == null || text.isEmpty) {
      return 'Dados errados';
    }
  }
}
