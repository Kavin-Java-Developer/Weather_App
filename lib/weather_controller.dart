import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherController extends GetxController {
  var selectedDistrict = "Coimbatore".obs;
  var data = {}.obs;
  var districts = [
    'Ariyalur',
    'Chengalpattu',
    'Chennai',
    'Coimbatore',
    'Cuddalore',
    'Dharmapuri',
    'Dindigul',
    'Erode',
    'Kallakurichi',
    'Kanchipuram',
    'Kanyakumari',
    'Karur',
    'Krishnagiri',
    'Madurai',
    'Nagapattinam',
    'Namakkal',
    'Nilgiris',
    'Perambalur',
    'Pudukkottai',
    'Ramanathapuram',
    'Ranipet',
    'Salem',
    'Sivaganga',
    'Tenkasi',
    'Thanjavur',
    'Theni',
    'Thiruvallur',
    'Thiruvarur',
    'Thoothukudi',
    'Tiruchirappalli',
    'Tirunelveli',
    'Tirupattur',
    'Tiruppur',
    'Tiruvannamalai',
    'Vellore',
    'Viluppuram',
    'Virudhunagar'
  ].obs; // Add all the districts you need

  @override
  void onInit() {
    super.onInit();
    getData(selectedDistrict.value);
  }

  Future<void> getData(String district) async {
    final res = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$district,IN&appid=2b946b0d2c7f44e1f2a9a473a0c92f30&mode=json&units=imperial'));
    print(res.body.toString());

    if (res.statusCode == 200) {
      data.value = jsonDecode(res.body);

      var tempf = data['main']['temp'];
      var tempc = (tempf - 32) * 5 / 9;
      data['main']['tempc'] = tempc.toStringAsFixed(2);

      // Sunrise
      var sunrise =
          DateTime.fromMillisecondsSinceEpoch(data['sys']['sunrise'] * 1000);
      var formatSunrise = DateFormat('hh:mm a').format(sunrise);
      data['sys']['sunrise'] = formatSunrise;

      // Sunset
      var sunset =
          DateTime.fromMillisecondsSinceEpoch(data['sys']['sunset'] * 1000);
      var formatSunset = DateFormat('hh:mm a').format(sunset);
      data['sys']['sunset'] = formatSunset;

      print(tempf);
      print(tempc);
      print(data['sys']['sunrise']);
      print(sunrise);
      print(formatSunrise);
      print(data['sys']['sunset']);
      print(sunset);
      print(formatSunset);
    } else {
      print('not found');
    }
  }
}
