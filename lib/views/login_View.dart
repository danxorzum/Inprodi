import 'package:flutter/material.dart';

import 'package:inprodi/widgets/widgets.dart';

class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          TittleReg('¡Bienvenido de vuelta!','Accede a cientos de servicios de belleza'),
          _Forms(),
          _Layers()
        ],
          ),
      )
    );
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
        TextFieldSimple('Correo', textControler: emailCtrl,),
        SizedBox(height: 30,),
        TextFieldPassword(passCtrl),
        SizedBox(height: 20,),
        Text('¿Olvidaste la contraseña?', style: TextStyle(color: Colors.grey[600]),),
        SizedBox(height: 40,),
        _LargeButton(),
      ],
    );
  }
}
class _LargeButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      child: ElevatedButton(
        child: Container(

          // height: 50,
          width: double.infinity,
          child: Text('Entrar',textAlign: TextAlign.center, style: TextStyle(),)
          ),
        onPressed: (){},
      ),
    );
  }
}
class _Layers extends StatelessWidget {
  const _Layers({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('¿No tienes una cuenta?', style: TextStyle(fontSize: 14, color: Colors.black45),),
          TextButton(onPressed: null, child: Text('Registrate', style: TextStyle(color: Colors.black87),)),
        ],
      ),
    );
  }
}