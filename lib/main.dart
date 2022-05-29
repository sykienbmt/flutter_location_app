import 'package:flutter/material.dart';
import 'package:location_app/providers/greatPlaces.dart';
import 'package:location_app/screens/addPlaceScreen/placeAddScreen.dart';
import 'package:location_app/screens/listPlaceScreen/placesScreen.dart';
import 'package:location_app/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GreatPlaces(),
        ),
      ],
      child: MaterialApp(
        title: "Location Map",
        theme: ThemeCustom.theme,
        home: const PlacesScreen(),
        routes: {
          AddPlaceScreen.routerName: (context) => AddPlaceScreen(),
        },
      ),
    );
  }
}
