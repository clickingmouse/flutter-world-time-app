import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location;// location name for the UI
 String time ;// time in that location
String flag; //url to an asset flag icon
String url ;// location url for api endpoint

  WorldTime({this.location, this.flag, this.url});




  Future<void> getTime() async {

    try {
      //    Response response = await get('http://worldtimeapi.org/api/timezone/Europe/London');
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');

      Map data = jsonDecode(response.body);
//  print(data);
// get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
//print(datetime);
//  print(offset);

// create a DateTime obj
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours:int.parse(offset)));
      //print(now);

      // set the time property
      //time = now.toString();
      time = DateFormat.jm().format(now);
    } catch (e){
print('caught error: $e');
time = 'could not get time data';
    }


  }
}


// example
WorldTime instance = WorldTime(location:'Berlin', flag:'germany.png', url:'Europe/Berlin');
//instance.getTime();