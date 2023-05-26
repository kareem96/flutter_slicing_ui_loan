import 'package:flutter/material.dart';

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
          physics: BouncingScrollPhysics(),
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
              const SizedBox(height: 10),
              Container(
                height: 320,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Set the scroll direction to horizontal
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 320,
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      child: Card(
                        child: Column(
                          children: [
                            CircleAvatar(),
                            Text(items[index]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
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
