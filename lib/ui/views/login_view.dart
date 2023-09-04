import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:project_ebs_wms/provider/auth_provider.dart';
import 'package:project_ebs_wms/provider/login_form_provider.dart';
import 'package:project_ebs_wms/router/router.dart';
import 'package:project_ebs_wms/services/local_storage.dart';
import 'package:project_ebs_wms/ui/buttons/custom_outlined_button.dart';
import 'package:project_ebs_wms/ui/dialog/dialog_simple.dart';
import 'package:project_ebs_wms/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

          return Container(
            margin: const EdgeInsets.only(top: 40),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: loginFormProvider.formKey,
                    child: Column(
                      children: [
                        const Image(
                            width: 250,
                            height: 120,
                            fit: BoxFit.contain,
                            image: AssetImage("assets/logoVertical2.png")),

                        const SizedBox(height: 20),
                        // Email
                        TextFormField(
                          onFieldSubmitted: (_) => onFormSubmit(
                              loginFormProvider, authProvider, context),
                          validator: (value) {
                            if (!EmailValidator.validate(value ?? '')) {
                              return 'Email no válido';
                            }

                            return null;
                          },
                          onChanged: (value) => loginFormProvider.email = value,
                          style: const TextStyle(color: Colors.black),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese su correo',
                              label: 'Correo',
                              icon: Icons.email_outlined),
                        ),

                        const SizedBox(height: 20),

                        // Password
                        TextFormField(
                          onFieldSubmitted: (_) => onFormSubmit(
                              loginFormProvider, authProvider, context),
                          onChanged: (value) =>
                              loginFormProvider.password = value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su contraseña';
                            }
                            if (value.length < 4) {
                              return 'La contraseña debe de ser de 4 caracteres';
                            }

                            return null; // Válido
                          },
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '*********',
                              label: 'Contraseña',
                              icon: Icons.lock_outline_rounded),
                        ),

                        const SizedBox(height: 20),
                        CustomOutlinedButton(
                          onPressed: () => onFormSubmit(
                              loginFormProvider, authProvider, context),
                          text: 'Ingresar',
                          color: const Color(0xD9b22222),
                        ),

                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "No tienes cuenta?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, Flurorouter.registerRoute);
                              },
                              child: const Text(
                                'Nueva cuenta',
                                style: TextStyle(
                                  color: Color(0xD9b22222),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Color(0xD9b22222),
                            ),
                          ],
                        ),
                      ],
                    )),
              ),
            ),
          );
        }));
  }

  void onFormSubmit(LoginFormProvider loginFormProvider,
      AuthProvider authProvider, context) async {
    var seleccion = "";
    var nomEmp = "";
    var rucEmp = "";
    final isValid = loginFormProvider.validateForm();
    if (isValid) {
      final response = await authProvider.login(
          loginFormProvider.email, loginFormProvider.password);
      //dialogo
      if (response.length > 1) {
        await dialogSimple(
            context,
            'Empresas',
            SizedBox(
              width: 200,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (var fieldValue in response) ...[
                    InkWell(
                      onTap: () {
                        seleccion = fieldValue.codEmp;
                        nomEmp = fieldValue.nomEmp;
                        rucEmp = fieldValue.numRuc;
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          fieldValue.codEmp == "01"
                              ? Image.asset(
                                  "assets/cojapan.png",
                                  fit: BoxFit.fitWidth,
                                  height: 80,
                                  width: 80,
                                )
                              : Image.asset(
                                  "assets/marsella.jpg",
                                  fit: BoxFit.fitWidth,
                                  height: 80,
                                  width: 80,
                                ),
                          const SizedBox(width: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              fieldValue.nomEmp,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    )
                  ]
                ],
              ),
            ),
            Icons.accessibility_new_rounded,
            Colors.blueGrey);
        LocalStorage.prefs.setString('emp', seleccion);
        LocalStorage.prefs.setString('nomEmp', nomEmp);
        LocalStorage.prefs.setString('rucEmp', rucEmp);
        await authProvider.loadingParams(seleccion);
      } else if (response.length == 1) {
        LocalStorage.prefs.setString('emp', response.first.codEmp);
        LocalStorage.prefs.setString('nomEmp', response.first.nomEmp);
        LocalStorage.prefs.setString('rucEmp', rucEmp);
        await authProvider.loadingParams(response.first.codEmp);
      }
    }
  }
}
