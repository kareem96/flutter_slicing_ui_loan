import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  late bool fixedScroll;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(child: _buildCarousel()),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    tabs: const [
                      Tab(text: 'Bank'),
                      Tab(text: 'Developer'),
                    ],
                  ),
                ),
              ),
            ];
          },
          // appBar: _buildAppBar(size),
          body: Stack(
            children: [
              /*Container(
                color: Colors.blue,
                height: 195,
                width: double.infinity,
                child: const Image(
                  image: AssetImage('assets/image/loan.jpeg'),
                  fit: BoxFit.fill,
                ),
              ),
              const Align(
                alignment: Alignment(-0.9, -0.9),
                child: Icon(Icons.menu),
              ),
              const Align(
                alignment: Alignment(0.9, -0.9),
                child: Icon(Icons.settings),
              ),*/
              /*Align(
                  alignment: Alignment(0, -.5),
                  child: Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: 'Bank',),
                        Tab(text: 'Developer'),
                        Tab(text: 'Developer'),
                      ],
                    ),
                  )
              ),*/
              TabBarView(
                controller: _tabController,
                children: [
                  _tabBank(context),

                  // Widget for Tab 2
                  const Center(child: Text('Tab Developer')),
                ],
              ),
            ],
          )),
    );
  }
}

Widget _tabBank(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(10),
    child: Stack(
      children: [
        Container(
          child: Column(
            children: [
              Flexible(
                child: Row(
                  children: const <Widget>[
                    Flexible(
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          enabled: true,
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(),
                          hintText: 'Cari nama bank',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
              const SizedBox(height: 5,),
              Row(
                children: [
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
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
                                    Icon(Icons.add), // Icon widget
                                    SizedBox(width: 8), // Optional spacing
                                    Text('Tambah'), // Button text
                                  ],
                                ),
                              )
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                  ),
                  const SizedBox(width: 70,),
                  Flexible(
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Coming Soon'),
                                    duration: Duration(seconds: 2),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Icon(Icons.sort), // Icon widget
                                    SizedBox(width: 8), // Optional spacing
                                    Text('Sort'), // Button text
                                  ],
                                ),
                              )
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Flexible(
                child: Row(
                  children: const <Widget>[
                    Flexible(
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'ALL',
                          hintStyle: TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                        ),
                      ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              ),
            ],
          ),
        )
        /*Column(
          children: <Widget>[

          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),*/

        /*Align(
          alignment: Alignment(0.0, 4.5),
          child: SizedBox(
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
        ),*/
      ],
    ),
  );
}

Widget _buildCarousel() {
  return SizedBox(
    child: Stack(
      children: const <Widget>[
        Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(Icons.menu),
        ),
        Align(
          alignment: Alignment(0.9, -0.9),
          child: Icon(Icons.settings),
        ),
        Align(
          alignment: Alignment.center,
          child: Image(
            height: 200,
            width: 500,
            image: AssetImage('assets/image/loan.jpeg'),
            fit: BoxFit.fill,
          ),
        )
      ],
    ),
  );
}
