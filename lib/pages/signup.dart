import 'package:flutter/material.dart';
import 'package:tadris/core/theme/app_pallete.dart';
import 'package:tadris/widget/fields.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formkey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisSize: MainAxisSize.min, // Center widgets vertically
              children: [
                Image.asset(
                  'assets/tadrisiorange.png',
                  height: 250,
                  width: 370,
                ),
                const SizedBox(height: 20),
                const Text(
                  'آهلا بك في تدريسي ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkpurple),
                ),
                const SizedBox(
                  height: 20,
                ),
                Authfields(hintText: ' الاسم ', controller: nameController),
                const SizedBox(height: 10),
                Authfields(
                  hintText: ' بريد الكتروني ',
                  controller: emailController,
                ),
                const SizedBox(height: 10),
                Authfields(
                  hintText: 'الرقم السري',
                  controller: passwordController,
                  isObscureText: true,
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                RichText(
                    text: TextSpan(
                        text: 'هل لديك حساب بالفعل ؟',
                        style: Theme.of(context).textTheme.titleMedium,
                        children: [
                      TextSpan(
                        text: ' تسجيل دخول',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                                color: AppColors.peachOrange,
                                fontWeight: FontWeight.bold),
                      ),
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
