import 'package:flutter/material.dart';
import 'package:freecodecamp_fluttercrashcourse_tourism/screens/locations/locations.dart';
import 'package:freecodecamp_fluttercrashcourse_tourism/screens/location_detail/location_detail.dart';
import 'package:freecodecamp_fluttercrashcourse_tourism/style.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          final arguments = settings.arguments as Map<String, dynamic>;
          screen = LocationDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(
          headline6: AppBarTextStyle,
        ),
      ),
      textTheme: TextTheme(
        headline6: TitleTextStyle,
        bodyText2: Body1TextStyle,
      ),
    );
  }
}
