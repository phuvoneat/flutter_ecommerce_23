import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: GetBuilder<RegisterController>(
              init: controller,
              builder: (logic) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            controller.image != null
                                ? CircleAvatar(
                                    radius: 60,
                                    backgroundImage:
                                        FileImage(controller.image!),
                                  )
                                : const CircleAvatar(
                                    radius: 60,
                                    backgroundImage: AssetImage(
                                        "assets/images/noprofile.png"),
                                  ),
                            IconButton(
                              onPressed: controller.pickImage,
                              icon: const Icon(Icons.camera_alt),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },
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
                        TextFormField(
                          controller: _passwordConfirmationController,
                          decoration: const InputDecoration(
                            hintText: "Confirm Password",
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
                        TextButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final email = _emailController.text;
                              final password = _passwordController.text;
                              final confirmPass =
                                  _passwordConfirmationController.text;
                              final name = _nameController.text;
                              if (password != confirmPass) {
                                Get.snackbar(
                                  "Password",
                                  "Password doest not match",
                                );
                                return;
                              }
                              controller.register(
                                email: email,
                                password: password,
                                confirmPass: confirmPass,
                                name: name,
                              );
                            }
                          },
                          label: const Text("Register"),
                          icon: const Icon(Icons.login),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have an account?"),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text("Login")),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
