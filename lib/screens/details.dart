import 'package:flutter/material.dart';
import 'package:shawarmaversion2/screens/home.dart';
import 'package:shawarmaversion2/navigation.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double transparencyLevel = 0.8;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top of the Screen
            Stack(
              children: [
                Container(
                  // Set the width of the Container to the screen width
                  width: screenWidth,
                  height: 220, // Set the desired height
                  //color: Colors.blue,
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.transparent,
                      BlendMode.srcIn,
                    ),
                    child: Image(
                      image: AssetImage(
                        "images/Shawrma4.jpg",
                      ),
                      fit: BoxFit.fill,
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        transparencyLevel,
                      ),
                      colorBlendMode: BlendMode.modulate,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 15,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black87,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 255, 212, 148),
                      // Set the minimum size for the button
                      minimumSize: Size(50, 50),
                      shape: CircleBorder(
                          //BorderRadius.circular(50),
                          ),
                    ),
                  ),
                ),
              ],
            ),
            // Details
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Chicken Shawarma Sandwitch",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      //color: Color.fromRGBO(155, 78, 12, 1)
                    ),
                  ),
                  Text("1,75 JD",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 10, 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "Chicken shwarma sandwitch with pickles, \ngarlic sauce, and fries.")
                ],
              ),
            ),

            // Icons & Counter
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 0, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.time_to_leave_rounded,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Free \nDelivery"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.timer,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("15 Minutes"),
                      ),
                    ],
                  ),
                  CounterButton(),
                ],
              ),
            ),

            // Toppings & Additions (MyCheckbox)
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 0, 0, 10),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Toppings and Additions",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            MyCheckbox(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 255, 212, 148),
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: MyAppBar(),
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

class CounterButton extends StatefulWidget {
  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: decrementCounter,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.remove,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 16),
        Container(
          padding: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            '$counter',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        SizedBox(width: 16),
        InkWell(
          onTap: incrementCounter,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class MyCheckbox extends StatefulWidget {
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  bool checkbox3 = false;
  bool checkbox4 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CheckboxListTile(
          title: Text("Cheese",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Text("0.5 JD"),
          secondary: Image(
              height: 50, width: 50, image: AssetImage("images/cheese.png")),
          value: checkbox1,
          onChanged: (value) {
            setState(() {
              checkbox1 = value!;
            });
          },
          activeColor: Color.fromARGB(255, 255, 212, 148),
        ),
        CheckboxListTile(
            title: Text("Lettuce",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text("0.5 JD"),
            secondary: Image(
                height: 50, width: 50, image: AssetImage("images/lettuce.png")),
            value: checkbox2,
            onChanged: (value) {
              setState(() {
                checkbox2 = value!;
              });
            },
            activeColor: Color.fromARGB(255, 255, 212, 148)),
        CheckboxListTile(
          title: Text("Pickles",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          subtitle: Text("0.5 JD"),
          secondary: Image(
              height: 50, width: 50, image: AssetImage("images/pickles.png")),
          value: checkbox3,
          onChanged: (value) {
            setState(() {
              checkbox3 = value!;
            });
          },
          activeColor: Color.fromARGB(255, 255, 212, 148),
        ),
        CheckboxListTile(
            title: Text("Sauces",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text("0.5 JD"),
            secondary: Image(
                height: 50, width: 50, image: AssetImage("images/sauces.png")),
            value: checkbox4,
            onChanged: (value) {
              setState(() {
                checkbox4 = value!;
              });
            },
            activeColor: Color.fromARGB(255, 255, 212, 148)),
      ],
    );
  }
}
