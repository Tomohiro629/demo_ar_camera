import 'package:ar_location_view/ar_location_view.dart';
import 'package:demo_ar_camera/view/conponents/annotation_view.dart';
import 'package:flutter/material.dart';

class LocationViewPage extends StatefulWidget {
  const LocationViewPage({super.key});

  @override
  State<LocationViewPage> createState() => _LocationViewPageState();
}

class _LocationViewPageState extends State<LocationViewPage> {
  List<ArAnnotation> annotations = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LocationView")),
      body: ArLocationWidget(
        annotations: annotations,
        annotationViewBuilder: ((context, annotation) {
          return AnnotationView(annotation: annotation);
        }),
        onLocationChange: ((position) {
          Future.delayed(const Duration(seconds: 10), () {});
          setState(() {});
        }),
      ),
    );
  }
}
