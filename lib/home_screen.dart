import 'dart:convert';

import 'package:design1/products.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class Testing {
  String? title;
  String? desc;
  String? img;
  Testing({this.title, this.desc, this.img});
}

class _HomeScreenState extends State<HomeScreen> {
  // List<Testing> testingStaticData = [
  //   Testing(title: 'Category 1',desc: 'sdaadsdsad',img: 'https://images.ctfassets.net/usf1vwtuqyxm/3lgLhJk4Vhcc3StHMXOtJT/42f0f4496dc25d124583d1ae5bada1be/Hogwarts_Legacy_FC_090722.png'),
  //   Testing(title: 'Category 2',desc: 'sdaadsdsad',img: 'https://images.ctfassets.net/usf1vwtuqyxm/3lgLhJk4Vhcc3StHMXOtJT/42f0f4496dc25d124583d1ae5bada1be/Hogwarts_Legacy_FC_090722.png'),
  //   Testing(title: 'Category 3',desc: 'sdaadsdsad',img: 'https://images.ctfassets.net/usf1vwtuqyxm/3lgLhJk4Vhcc3StHMXOtJT/42f0f4496dc25d124583d1ae5bada1be/Hogwarts_Legacy_FC_090722.png'),
  //
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task 5'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            icon: Icon(Icons.person),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/harrypotter.jpg',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.fill,
            ),
            Container(
              height: 280,
              child:
                  // condition  ? "if true" : "if false"
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: MediaQuery.of(context).size.height,
                              width: 200,
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      imgList[0],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      productsFromDio!.data![index].title!,
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Text(
                                      productsFromDio!.data![index].sId!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: productsFromDio!.data!.length,
                        ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Text(
                    'New Arrivals',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text('View More'),
                    style: OutlinedButton.styleFrom(shape: StadiumBorder()),
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                  itemCount: titlesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      width: 200,
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  imgList[index],
                                ),
                              ),
                              Positioned(
                                right: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15),
                                    ),
                                    color: Colors.grey.withOpacity(0.6),
                                  ),
                                  child: Icon(
                                    Icons.favorite_border,
                                    size: 40,
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              titlesList[index],
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              descList[index],
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    getDataWithDio();

    super.initState();
  }

  Product? products;
  bool isLoading = true;
  Future getDataWithHttp() async {
    isLoading = true;
    var url = Uri.parse('https://api.storerestapi.com/products');
    var response = await http.get(url);
    products = Product.fromJson(jsonDecode(response.body)); // convert response from string to MAP then pass it to from json constructor

    setState(() {
      isLoading = false;
    });
  }

  Product? productsFromDio;
  Future getDataWithDio() async {
    isLoading = true;
    var response = await Dio().get('https://api.storerestapi.com/products');
    productsFromDio = Product.fromJson(response.data);
    setState(() {
      isLoading = false;
    });
  }
}
