import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
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
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              leading: const Icon(Icons.menu),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.notifications_none_outlined),
                      ),
                      Container(
                        padding: const EdgeInsets.only(right: 10),
                        child: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
                  'assets/image/loan.jpeg',
                  fit: BoxFit.fill,
                ),
              ),
              bottom: TabBar(
                labelColor: Colors.black,
                labelPadding: EdgeInsets.zero,
                controller: _tabController,
                tabs: [
                  for (final t in ["My Contact", "Other Contact"])
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Tab(
                        text: t,
                      ),
                    )
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          physics: ScrollPhysics(),
          controller: _tabController,
          children: [
            // Widget for Tab 1
            Center(child: _tabBank(context)),
            // Widget for Tab 2
            const Center(child: Text('Tab Other Contact')),
          ],
        ),
      ),
    );
  }

/*@override
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
  }*/
}

Widget _tabBank(BuildContext context) {
  double? _rating;
  IconData? _selectedIcon;
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    // Add more items
  ];

  return Container(
    padding: const EdgeInsets.all(10),
    child: Stack(
      children: [
        Column(
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
            const SizedBox(
              height: 5,
            ),
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
                              onPressed: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Coming Soon'),
                                  duration: Duration(seconds: 2),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: const [
                                  Icon(Icons.add), // Icon widget
                                  SizedBox(width: 8), // Optional spacing
                                  Text('Tambah'), // Button text
                                ],
                              ),
                            )),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.start,
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                Flexible(
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Coming Soon'),
                                  duration: Duration(seconds: 2),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Icon(
                                    Icons.sort,
                                    color: Colors.black,
                                  ),
                                  // Icon widget
                                  SizedBox(width: 8),
                                  // Optional spacing
                                  Text(
                                    'Sort',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  // Button text
                                ],
                              ),
                            )),
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
            const SizedBox(height: 5),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: 320,
                    child: Card(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Column(
                          children: [
                            const Image(
                              height: 100,
                              width: 200,
                              image: AssetImage('assets/image/mandiri.png'),
                              fit: BoxFit.contain,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(color: Colors.green),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          children: [
                                            Text("Rating:"),
                                            SizedBox(height: 10,),
                                            RatingBar.builder(
                                                initialRating: 3.0,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 20,
                                                itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                                                itemBuilder: (context, index) => Icon(
                                                  _selectedIcon ?? Icons.star, color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating){
                                                  _rating = rating;
                                                }
                                            ),
                                            SizedBox(height: 10,),
                                            Text("14 Reviews:"),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                                const VerticalDivider(
                                  width: 10,
                                  thickness: 1,
                                  indent: 2,
                                  endIndent: 2,
                                  color: Colors.grey,
                                ),
                                Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(color: Colors.green),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          children: [
                                            Text("User :"),
                                            SizedBox(height: 10,),
                                            RatingBar.builder(
                                                initialRating: 3.0,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: false,
                                                itemCount: 5,
                                                itemSize: 20,
                                                itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                                                itemBuilder: (context, index) => Icon(
                                                  _selectedIcon ?? Icons.star, color: Colors.amber,
                                                ),
                                                onRatingUpdate: (rating){
                                                  _rating = rating;
                                                }
                                            ),
                                            SizedBox(height: 10,),
                                            Text("Users yearly:"),
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              children: const [
                                Text(
                                  "Mandiri",
                                  style: TextStyle(
                                    fontSize: 16
                                  ),
                                ),
                                SizedBox(width: 2,),
                                Text(
                                  "Bunga Special Tengah Imlek 2023",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Icon(Icons.bar_chart),
                                          Text("Fix Rate(Year): 3.88",),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text("Max Tenor: 12",),
                                        ],
                                      ),
                                      Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        children: [
                                          Icon(Icons.access_time),
                                          Text("Loan to Value: 1",),
                                        ],
                                      ),
                                    ],
                                  )
                                ),
                                SizedBox(width: 5,),
                                Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          children: [
                                            Icon(Icons.bar_chart),
                                            Text("Fix Rate(Year): 3.88",),
                                          ],
                                        ),
                                        Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          children: [
                                            Icon(Icons.person_outline_outlined),
                                            Text("Target: Karyawan",),
                                          ],
                                        ),
                                        Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          children: [
                                            Icon(Icons.monetization_on_outlined),
                                            Text("Komisi: 1",),
                                          ],
                                        ),
                                      ],
                                    )
                                ),
                              ],
                            ),
                            SizedBox(height: 5,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white),
                              onPressed: () =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Coming Soon'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  'Detail',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 16
                                  ),
                                ),
                              )
                            )
                          ],
                        ),
                      )
                    ),
                  );
                },
              ),
            )
          ],
        )
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
