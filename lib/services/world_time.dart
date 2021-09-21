import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  late String location;
  late String time;
  late String flag;
  late String done;
   late bool isDaytime;
  WorldTime({required this.location,required this.flag,required this.done});
  Future<void> getTime() async{
    Uri url =Uri.parse('http://worldtimeapi.org/api/timezone/$done');
    Response response = await get(url);
    Map data =jsonDecode(response.body);
    String datetime=data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
    DateTime now=DateTime.parse(datetime);
    now =  now.add(Duration(hours: int.parse(offset)));
    isDaytime = now.hour>6 && now.hour< 20? true :false;
    time = DateFormat.jm().format(now);



  }

}