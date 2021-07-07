part of 'widgets.dart';

class TittleReg extends StatelessWidget {

    final String title;
    final String subtitle;

  const TittleReg(this.title, this.subtitle);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
      children: [
        Text(title,style: TextStyle(fontSize: 25),),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 70),
              margin: EdgeInsets.only(top: 5),
              child: Text(subtitle,style: TextStyle(fontSize: 18,color: Colors.black26,),textAlign: TextAlign.center, ))
      ],
    )
    );
  }
}