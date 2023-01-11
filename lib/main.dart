import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var percent=0;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        // here we are using the Tween Animation Builder
        child: TweenAnimationBuilder(
          // here we are using the tween to convert 0 to 1
          tween: Tween(begin: 0.0,end: 1.0),
          builder: (context,value,child){


            return  Container(
              height: 200,
              width: 200,

              child: Stack(
                children: [

                  ShaderMask(shaderCallback: (rect){
                     percent=(value*100).ceil();

                    return   SweepGradient(
                        startAngle: 0.0,
                        endAngle: 3.14*2,
                        // here we are using the value from tween animation builder
                        stops: [value,value],
                        center: Alignment.center,
                        colors: const [Colors.white,Colors.transparent]).createShader(rect);

                  },
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const  BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage("assets/radial_scale.png"))
                      ),
                    ),
                  ),
                  Center(
                      child: Container(
                        height: 160,
                        width: 160,

                        decoration:const  BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Center(child: Text("$percent%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),)),
                      )

                  )

                ],
              ),
            );
          }, duration:const  Duration(seconds: 4),


        ),
      ),
    );
  }
}

