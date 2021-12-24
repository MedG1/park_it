import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {

  const Confirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,width:400,
      decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(12.0),),
      child:Center(
          child: Column(
            children: <Widget>[const SizedBox(
              width: 60,height: 20,),
              const Text(
                "Finishing resarvation",
              style: TextStyle(
                fontSize: 25.0,fontWeight:FontWeight.bold,color: Colors.white,
              ),


            ),
              const SizedBox(
                width: 60,height: 20,),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                width: 60,height: 25,),
              const Text(
                "P16 at <parking name> => X TND",
                style: TextStyle(
                  fontSize: 25.0,fontWeight:FontWeight.bold,color: Colors.red,
                ),

              ),
              const SizedBox(
                width: 60,height: 35,),
              const Text(
              "Enter your confidential code:",
              style: TextStyle(
                fontSize: 25.0,fontWeight:FontWeight.bold,color: Colors.white,
              ),
              ),
              const SizedBox(
                width: 60,height: 35,),
               Container(
                  width: 200,height:35,
                  child:  const TextField(
                    showCursor: true,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'confirmation',),
                      style: TextStyle(
                          fontSize: 15.0,
                          height: 2.0,
                          color: Colors.white,
                          fontWeight:FontWeight.bold,
                      )
                  )
              )
            ],
          ),

      )
      );

  }
}
