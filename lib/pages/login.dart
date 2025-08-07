import 'package:flutter/material.dart';
import 'package:tadris/core/theme/app_pallete.dart';
import 'package:tadris/widget/auth_gradient_button.dart';
import 'package:tadris/widget/fields.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  final formkey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.forward(); // Start the animation
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 254),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formkey,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
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
                        fontFamily: 'Tajawal', // Use the Tajawal font
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkpurple,
                      ),
                    ),
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    AuthGradientButton(
                      btntext: 'تسجيل دخول',
                      onPressed: () {},
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: ' ليس لديك حساب ؟ ',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontFamily: 'Tajawal', // Use the Tajawal font
                                ),
                        children: [
                          TextSpan(
                            text: 'انشاء حساب ',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: AppColors.peachOrange,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Tajawal', // Use the Tajawal font
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
