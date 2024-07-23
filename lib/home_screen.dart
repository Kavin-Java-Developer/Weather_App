import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'weather_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WeatherController weatherController = Get.find<WeatherController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Select District:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[300],
                    border: Border.all(color: Colors.blueAccent, width: 1),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: weatherController.selectedDistrict.value,
                      onChanged: (String? newValue) {
                        weatherController.selectedDistrict.value = newValue!;
                        weatherController.getData(newValue);
                      },
                      items: weatherController.districts
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                if (weatherController.data.isEmpty) {
                  return CircularProgressIndicator();
                } else {
                  return Column(
                    children: [
                      Image.asset(
                        'assets/images/splash.png', // Add an appropriate image for weather condition
                        height: 100,
                      ),
                      Text(
                        'City: ${weatherController.selectedDistrict.value}',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        weatherController.data['weather'][0]['description'],
                        style: TextStyle(fontSize: 18, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${weatherController.data['main']['temp']} °F | ${weatherController.data['main']['tempc']} °C',
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        'Sunrise: ${weatherController.data['sys']['sunrise']}',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Sunset: ${weatherController.data['sys']['sunset']}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
