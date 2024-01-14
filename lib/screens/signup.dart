import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shawarmaversion2/screens/login.dart';
import 'package:shawarmaversion2/screens/home.dart';
import 'package:shawarmaversion2/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _loginFormKey = GlobalKey<FormState>();
  late Color myColor;
  late Size mediaSize;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController photoUrlController = TextEditingController();
  FilePickerResult? _img;
  bool rememberUser = false;

  Future<void> pickAnImage() async {
    try {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) {
        return null;
      } else {
        setState(() {
          _img = result;
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: myColor,
        image: DecorationImage(
          image: AssetImage("images/bg.png"),
          fit: BoxFit.fill,
          colorFilter:
              ColorFilter.mode(myColor.withOpacity(0.2), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(children: [
          Positioned(top: 80, child: _buildTop()),
          Positioned(bottom: 0, child: _buildBottom()),
        ]),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image(image: AssetImage('images/logo.png')),
          Text(
            "SHARAMHA",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                letterSpacing: 2),
          )
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return SizedBox(
      width: mediaSize.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    // Email Validation
    bool isEmailValid(String email) {
      // Regular expression for a simple email validation
      // This is a basic example and may not cover all edge cases
      // For a more robust solution, consider using a dedicated email validation package
      RegExp emailRegExp =
          RegExp(r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
      return emailRegExp.hasMatch(email);
    }

    // Password Validation
    bool isPasswordValid(String password) {
      // Regular expression for password validation
      // Requires at least one capital letter, one digit, and a minimum length of 6 characters
      RegExp passwordRegExp = RegExp(r'^(?=.*[A-Z])(?=.*\d).{6,}$');
      return passwordRegExp.hasMatch(password);
    }

    return Form(
      key: _loginFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sign up ",
            style: TextStyle(
                color: myColor, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          _buildGreyText("Please Sign Up With Your Information"),
          kIsWeb
              ? _img == null
                  ? IconButton(
                      onPressed: () {
                        pickAnImage();
                      },
                      icon: const CircleAvatar(
                        radius: 25, // Adjust the radius as needed
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        pickAnImage();
                      },
                      icon: CircleAvatar(
                        radius: 25, // Adjust the radius as needed
                        backgroundImage: MemoryImage(_img!.files.first.bytes!),
                      ),
                    )
              : _img == null
                  ? IconButton(
                      onPressed: () {
                        pickAnImage();
                      },
                      icon: const CircleAvatar(
                        radius: 25, // Adjust the radius as needed
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: () {
                        pickAnImage();
                      },
                      icon: CircleAvatar(
                        radius: 25, // Adjust the radius as needed
                        backgroundImage: MemoryImage(_img!.files.first.bytes!),
                      ),
                    ),

          const SizedBox(height: 5),
          _buildGreyText("Email Address"),
          _buildInputField(emailController, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email address';
            } else if (isEmailValid(value)) {
              // Email is valid, proceed with login logic
              // Your login logic here
            } else {
              // Invalid email, show an error message or handle accordingly
              return 'Invalid email address';
            }
            // You can add additional email format validation here if needed.
            return null;
          }),
          const SizedBox(height: 5),
          _buildGreyText("Password"),
          _buildInputField(passwordController, isPassword: true,
              validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            } else if (isPasswordValid(value)) {
              // Password is valid, proceed with registration or password change logic
              // Your logic here
            } else {
              // Invalid password, show an error message or handle accordingly
              return ('Invalid password format\nYour password must contain at least A capital letter,\nat least a digit, and must be of length at least 6.');
            }
            // You can add additional password validation here if needed.
            return null;
          }),
          const SizedBox(height: 5),
          _buildGreyText("Full Name"),
          _buildInputField(fullNameController, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your full name';
            }
            return null;
          }),
          const SizedBox(height: 5),
          _buildGreyText("Mobile Number"),
          _buildInputField(mobileNumberController, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your mobile number';
            }
            return null;
          }),
          const SizedBox(height: 5),
          _buildGreyText("Address"),
          _buildInputField(addressController, validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your address';
            }
            return null;
          }),
          const SizedBox(height: 5),
          // _buildGreyText("Photo URL"),
          // _buildInputField(photoUrlController, validator: (value) {
          //   // You can add photo URL validation logic if needed
          //   return null;
          // }),
          // const SizedBox(height: 5),
          const SizedBox(height: 5),
          _buildRememberForgot(),
          const SizedBox(height: 5),
          _buildSignUpButton(),
        ],
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.grey),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false, String? Function(String?)? validator}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
        onTap: () {
          setState(() {
            isPassword = !isPassword;
          });
        },
        child: (isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done)),
      )),
      obscureText: isPassword,
      validator: validator,
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
              activeColor: Color.fromARGB(255, 255, 212, 148),
            ),
            _buildGreyText("Remember me"),
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            child: _buildGreyText("I Have an Account"))
      ],
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        if (_loginFormKey.currentState!.validate()) {
          _handleSignUp();
          // Perform login logic
          // debugPrint("Email : ${emailController.text}");
          // debugPrint("Password : ${passwordController.text}");
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => MyHomePage()),
          // debugPrint("Email : ${emailController.text}");
          // debugPrint("Password : ${passwordController.text}");
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromARGB(255, 255, 212, 148),
        shape: const StadiumBorder(),
        elevation: 20,
        shadowColor: myColor,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "Sign up",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  final DatabaseReference userRef =
      FirebaseDatabase.instance.ref().child("Users");
  final Reference profileimgref = FirebaseStorage.instance
      .ref()
      .child("UserProfileImage/${DateTime.now().millisecondsSinceEpoch}.jpg");
  Future<void> _handleSignUp() async {
    UploadTask uploadtask = profileimgref.putData(_img!.files.first.bytes!);
    String imgurl = await (await uploadtask).ref.getDownloadURL();
    Auth()
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((_) async {
      print("User created successfully");
      Auth().auth.authStateChanges().listen((User? user) async {
        // Capture the user state immediately after account creation
        if (user != null) {
          print("User is signed in: ${user.uid}");
          // Additional logic to update the database
          UserDetails userDetails = UserDetails(
            email: emailController.text,
            password: passwordController.text,
            fullName: fullNameController.text,
            address: addressController.text,
            mobileNumber: mobileNumberController.text,
            profilePhoto: photoUrlController.text,
          );
        } else {
          print("User is signed out");
        }
      });
      Future.delayed(Duration(seconds: 3)).then((value) {
        try {
          UserDetails user = UserDetails(
            email: emailController.text,
            password: passwordController.text,
            fullName: fullNameController.text,
            address: addressController.text,
            mobileNumber: mobileNumberController.text,
            profilePhoto: imgurl,
          );

          Map<dynamic, dynamic> userMap = user.toMap();
          print("UserDetails Map: $userMap");

          if (Auth().auth.currentUser != null) {
            userRef
                .child(Auth().auth.currentUser!.uid)
                .set(userMap)
                .then((value) {
              print("User added successfully to realtime database");
              Navigator.pushNamed(context, "/profile");
            }).catchError((error) {
              print("Failed to add user to realtime database");
              print("Error details: $error");
            });
          } else {
            print("The user uid is still null");
          }
        } on FirebaseException catch (error) {
          print("Error occurred: ${error.message}");
        }
      });
    });
  }
}

