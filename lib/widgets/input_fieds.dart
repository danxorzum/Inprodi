part of 'widgets.dart';

class TextFieldSimple extends StatelessWidget {
  final String name;
  final TextEditingController textControler;
  final TextInputType keyboard;
  const TextFieldSimple(this.name,{this.keyboard= TextInputType.emailAddress, required this.textControler});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, textAlign: TextAlign.left, style: TextStyle(color: Color(0xff9C9C9C)),),
          SizedBox(height: 5,),
          TextField(
            keyboardType: keyboard,
            autocorrect: false,
            style: TextStyle(),
            cursorColor: Theme.of(context).primaryColor,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 0,style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 0,style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8),
              )
              
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldPassword extends StatelessWidget {
  final TextEditingController textControler;
  const TextFieldPassword(this.textControler);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Contaseña', textAlign: TextAlign.left, style: TextStyle(color: Color(0xff9C9C9C)),),
          SizedBox(height: 5,),
          TextField(
            obscureText: true,
            autocorrect: false,
            style: TextStyle(),
            cursorColor: Theme.of(context).primaryColor,
            // textAlign: TextAlign.right,
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.remove_red_eye_outlined, color: Theme.of(context).primaryColor, size: 20,),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(width: 0,style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              
              border: UnderlineInputBorder(
                borderSide: BorderSide(width: 0,style: BorderStyle.none),
                borderRadius: BorderRadius.circular(8),
              )
              
            ),
          ),
        ],
      ),
    );
  }
}