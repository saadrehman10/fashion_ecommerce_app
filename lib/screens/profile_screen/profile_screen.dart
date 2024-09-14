import 'package:fashion_ecommerce_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationSwitch = false;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 5.0),
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(AppImages
                            .welcomeScreenImgThree), // Replace with your profile image
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      children: [
                        Text(
                          'John Doe', // Replace with the user's name
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Software Engineer', // Replace with the user's profession
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const ListTile(
                leading: Icon(Icons.email),
                title: Text(
                    'john.doe@example.com'), // Replace with the user's email
              ),
              const ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                    '+1 123 456 7890'), // Replace with the user's phone number
              ),
              const ListTile(
                leading: Icon(Icons.location_on),
                title:
                    Text('New York, USA'), // Replace with the user's location
              ),
              const ListTile(
                leading: Icon(Icons.calendar_today),
                title: Text(
                    'Joined on 01 Jan 2021'), // Replace with the user's join date
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Setting',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Container(
                height: 1,
                width: screenWidth * .97,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(137, 158, 158, 158),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                  title: const Text('Account Setting',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )),
                  trailing: const Icon(Icons.keyboard_arrow_right, size: 20),
                  onTap: () {
                    Navigator.pushNamed(context, '/accountSetting');
                  }),
              ListTile(
                title: const Text('Notification',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    )),
                trailing: Switch(
                  value: _notificationSwitch,
                  onChanged: (value) {
                    debugPrint('Notification Button working');
                    _notificationSwitch = value;
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Support',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              Container(
                height: 1,
                width: screenWidth * .97,
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(137, 158, 158, 158),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                  title: const Text('Help',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )),
                  trailing: const Icon(Icons.keyboard_arrow_right, size: 20),
                  onTap: () {
                    debugPrint('Help working');
                  }),
              ListTile(
                  title: const Text('FAQ\'s',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )),
                  trailing: const Icon(Icons.keyboard_arrow_right, size: 20),
                  onTap: () {
                    debugPrint('Help working');
                  }),
              ListTile(
                  title: const Text('Feedback',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                      )),
                  trailing: const Icon(Icons.keyboard_arrow_right, size: 20),
                  onTap: () {
                    debugPrint('Feedback working');
                  }),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirm Logout'),
                              content: const Text('Are you sure to logout ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('cancel'),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    final SharedPreferences sharedPreferences =
                                        await SharedPreferences.getInstance();
                                    sharedPreferences.setBool('login', false);
                                    setState(() {});
                                  },
                                  child: const Text('Logout'),
                                ),
                              ],
                            );
                          });
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: (screenWidth / 2) * .8),
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
