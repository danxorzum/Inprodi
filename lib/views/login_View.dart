import 'package:flutter/material.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";

import 'package:inprodi/widgets/widgets.dart';
import 'package:inprodi/providers/auth/auth_provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: -100,
              right: 115,
              child: Image.asset(
                'assets/veza.png',
                scale: 1.5,
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  TittleReg('¡Bienvenido de vuelta!',
                      'Accede a cientos de servicios de belleza'),
                  SizedBox(),
                  _Forms(),
                  SizedBox(),
                  Layers(
                    message: '¿No tienes una cuenta?',
                    buttonText: 'Registrate',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'register');
                    },
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _Forms extends StatefulWidget {
  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<_Forms> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFieldSimple(
          'Correo',
          textControler: emailCtrl,
        ),
        SizedBox(
          height: 30,
        ),
        TextFieldPassword(passCtrl),
        SizedBox(
          height: 20,
        ),
        Text(
          '¿Olvidaste la contraseña?',
          style: TextStyle(color: Colors.grey[600]),
        ),
        SizedBox(
          height: 40,
        ),
        LargeButton(
          onPressed: () async {
            final bool? success = await context
                .read(authProvider.notifier)
                .login(emailCtrl.text, passCtrl.text);

            if (success != null && success) {
              Navigator.pushReplacementNamed(context, 'home');
            } else {
              print('valio versh');
            }
          },
          text: 'Entrar',
        ),
      ],
    );
  }
}
