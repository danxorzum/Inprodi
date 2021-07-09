part of 'widgets.dart';

class LargeButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;
  final double border;

  const LargeButton(
      {required this.onPressed, required this.text, this.border = 8});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 46,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(border))),
        child: Container(
            width: double.infinity,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(),
            )),
        onPressed: onPressed,
      ),
    );
  }
}
