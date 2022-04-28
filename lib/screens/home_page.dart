
import 'package:flutter/material.dart';
import 'package:yachts_app_ui/screens/yacht_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var _tabkontroller;

  @override
  void initState() {
    super.initState();
    _tabkontroller = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBarMethod(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 30.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Yacht",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Charters",
                style: TextStyle(
                  fontSize: 26.0,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 50.0),
              SizedBox(
                height: 350.0,
                child: Row(
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        controller: _tabkontroller,
                        unselectedLabelColor: Colors.grey[400],
                        labelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: const UnderlineTabIndicator(
                          insets: EdgeInsets.symmetric(
                            horizontal: 20.0,
                          ),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        tabs: const [
                          Tab(
                            text: "Motor-sailing",
                          ),
                          Tab(
                            text: "Sailing",
                          ),
                          Tab(
                            text: "Motor",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: TabBarView(
                        controller: _tabkontroller,
                        physics: BouncingScrollPhysics(),
                        children: [
                          _componentCard(
                            "assets/images/yacht1.png",
                            "Atlantida\nYacht",
                            "1000",
                          ),
                          _componentCard(
                            "assets/images/yacht4.png",
                            "Oceana\nYacht",
                            "1200",
                          ),
                          _componentCard(
                            "assets/images/yacht2.png",
                            "Areadna\nYacht",
                            "1500",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80.0),
              const Text(
                "Popular",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              _listTile(
                "assets/images/yacht4.png",
                Colors.yellow[800],
                "Oceana Yacht",
                "\t4.6",
              ),
              _listTile(
                "assets/images/yacht2.png",
                Colors.grey[800],
                "Areadna Yacht",
                "4.8",
              ),
              _listTile(
                "assets/images/yacht1.png",
                Colors.green[800],
                "Titanic Yacht",
                "4.7",
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _appBarMethod() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: const Icon(
        Icons.arrow_back_ios,
        size: 26.0,
        color: Colors.black,
      ),
      actions: const [
        Icon(
          Icons.grid_view_rounded,
          size: 28.0,
          color: Colors.black,
        ),
        SizedBox(width: 20.0),
      ],
    );
  }

  ListTile _listTile(
    String img,
    Color? colour,
    String name,
    String rating,
  ) {
    return ListTile(
      leading: Container(
        width: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: colour,
        ),
        child: Center(
          child: Image.asset(img),
        ),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 20.0,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.star,
            color: Colors.grey,
            size: 20.0,
          ),
          Text(
            rating,
          ),
        ],
      ),
    );
  }

  InkWell _componentCard(
    String yachtImg,
    String yachtName,
    String yachtPrice,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => YachtPage(yachtName, yachtPrice),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.blue[800],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.sailing_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    "#yaching",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(width: 50.0),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 25.0,
                  ),
                ],
              ),
              SizedBox(
                child: Image.asset(yachtImg),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  yachtName,
                  style: const TextStyle(
                    fontSize: 26.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: "\$",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey[300],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "$yachtPrice\t",
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: "\t/\t"),
                      const TextSpan(text: "\tday"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
