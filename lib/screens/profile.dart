import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:shawarmaversion2/navigation.dart';
//import 'package:shawarmaversion2/screens/login.dart';
import 'package:shawarmaversion2/main.dart';
import 'package:shawarmaversion2/screens/signup.dart';
import 'package:shawarmaversion2/screens/home.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final FirebaseService fbs = FirebaseService();
  UserDetails? usr;
  late String imgurl;
  @override
  initState() {
    super.initState();
    fatchUserData();
  }

  Future<void> fatchUserData() async {
    try {
      UserDetails? us = await fbs.getUserFromDatabse();
      if (us != null) {
        setState(() {
          usr = us;
          imgurl = usr!.profilePhoto;
        });
      } else {
        print("user not found");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: usr == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: NetworkImage(usr!.profilePhoto),
                  ),
                  const SizedBox(height: 14),
                  _buildInfoCard(
                      icon: Icons.person,
                      label: 'Full Name',
                      value: usr!.fullName),
                  _buildInfoCard(
                      icon: Icons.email,
                      label: 'Email Address',
                      value: usr!.email),
                  _buildInfoCard(
                      icon: Icons.location_on,
                      label: 'Address',
                      value: usr!.address),
                  _buildInfoCard(
                      icon: Icons.phone,
                      label: 'Mobile Number',
                      value: usr!.mobileNumber),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addtodb();
                      },
                      child: Text("Add Data To FB")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "/products");
                      },
                      child: Text("Goto Product List")),
                  ElevatedButton(
                      onPressed: () {
                        Auth().auth.signOut();
                        Navigator.pushNamed(context, "/");
                      },
                      child: const Text("Sign Out"))
                ],
              ),
            ),
    );
  }

  void addtodb() {
    final DatabaseReference dataref =
        FirebaseDatabase.instance.ref().child("Meals");
    for (int i = 0; i < desc.length; i++) {
      Meals meal = Meals(
          desc: desc[i], name: names[i], picUrl: images[i], price: price[i]);
      dataref.push().set(meal.toMap()).then((value) {
        print("Meals Details Added Sucessfully");
      });
    }
  }
}

Widget _buildInfoCard(
    {required IconData icon, required String label, required String value}) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 8),
    child: ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(label),
      subtitle: Text(
        value,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

class ProductDetailsWidget extends StatefulWidget {
  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  // Sample product data
  List<Meals>? products;
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
          products = ps;
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
      body: products == null
          ? Center(
              child: Column(
              children: [
                Text("Still loading the product details"),
                CircularProgressIndicator()
              ],
            ))
          : ListView.builder(
              itemCount: products!.length,
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
                            products![index].picUrl,
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
                                products![index].name,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                  width:
                                      8), // Add spacing between the name and price
                              Text(
                                'Price: ${products![index].price}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    print("Clicked on Product ${products![index].name}");
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ProductDetailPage(
                          productImageUrl: products![index].picUrl,
                          productDescription: products![index].desc);
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
