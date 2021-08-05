import 'package:flutter/material.dart';
import 'package:freecodecamp_fluttercrashcourse_tourism/models/location.dart';
import 'package:freecodecamp_fluttercrashcourse_tourism/screens/location_detail/image_banner.dart';
import 'package:freecodecamp_fluttercrashcourse_tourism/screens/location_detail/text_section.dart';


class LocationDetail extends StatelessWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text(location!.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ImageBanner(location.imagePath),
          ]..addAll(textSections(location)),
        ),
      ),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
