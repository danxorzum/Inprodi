import 'package:flutter/material.dart';

import "package:inprodi/repositories/auth/auth_repository.dart";
import 'package:inprodi/widgets/widgets.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 70,
            ),
            TittleReg(
              'Crear Cuenta',
              '¡Descubre los cientos de servicios de belleza que tenemos para ti!',
              pading: 60,
            ),
            SizedBox(
              height: 50,
            ),
            _Forms(),
            Layers(
              message: '¿Ya tienes una cuenta?',
              buttonText: 'Ingresa',
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}

class _Forms extends StatefulWidget {
  @override
  __FormsState createState() => __FormsState();
}

class __FormsState extends State<_Forms> {
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  bool terms = false;
  bool notify = false;

  @override
  void dispose() {
    super.dispose();

    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    passCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TextFieldSimple(
            'Nombre',
            textControler: nameCtrl,
            keyboard: TextInputType.text,
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldSimple(
            'Correo',
            textControler: emailCtrl,
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldSimple(
            'Telefono',
            textControler: phoneCtrl,
            keyboard: TextInputType.phone,
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldPassword(passCtrl),
          Container(
            margin: EdgeInsets.only(top: 10, left: 30),
            alignment: Alignment.centerLeft,
            child: Text(
              'Ingrese 8 caracteres como minimo*',
              style: TextStyle(fontSize: 11, color: Colors.black45),
              textAlign: TextAlign.justify,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: terms,
                      onChanged: (_) {
                        terms = !terms;
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'He leido y acepto los terminos y condiciones.',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black45),
                    )
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: notify,
                      onChanged: (_) {
                        notify = !notify;
                        setState(() {});
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      activeColor: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'Deseo recibir noticias y promociones.',
                      style: TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black45),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(),
          LargeButton(onPressed: () => _submit(), text: 'Registrar')
        ],
      ),
    );
  }

  _submit() async {
    if (nameCtrl.text.length >= 6 &&
        emailCtrl.text.length > 6 &&
        phoneCtrl.text.length == 10 &&
        passCtrl.text.length >= 8 &&
        terms) {
      final bool? success = await AuthRepository.register(nameCtrl.text,
          emailCtrl.text, int.parse(phoneCtrl.text), passCtrl.text);

      if (success != null) {
        Navigator.pushReplacementNamed(context, 'login');
      } else {
        print('valio queso');
      }
    } else
      print('no');
  }
}
