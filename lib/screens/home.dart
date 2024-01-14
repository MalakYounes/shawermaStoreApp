import 'package:flutter/material.dart';
import 'package:shawarmaversion2/screens/details.dart';
import 'package:shawarmaversion2/screens/signup.dart';
import 'package:shawarmaversion2/navigation.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Top of the Screen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                height: 120,
                                width: 120,
                                image: AssetImage("images/Logo.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {
                              // Handle button press
                            },
                            child: Icon(
                              Icons.notification_add_rounded,
                              color: Colors.black,
                            ))),
                  )
                ],
              ),
              // Search bar
              Center(
                child: SearchBar(
                  onSearch: (query) {
                    // Handle search logic here
                    print('Searching for: $query');
                  },
                ),
              ),
              // Filter
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text(
                        "All",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child:
                          Text("Meals", style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child: Text("Sandwitches",
                          style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child:
                          Text("Offers", style: TextStyle(color: Colors.black)),
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle button press
                      },
                      child:
                          Text("Snacks", style: TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),

              // List View
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Stack(children: [
                            Container(
                                alignment: Alignment.center,
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage("images/Shawrma4.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 202, 125, 24),
                                ),
                                child: Center(
                                    child: Text(
                                  "0.75 JD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                              ),
                            )
                          ]),
                        ),
                        Text(
                          "Chicken Shawarama",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Stack(children: [
                            Container(
                                alignment: Alignment.center,
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage("images/Shawrma7.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 202, 125, 24),
                                ),
                                child: Center(
                                    child: Text(
                                  "1.50 JD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                              ),
                            )
                          ]),
                        ),
                        Text(
                          "Fried Chicken",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Stack(children: [
                            Container(
                                alignment: Alignment.center,
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage("images/Shwarma11.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 202, 125, 24),
                                ),
                                child: Center(
                                    child: Text(
                                  "1.25 JD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                              ),
                            )
                          ]),
                        ),
                        Text(
                          "Beef Shawarama",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Stack(children: [
                            Container(
                                alignment: Alignment.center,
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage("images/Shawrma2.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 202, 125, 24),
                                ),
                                child: Center(
                                    child: Text(
                                  "2.50 JD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                              ),
                            )
                          ]),
                        ),
                        Text(
                          "Shawarama Meal",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Stack(children: [
                            Container(
                                alignment: Alignment.center,
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image:
                                        AssetImage("images/ShawrmaPlate.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 202, 125, 24),
                                ),
                                child: Center(
                                    child: Text(
                                  "3.25 JD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                              ),
                            )
                          ]),
                        ),
                        Text(
                          "Shawarama Platter",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkResponse(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Details()),
                            );
                          },
                          child: Stack(children: [
                            Container(
                                alignment: Alignment.center,
                                height: 180,
                                width: 180,
                                decoration: BoxDecoration(
                                  //border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image(
                                    image: AssetImage(
                                        "images/CheesyLoadedFries.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                )),
                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color.fromARGB(255, 202, 125, 24),
                                ),
                                child: Center(
                                    child: Text(
                                  "1.50 JD",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10),
                                )),
                              ),
                            )
                          ]),
                        ),
                        Text(
                          "Loaded Fries",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        // Bottom Navigation Bar
        bottomNavigationBar: MyAppBar(),
      ),
    );
  }
}

// SearchBar

class SearchBar extends StatefulWidget {
  final Function(String) onSearch;

  SearchBar({required this.onSearch});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                contentPadding: EdgeInsets.symmetric(horizontal: 8.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      20.0), // Adjust the radius as needed
                ),
              ),
              onChanged: (value) {
                // Call the onSearch callback with the current search query
                widget.onSearch(value);
              },
            ),
          ),
          //IconButton(
          //  icon: Icon(Icons.search),
          //  onPressed: () {
          // Call the onSearch callback with the current search query
          //    widget.onSearch(_controller.text);
          //  },
          // ),
        ],
      ),
    );
  }
}

class Meals {
  String desc;
  String name;
  String picUrl;
  String price;

  Meals(
      {required this.desc,
      required this.name,
      required this.picUrl,
      required this.price});

  Map<dynamic, dynamic> toMap() {
    return {
      'desc': desc,
      'name': name,
      'picUrl': picUrl,
      'price': price,
    };
  }

  factory Meals.fromMap(Map<dynamic, dynamic> map) {
    return Meals(
      desc: map['desc'],
      name: map['name'],
      picUrl: map['picUrl'],
      price: map['price'],
    );
  }
}

List<String> images = [
  "images/Shawrma4.jpg",
  "images/Shawrma7.jpg",
  "images/Shwarma11.jpg",
  "images/Shawrma2.jpg",
  "images/ShawrmaPlate.jpg",
  "images/CheesyLoadedFries.jpg",
];

