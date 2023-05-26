import 'package:flutter/material.dart';
import 'package:slicing_ui/src/model/person_model.dart';

class DetailPage extends StatefulWidget {
  static const routeName = "/detail";
  final PersonModel personModel;
  const DetailPage({Key? key, required this.personModel}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Contact"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(

          children: [
            Center(
              child: Column(
                children: [
                  Text(widget.personModel.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                  Text("Date Created : December 21, 2022", style: TextStyle( fontSize: 16))
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
