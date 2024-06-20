import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/features/auth/repository/auth_repository.dart';
import 'package:messenger/features/components/input_widget.dart';
import 'package:messenger/router.dart';
import 'package:messenger/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPressed = false;

  onLogin() async {
    isPressed = true;
    setState(() {});
    await AuthRepository.login(
      emailController.text,
      passwordController.text,
    );
    isPressed = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            InputWidget(text: 'Email', controller: emailController),
            const SizedBox(height: 12),
            InputWidget(text: 'Пароль', controller: passwordController),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onLogin,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: CustomColors.stroke,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 32),
                      child: isPressed
                          ? const CircularProgressIndicator()
                          : Text(
                              'Войти',
                              style: theme.textTheme.bodyLarge,
                            ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                context.goNamed(RouterNames.REGISTER_PAGE);
              },
              child: Text(
                'У меня нет аккаунта',
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
