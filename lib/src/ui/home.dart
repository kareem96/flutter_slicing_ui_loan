import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    const double profile_side = 200;
    const double background_height = 300;
    const double widget_height = background_height + profile_side / 2;
    return Scaffold(
      // appBar: _buildAppBar(size),
      body: SizedBox(
        height: widget_height,
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              height: 195,
              width: double.infinity,
              child: const Image(
                image: AssetImage('assets/image/loan.jpeg'),
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: const Alignment(0.0, 0.4),
              child: SizedBox(
                height: profile_side,
                width: 360,
                child: Card(
                  color: Colors.white,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment(0.0, -1.7),
                          child: CircleAvatar(
                            radius: 40,
                          )),
                      Align(
                          alignment: Alignment(0.0, -0.5),
                          child: Text(
                            "Welcome Back",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                      ),
                      Align(
                          alignment: Alignment(0.0, -0.2),
                          child: Text(
                            "Yohannes Affandy(Jojo)",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            top: 90, left: 5, right: 5, bottom: 5),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                          children: const [
                                            Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Icon(Icons.work_outline)
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(left:10),
                                                child: Text("Loan Market Office Dev",
                                                  style: TextStyle(fontSize: 11),)
                                            ),
                                          ],
                                        ),
                                    ),
                                    Expanded(
                                        child: Row(
                                          children: const [
                                            Padding(
                                                padding: EdgeInsets.all(0),
                                                child: Text("ID:")
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(left: 15),
                                                child: Text("LM99900001",
                                                  style: TextStyle(fontSize: 11),)
                                            ),
                                          ],
                                        ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const VerticalDivider(
                              width: 10,
                              thickness: 1,
                              indent: 20,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Icon(Icons.email_outlined)
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left:10),
                                              child: Text("it@loanmarket.co.id",
                                                style: TextStyle(fontSize: 11),)
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Icon(Icons.call)
                                          ),
                                          Padding(
                                              padding: EdgeInsets.only(left: 15),
                                              child: Text("08123456789",
                                                style: TextStyle(fontSize: 11),)
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 2.4),
              child: SizedBox(
                height: profile_side,
                width: 360,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment(0, 0),
                        child: VerticalDivider(
                          width: 10,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                      ),
                      const Align(
                        alignment: Alignment(0, 0),
                        child: Divider(
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.red,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Icon(Icons.description_outlined),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(15),
                                              child: Column(
                                                children: const [
                                                  Text("Contact"),
                                                  Text("41"),
                                                ],
                                              )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.red,
                                          ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Icon(Icons.description_outlined),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                  children: const [
                                                    Text("Loan"),
                                                    Text("50"),
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
                              const SizedBox(
                                height: 20,
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        width: 180,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.cyan,
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Icon(Icons.work_outline),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                  children: const [
                                                    Text("Product"),
                                                    Text("73"),
                                                  ],
                                                )
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.tight,
                                      child: Container(
                                          width: 180,
                                          height: 300,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.cyan,
                                          ),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              child: const Icon(Icons.workspace_premium_outlined),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.all(15),
                                                child: Column(
                                                  children: const [
                                                    Text("Bank"),
                                                    Text("28"),
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
            Align(
              alignment: Alignment(0.0, 4.5),
              child: SizedBox(
                height: profile_side,
                width: 360,
                child: Card(
                  color: Colors.white,
                  margin: EdgeInsets.all(10),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment(0, 0),
                        child: Divider(
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            children: <Widget>[
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.red,
                                        ),
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text("Pinjaman Disetujui", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                              Text("2 / 5 Pinjaman"),
                                            ],
                                          ),
                                        )
                                      ),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Flexible(
                                flex: 2,
                                fit: FlexFit.tight,
                                child: Row(
                                  children: <Widget>[
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        width: 180,
                                        height: 300,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.cyan,
                                        ),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: const [
                                                Text("Target", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                                                Text("280%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                                                Text("RP.14.000.000.000/5.000.000.000"),
                                              ],
                                            ),
                                          )
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
            const Align(
              alignment: Alignment(-0.9, -0.7),
              child: Icon(Icons.menu),
            ),
            const Align(
              alignment: Alignment(0.9, -0.7),
              child: Icon(Icons.settings),
            ),
          ],
        ),
      ),
    );
  }

  Widget setUserForm() {
    return Stack(children: <Widget>[
      // Background with gradient
      Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomCenter,
                  colors: [Colors.red, Colors.blue])),
          height: MediaQuery.of(context).size.height * 0.3),
      //Above card
      Card(
          elevation: 20.0,
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 100.0),
          child: ListView(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 10.0, right: 18.0, bottom: 1.0),
              children: const <Widget>[TextField(), TextField()])),
      // Positioned to take only AppBar size
      Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          // Add AppBar here only
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text("Doctor Form"),
        ),
      ),
    ]);
  }
}
