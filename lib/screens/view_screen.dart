import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/view_provider.dart';
import 'package:weatherapp/widgets/view_widgets.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ViewProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.wb_sunny),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.bedtime),
              ),
            ],
          ),
        ],
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: provider.weatherModel == null
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: SafeArea(
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.topLeft,
                      child: ViewWidgets(
                        text: "Today's Report",
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      height: 200,
                      child: Image.asset('assets/suncloud.png'),
                    ),
                    const ViewWidgets(
                      text: "Its Cloudy",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Center(
                            child: ViewWidgets(
                              text: provider.weatherModel!.main.temp.toString(),
                              fontSize: 80,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 50,
                            child: Container(
                              margin: EdgeInsets.only(left: 20),
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 5),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset('assets/sun-3.png'),
                            ),
                            Text(
                              provider.weatherModel!.main.tempMin.toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const Text(
                              'Sun',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset(
                                  'assets/windy-weather-7096837-5753013.png'),
                            ),
                            Text(
                              provider.weatherModel!.main.humidity.toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Image.asset('assets/moon.png'),
                            ),
                            Text(
                              provider.weatherModel!.main.tempMax.toString(),
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            const Text(
                              'Chance of rain',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.white70),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(20),
        height: 70,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 28, 29, 35),
            borderRadius: BorderRadius.circular(15)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.home,
              color: Colors.blue,
              size: 35,
            ),
            Icon(
              Icons.search,
              color: Colors.grey,
              size: 35,
            ),
            Icon(
              Icons.explore_outlined,
              color: Colors.grey,
              size: 35,
            ),
            Icon(
              Icons.person_2_outlined,
              color: Colors.grey,
              size: 35,
            ),
          ],
        ),
      ),
    );
  }
}