List<String> names = [
  "Chicken Shawarama",
  "Fried Chicken",
  "Beef Shawarama",
  "Shawarama Meal",
  "Shawarama Platter",
  "Loaded Fries"
];
List<String> desc = [
  "Chicken Shawarma Sandwitch wiht Pickles and Fries",
  "Spicy Fried Chicken Sandwitch",
  "Beef Shawarma with Tahina",
  "Shawarma Meal with Side Fries, Sauces, and a Drink",
  "Arabic Style Shawarma platter with a Side fo Hummus",
  "Loaded Chessy Fries with Sauces"
];

List<String> price = [
  "0.75 JD",
  "1.25 JD",
  "0.75 JD",
  "2.75 JD",
  "2.90 JD",
  "1.50 JD"
];

class ProductDetailsWidget extends StatefulWidget {
  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  // Sample product data
  List<Meals>? meals;
  @override
  initState() {
    super.initState();
    fatchProductDetails();
  }

  Future<void> fatchProductDetails() async {
    try {
      List<Meals>? ps = await FirebaseService().getMealsDetails();
      if (ps != null) {
        setState(() {
          meals = ps;
        });
      } else {
        print("Product Data not Found not found");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: meals == null
          ? Center(
              child: Column(
              children: [
                Text("Still loading the product details"),
                CircularProgressIndicator()
              ],
            ))
          : ListView.builder(
              itemCount: meals!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Card(
                    elevation: 5, // Add elevation for a shadow effect
                    margin: EdgeInsets.all(
                        8), // Add margin for spacing between cards
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.network(
                            meals![index].picUrl,
                            height: 150, // Set the desired height for the image
                            width: 100, // Set the image width to match the card
                            fit: BoxFit
                                .cover, // Ensure the image covers the entire space
                          ),
                          SizedBox(
                              width:
                                  8), // Add spacing between the image and text
                          Column(
                            children: [
                              Text(
                                meals![index].name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  width:
                                      8), // Add spacing between the name and price
                              Text(
                                'Price: ${meals![index].price}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    print("Clicked on Product ${meals![index].name}");
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ProductDetailPage(
                          productImageUrl: meals![index].picUrl,
                          productDescription: meals![index].desc);
                    }));
                  },
                );
              },
            ),
    );
  }
}

class ProductDetailPage extends StatelessWidget {
  final String productImageUrl;
  final String productDescription;

  ProductDetailPage(
      {required this.productImageUrl, required this.productDescription});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              productImageUrl,
              height: 400, // Set the desired height for the image
              width: double
                  .infinity, // Set the image width to match the screen width
              fit: BoxFit.cover, // Ensure the image covers the entire space
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                productDescription,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
//   // Sample product data
//   List<Meals>? meals;
//   @override
//   initState() {
//     super.initState();
//     fatchProductDetails();
//   }

//   Future<void> fatchProductDetails() async {
//     try {
//       List<Meals>? ps = await FirebaseService().getProductDetails();
//       if (ps != null) {
//         setState(() {
//           meals = ps;
//         });
//       } else {
//         print("Product Data not Found not found");
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Details'),
//       ),
//       body: meals == null
//           ? Center(
//               child: Column(
//               children: [
//                 Text("Still loading the product details"),
//                 CircularProgressIndicator()
//               ],
//             ))
//           : ListView.builder(
//               itemCount: meals!.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   child: Card(
//                     elevation: 5, // Add elevation for a shadow effect
//                     margin: EdgeInsets.all(
//                         8), // Add margin for spacing between cards
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Image.network(
//                             meals![index].picUrl,
//                             height: 150, // Set the desired height for the image
//                             width: 100, // Set the image width to match the card
//                             fit: BoxFit
//                                 .cover, // Ensure the image covers the entire space
//                           ),
//                           SizedBox(
//                               width:
//                                   8), // Add spacing between the image and text
//                           Column(
//                             children: [
//                               Text(
//                                 meals![index].name,
//                                 style: TextStyle(
//                                     fontSize: 18, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                   width:
//                                       8), // Add spacing between the name and price
//                               Text(
//                                 'Price: ${meals![index].price}',
//                                 style: TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   onTap: () {
//                     print("Clicked on Product ${meals![index].name}");
//                     Navigator.push(context, MaterialPageRoute(builder: (_) {
//                       return ProductDetailPage(
//                           productImageUrl: meals![index].picUrl,
//                           productDescription: meals![index].desc);
//                     }));
//                   },
//                 );
//               },
//             ),
//     );
//   }
// }