class FirebaseService {
  User? user = Auth().auth.currentUser;
  DatabaseReference userref = FirebaseDatabase.instance.ref().child("Users");
  Future<UserDetails?> getUserFromDatabse() async {
    try {
      if (user != null) {
        DatabaseEvent event = await userref.child(user!.uid).once();
        if (event.snapshot.value != null) {
          Map<dynamic, dynamic> snapMap = event.snapshot.value as dynamic;
          return UserDetails.fromMap(snapMap);
        } else {
          print("User details null");
          return null;
        }
      } else {
        print("The current user is null");
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<List<Meals>> getMealsDetails() async {
    DatabaseReference productsRef =
        FirebaseDatabase.instance.ref().child("Meals");

    try {
      DatabaseEvent event = await productsRef.once();

      if (event.snapshot.value != null) {
        print(event.snapshot.value.toString());

        List<Meals> productList = [];
        Map<dynamic, dynamic> snapshotData = event.snapshot.value as dynamic;

        snapshotData.forEach((key, value) {
          productList.add(Meals.fromMap(value as Map<dynamic, dynamic>));
        });

        print("Product List: $productList");
        return productList;
      } else {
        return [];
      }
    } catch (e) {
      print('Error getting product details: $e');
      return [];
    }
  }
}

// DatabaseReference refh = FirebaseDatabase.instance.ref().child("users");
// DatabaseEvent event = await refh.child(useruid).once();
// if (event.snapshot.value != null) {
//   Map<dynamic, dynamic> snapdata = event.snapshot.value as dynamic;
//   return UserDetails.fromMap(snapdata as Map<dynamic, dynamic>);
// } else {
//   return null;
// }

class UserDetails {
  String fullName;
  String password;
  String email;
  String address;
  String mobileNumber;
  String profilePhoto;

  UserDetails({
    required this.fullName,
    required this.password,
    required this.email,
    required this.address,
    required this.mobileNumber,
    required this.profilePhoto,
  });

  // Convert UserDetails object to a Map
  Map<dynamic, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'password': password,
      'address': address,
      'mobileNumber': mobileNumber,
      'profilePhoto': profilePhoto,
    };
  }

  // Create a UserDetails object from a Map
  factory UserDetails.fromMap(Map<dynamic, dynamic> map) {
    return UserDetails(
      fullName: map['fullName'],
      email: map['email'],
      password: map['password'],
      address: map['address'],
      mobileNumber: map['mobileNumber'],
      profilePhoto: map['profilePhoto'],
    );
  }
}
