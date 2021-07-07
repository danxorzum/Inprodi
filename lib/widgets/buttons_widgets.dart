part of 'widgets.dart';

class LargeButton extends StatelessWidget {
  final String text;
  final Color color;
  final void  onPressed;

  const LargeButton(this.text,this.onPressed,{this.color= Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(text),
        onPressed:null,
      ),
    );
  }
}