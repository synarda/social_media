import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:social_media/controllers/register_controller.dart';
import 'package:social_media/utils/const.dart';
import 'package:social_media/utils/helper.dart';
import 'package:social_media/widgets/textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegsiterController());
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(gradient: Helper.mainLinearGradient),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Center(
                    child:
                        Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center, children: [
                      Center(
                          child: Lottie.asset("assets/json/number02.json", fit: BoxFit.cover, height: 300, width: 300)),
                      const SizedBox(
                        height: 60,
                      ),
                      TextfieldWidget(
                          labelColor: Colorss.borderColor,
                          borderColor: Colorss.borderColor,
                          type: TextInputType.text,
                          radius: 10,
                          controller: controller.nameController,
                          icon: const Icon(
                            Icons.person,
                            color: Colorss.borderColor,
                          ),
                          label: "Name",
                          limit: 50,
                          fillColor: Colors.white.withOpacity(0.5),
                          obscure: false),
                      const SizedBox(
                        height: 20,
                      ),
                      TextfieldWidget(
                          labelColor: Colorss.borderColor,
                          borderColor: Colorss.borderColor,
                          type: TextInputType.emailAddress,
                          radius: 10,
                          controller: controller.emailController,
                          icon: const Icon(
                            Icons.email,
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
                          labelColor: Colorss.borderColor,
                          borderColor: Colorss.borderColor,
                          type: TextInputType.number,
                          radius: 10,
                          controller: controller.passwordController,
                          icon: const Icon(
                            Icons.password,
                            color: Colorss.borderColor,
                          ),
                          label: "Password",
                          limit: 50,
                          fillColor: Colors.white.withOpacity(0.5),
                          obscure: false),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: controller.signUp,
                        child: Container(
                            height: 60,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colorss.themeNeon1),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: Styles.smallTitleStyle.copyWith(color: Colors.white),
                              ),
                            )),
                      ),
                    ]),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                child: IconButton(
                    onPressed: Get.back,
                    icon: const Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colorss.backgroundColor,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
