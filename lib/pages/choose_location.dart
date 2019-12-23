import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData()async{
    // simulate network request for a usrename

    String username = await Future.delayed(Duration(seconds:3), (){
      //print('yoshi');
      return 'yoshi';
    });
    print('statement');

    //simulate network req to get bio of username
    Future.delayed(Duration(seconds:2), (){
      print('vega, musician, egg collector');
    });
  }



  int counter=0;
  @override
    void initState() {

      super.initState();
      print('init state function ran');
    }

  @override
  Widget build(BuildContext context) {
    print('build function ran');
getData();
    return Scaffold(
      backgroundColor:Colors.grey[200],
      appBar:AppBar(
        backgroundColor:Colors.blue[900],
        title: Text('Choose a location'),
          centerTitle:true,
        elevation:0,
      ),
      body:RaisedButton(
        onPressed:(){
          setState((){
            counter +=1;
          });
        },
        child:Text('counter is $counter')
      )
    );
  }
}
