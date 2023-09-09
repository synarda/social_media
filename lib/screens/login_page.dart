import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_media/controllers/login_controller.dart';
import 'package:social_media/screens/register_page.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/utils/helper.dart';
import 'package:social_media/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        backgroundColor: Colorss.backgroundColor,
        body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(gradient: Helper.mainLinearGradient),
          child: SingleChildScrollView(
            child: Column(children: [
              Text("Milu Task", style: Styles.bigTitleStyle),
              const SizedBox(
                height: 80,
              ),
              TextfieldWidget(
                  labelColor: Colorss.borderColor,
                  borderColor: Colorss.borderColor,
                  type: TextInputType.emailAddress,
                  radius: 10,
                  controller: controller.emailController,
                  icon: const Icon(
                    Icons.person,
                    color: Colorss.borderColor,
                  ),
                  label: "Email",
                  limit: 50,
                  fillColor: Colors.white.withOpacity(0.5),
                  obscure: false),
              const SizedBox(
                height: 20,
              ),
              TextfieldWidget(
                  type: TextInputType.number,
                  labelColor: Colorss.borderColor,
                  borderColor: Colorss.borderColor,
                  radius: 10,
                  controller: controller.passwordController,
                  icon: const Icon(
                    Icons.password,
                    color: Colorss.borderColor,
                  ),
                  label: "Password",
                  limit: 50,
                  fillColor: Colors.white.withOpacity(0.5),
                  obscure: true),
              const SizedBox(
                height: 60,
              ),
              GestureDetector(
                onTap: controller.sigIn,
                child: Container(
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colorss.themeNeon1),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: Styles.smallTitleStyle.copyWith(color: Colors.white),
                      ),
                    )),
              ),
              Column(
                children: [
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => Get.to(const RegisterPage()),
                    child: Container(
                      height: 50,
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Don't have an account ?",
                        style: Styles.smallTextStyle.copyWith(
                            fontSize: 12, decoration: TextDecoration.underline, color: Colorss.forebackground),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
