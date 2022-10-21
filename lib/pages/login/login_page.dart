import 'package:Lembretes_Flutterama/db/database.dart';
import 'package:Lembretes_Flutterama/models/user.dart';
import 'package:Lembretes_Flutterama/routes.dart';
import 'package:Lembretes_Flutterama/widgets/custom_Edit.dart';
import 'package:Lembretes_Flutterama/widgets/custom_button.dart';
import 'package:Lembretes_Flutterama/widgets/custom_logo.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController textUsuario = TextEditingController();
  final TextEditingController textSenha = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool buttonClick = false;

  void _login() {
    if (buttonClick) return;

    setState(() {
      buttonClick = true;
    });

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Validando dados"),
      ));
    }

    Future.delayed(
      const Duration(seconds: 2),
      () {
        User? usuario =
            Database().login(textUsuario.text.trim(), textSenha.text.trim());

        if (usuario == null) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Usuario nao encontrado"),
            backgroundColor: Colors.red,
          ));
        } else {
          Database().usuarioLogado = usuario;
          Navigator.of(context).pushReplacementNamed(Routes.HOME);
        }
        setState(() {
          buttonClick = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const CustomLogo(),
                CustomEdit(
                  controller: textUsuario,
                  hintText: "Informe o email",
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null ||
                        value.trim() == "" ||
                        value.indexOf("@") < -1) {
                      return "Informe o email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomEdit(
                  controller: textSenha,
                  hintText: "Informe a senha",
                  icon: Icons.password,
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.trim() == "") {
                      return "Informe a senha";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                  caption: "Entrar",
                  onTap: _login,
                  loading: buttonClick,
                )
              ],
            ),
          ),
        ));
  }
}
