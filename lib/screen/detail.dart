import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  @override
  
  Widget build(BuildContext context) {

     // Extract arguments
    final Map<String, dynamic>? args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    final Map<String, dynamic>? addressData = args?['address'] as Map<String, dynamic>?;

    // final Map<String, dynamic>? geoData = addressData?['geo'] as Map<String, dynamic>?;

    // Extract thumbnailUrl and name
    final String thumbnailUrl = args?['thumbnailUrl'] ?? '';
    final String name = args?['name'] ?? '';
    final String username = args?['username'] ?? '';
    final String email = args?['email'] ?? '';
    final String phone = args?['phone'] ?? '';
    final String website = args?['website'] ?? '';
    final String street =  addressData?['street'] ?? '';
    final String suite = addressData?['suite'] as String? ?? '';
    final String city = addressData?['city'] as String? ?? '';
    final String zipcode = addressData?['zipcode'] as String? ?? '';
    final String lat = addressData?['lat'] as String? ?? '';
    final String lng = addressData?['lng'] as String? ?? '';
    final String address = "$street, $suite, $city, $zipcode, $lat, $lng";


    return Scaffold(
    appBar: AppBar(
      iconTheme: IconThemeData(
      color: Colors.white, 
    ),
         title: Text('$username',
        style: TextStyle(color: Colors.white, fontSize: 20),
      

),
         backgroundColor: Color.fromARGB(225, 0, 0, 0),
       ), 
        body: Container(
          decoration: BoxDecoration(
          color: const Color.fromARGB(234, 0, 0, 0), 
        ),
          child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,16,0,0),
              child: Center(
                child: CircleAvatar(
                  backgroundImage: NetworkImage(thumbnailUrl),
                  radius: 100,    
                ),
              ),
            ),
            SizedBox(height: 20),
            
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset(
                      'assets/images/user5.png',
                      width: 24,
                      height: 24,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        SizedBox(height: 4), 
                        Text(
                          "$name",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Image.asset(
                      'assets/images/email6.jpg',
                      width: 24,
                      height: 24,
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email",
                          style: TextStyle(color: Colors.grey, fontSize: 11),
                        ),
                        SizedBox(height: 4), 
                        Text(
                          "$email",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
              
                ListTile(
                  leading: Image.asset(
                    'assets/images/phone3.png',
                    width: 20,
                    height: 20,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Phone",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      SizedBox(height: 4), 
                      Text(
                        "$phone",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                 ListTile(
                  leading: Image.asset(
                    'assets/images/web4.jpg',
                    width: 25,
                    height: 25,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Website",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      SizedBox(height: 4), 
                      Text(
                        "$website",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                 ListTile(
                  leading: Image.asset(
                    'assets/images/address2.png',
                    width: 24,
                    height: 24,
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(color: Colors.grey, fontSize: 11),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "$address",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                ],
              ),
            ),
            
          ],
        ),
        ),  
        );
  }
}