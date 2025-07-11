import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_23/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_ecommerce_23/app/routes/app_pages.dart';

import 'package:get/get.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: "phanith1@gmail.com");
  final _passwordController = TextEditingController(text: "123123123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Login".toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    const Text("Please sigin to continue"),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!GetUtils.isEmail(value)) {
                      return "Email invalid ";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final email = _emailController.text;
                          final password = _passwordController.text;
                          controller.login(email: email, password: password);
                        }
                      },
                      label: const Text("Login"),
                      icon: const Icon(Icons.login),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have account"),
                    TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: const Text("Register")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
