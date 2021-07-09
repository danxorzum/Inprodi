part of 'widgets.dart';

class TittleReg extends StatelessWidget {
  final String title;
  final String subtitle;
  final double pading;

  const TittleReg(this.title, this.subtitle, {this.pading = 70});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 25),
        ),
        Container(
            padding: EdgeInsets.symmetric(horizontal: pading),
            margin: EdgeInsets.only(top: 5),
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 18,
                color: Colors.black26,
              ),
              textAlign: TextAlign.center,
            ))
      ],
    ));
  }
}

class Layers extends StatelessWidget {
  final String message;
  final String buttonText;
  final void Function() onPressed;

  const Layers(
      {required this.message,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 14, color: Colors.black45),
          ),
          TextButton(
              onPressed: this.onPressed,
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.black87),
              )),
        ],
      ),
    );
  }
}
