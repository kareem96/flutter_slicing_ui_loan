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
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(widget.personModel.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
                      Text("Date Created : December 21, 2022", style: TextStyle( fontSize: 16)),
                      SizedBox(height: 20,),
                      Align(
                        child: SizedBox(
                          height: 120,
                          width: 360,
                          child: Container(
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.grey,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(5),
                                                        child: Text("Contact", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                      ),
                                                      Container(
                                                          padding: const EdgeInsets.all(10),
                                                          child: Row(
                                                            children: const [
                                                              Icon(Icons.edit),
                                                              SizedBox(width: 10,),
                                                              Text("Edit", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                                            ],
                                                          )
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.center,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.cyan,
                                                  ),
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const [
                                                          Text("Phone"),
                                                          SizedBox(height: 5,),
                                                          Text("Email"),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              Flexible(
                                                flex: 2,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.cyan,
                                                  ),
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(widget.personModel.telp),
                                                          SizedBox(height: 5,),
                                                          Text(widget.personModel.email),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.center,
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                    ),
                                  ),
                                )

                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        child: SizedBox(
                          height: 170,
                          width: 360,
                          child: Container(
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.grey,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(10),
                                                        child: Text("Personal Information", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.center,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.cyan,
                                                  ),
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const [
                                                          Text("Type Contact"),
                                                          SizedBox(height: 5,),
                                                          Text("KTP"),
                                                          SizedBox(height: 5,),
                                                          Text("Birthday"),
                                                          SizedBox(height: 5,),
                                                          Text("Gender"),
                                                          SizedBox(height: 5,),
                                                          Text("Adviser"),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                              Flexible(
                                                flex: 2,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.cyan,
                                                  ),
                                                  padding: EdgeInsets.all(10),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const [
                                                          Text("Perorangan"),
                                                          SizedBox(height: 5,),
                                                          Text("2352309428342"),
                                                          SizedBox(height: 5,),
                                                          Text("07/12/2024"),
                                                          SizedBox(height: 5,),
                                                          Text("Female"),
                                                          SizedBox(height: 5,),
                                                          Text("Yohanned Affandy (Jojo)"),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        child: SizedBox(
                          height: 50,
                          width: 360,
                          child: Container(
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Flexible(
                                          flex: 3,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                    child: ElevatedButton(
                                                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(
                                                          content: Text('Coming Soon'),
                                                          duration: Duration(seconds: 2),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: const [
                                                          Icon(Icons.share_outlined), // Icon widget
                                                          SizedBox(width: 8), // Optional spacing
                                                          Text('Share Access'), // Button text
                                                        ],
                                                      ),
                                                    )
                                                ),
                                              ),
                                              SizedBox(width: 35,),
                                              Flexible(
                                                child: Container(
                                                    child: ElevatedButton(
                                                      style: ElevatedButton.styleFrom(
                                                          primary: Colors.red
                                                      ),
                                                      onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                                                        const SnackBar(
                                                          content: Text('Coming Soon'),
                                                          duration: Duration(seconds: 2),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: const [
                                                          Icon(Icons.delete_outline), // Icon widget
                                                          SizedBox(width: 8), // Optional spacing
                                                          Text('Delete Contact'), // Button text
                                                        ],
                                                      ),
                                                    )
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        child: SizedBox(
                          height: 170,
                          width: 360,
                          child: Container(
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.blueGrey,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(10),
                                                        child: Text("Application", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                      ),
                                                      Container(
                                                          padding: const EdgeInsets.all(10),
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.add_circle),
                                                              Text("Tambah", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.center,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 2,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                flex: 2,
                                                child: Container(
                                                  padding: const EdgeInsets.all(10),
                                                  child: const Card(
                                                    color: Colors.blueGrey,
                                                    child: SizedBox(
                                                      width: 300,
                                                      height: 200,
                                                      child: Center(
                                                        child: Icon(Icons.storage_rounded),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Flexible(
                                                flex: 5,
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.cyan,
                                                  ),
                                                  padding: EdgeInsets.only(top: 15, left: 10),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const [
                                                          Text("Nasabah", style: TextStyle(fontWeight: FontWeight.bold),),
                                                          SizedBox(height: 5,),
                                                          Text("Loan Amount",style: TextStyle(fontWeight: FontWeight.bold)),
                                                          SizedBox(height: 5,),
                                                          Text("Loan Step",style: TextStyle(fontWeight: FontWeight.bold)),
                                                          SizedBox(height: 5,),
                                                          Text("Tenor", style: TextStyle(fontWeight: FontWeight.bold)),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: const [
                                                          Text(" : Van Tomiko Can"),
                                                          SizedBox(height: 5,),
                                                          Text(" : Rp.10.000.000.00"),
                                                          SizedBox(height: 5,),
                                                          Text(" : Akad Kredit"),
                                                          SizedBox(height: 5,),
                                                          Text(" : 10 Tahun"),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Align(
                        child: SizedBox(
                          height: 170,
                          width: 360,
                          child: Container(
                            color: Colors.white,
                            child: Stack(
                              children: [
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      children: <Widget>[
                                        Flexible(
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.grey,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.all(10),
                                                        child: Text("Note", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                      ),
                                                      Container(
                                                          padding: const EdgeInsets.all(10),
                                                          child: Row(
                                                            children: [
                                                              Icon(Icons.add_circle),
                                                              Text("Tambah", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                            ],
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                            mainAxisAlignment: MainAxisAlignment.center,
                                          ),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                flex: 1,
                                                child: Card(
                                                  child: Container(
                                                    width: 100,
                                                    height: 200,
                                                    child: Center(
                                                      child: Text("Note"),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
        ),
      )
    );
  }
}
