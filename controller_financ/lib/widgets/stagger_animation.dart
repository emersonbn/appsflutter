import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/scheduler.dart' show timeDilation;

class StaggerAnimation  extends StatelessWidget {

  final AnimationController controller;

  StaggerAnimation({this.controller}) :
    logoRotaion = Tween( 
    begin: 0.0, 
    end: 18.0
    ).animate(
      CurvedAnimation(
          parent: controller, 
          curve: Interval(0.0, 1)
      ),
  ),//..addListener((){
   // print(controller.value);
    
  //  })..addStatusListener((state) {
     //  print('$state');
     //  if(state == AnimationStatus.completed){
      //   controller.value = 0.0;
      // }
      // }),
    logoScala = Tween( 
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: controller, 
        curve: Curves.bounceOut
      )
    );


  final Animation<double> logoRotaion;
  final Animation<double> logoScala;

  Widget _buildAnimation(BuildContext context, Widget child){
    timeDilation = 1;
     return  Padding(
       padding: EdgeInsets.only(top:30),

      child: logoScala.value > 0 ? Transform.rotate(
          angle: logoRotaion.value,
          origin: Offset( 0.0, 0.0),
          child:  Container(
                      child: Image.asset('images/logo.png',
                          height: 100, width: 100, fit: BoxFit.contain),
                    )

        ):
           Transform.scale(
             scale: logoScala.value,
              child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/logo.png'), fit: BoxFit.cover),
                      ),
                    )
           )
        );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller, 
      builder: _buildAnimation
      );
  }
}