import 'package:flutter/material.dart';

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {
  String imgUrl = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Builder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 420,
              width: 280,
              color: Colors.black12,
              child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot){
                    if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(

                        ),
                      );
                    }
                    else{
                      return Image.network(snapshot.data.toString());
                    }
                  }),
            ),
            ElevatedButton(onPressed: (){
              setState(() {

              });
            }, child: Text('Reload'))
          ],
        ),
      ),
    );
  }

  Future<String> getData() async{
    await Future.delayed(Duration(seconds: 3));
    imgUrl = 'https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg?_gl=1*ch1igh*_ga*OTQwODI3Mzg2LjE3Njc4NzU3ODk.*_ga_8JE65Q40S6*czE3Njc4NzU3ODgkbzEkZzEkdDE3Njc4NzU3OTAkajU4JGwwJGgw';
    return imgUrl;
  }
}
