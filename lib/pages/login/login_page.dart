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

  void _login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const CustomLogo(),
                CustomEdit(
                  controller: textUsuario,
                  hintText: "Informe o email",
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.trim() == "") {
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
