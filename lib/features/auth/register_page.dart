import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:messenger/features/auth/repository/auth_repository.dart';
import 'package:messenger/features/components/input_widget.dart';
import 'package:messenger/router.dart';
import 'package:messenger/theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isPressed = false;

  onRegister() async {
    isPressed = true;
    setState(() {});
    await AuthRepository.register(
      emailController.text,
      passwordController.text,
      firstNameController.text,
      lastNameController.text,
    );
    isPressed = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          children: [
            InputWidget(text: 'Email', controller: emailController),
            const SizedBox(height: 12),
            InputWidget(text: 'Имя', controller: firstNameController),
            const SizedBox(height: 12),
            InputWidget(text: 'Фамилия', controller: lastNameController),
            const SizedBox(height: 12),
            InputWidget(text: 'Пароль', controller: passwordController),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: onRegister,
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
                              'Зарегистрироваться',
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
                context.goNamed(RouterNames.LOGIN_PAGE);
              },
              child: Text(
                'У меня уже есть аккаунт',
                style: theme.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
