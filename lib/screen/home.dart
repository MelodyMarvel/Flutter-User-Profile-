import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late List<dynamic> users = [];
  late List<dynamic> photos = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      // Fetch user data
      const url1 = 'https://jsonplaceholder.typicode.com/users';
      final response1 = await http.get(Uri.parse(url1));
      final List<dynamic> data1 = jsonDecode(response1.body);
      users.addAll(data1);

      // Fetch photo data
      const url2 = 'https://jsonplaceholder.typicode.com/photos';
      final response2 = await http.get(Uri.parse(url2));
      final List<dynamic> data2 = jsonDecode(response2.body);
      photos.addAll(data2);

      setState(() {});
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
     // Combine user and photo data into a single list
    List<Map<String, dynamic>> combinedData = [];
    for (int i = 0; i < max(users.length, photos.length); i++) {
      combinedData.add({
        'name': i < users.length ? users[i]['name'] ?? '' : '',
        'username': i < users.length ? users[i]['username'] ?? '' : '',
        'thumbnailUrl': i < photos.length ? photos[i]['thumbnailUrl'] ?? '' : '',

      });
    }
   return Scaffold(
      appBar: AppBar(
         title: Center(
           child: const Text('User Profile',
            style: TextStyle(color: Colors.white, fontSize: 20),
                   ),
         ),
          backgroundColor: Color.fromARGB(235, 38, 43, 37),
       ), 
        body: Container(
           decoration: BoxDecoration(
            color: Color.fromARGB(255,12, 19, 23), 
            
          ), 
          child: ListView.builder(
          
          itemCount: combinedData.length,
          itemBuilder: (context, index) {
            final userData = combinedData[index];
            final name = userData['name'] ?? '';
            final username = userData['username'] ?? '';
            final thumbnailUrl = userData['thumbnailUrl'];
                
              return GestureDetector(
                onTap: () {
          Navigator.pushNamed(
            context,
            '/detail',
            arguments: {
              'thumbnailUrl': thumbnailUrl,
              'name': name,
              'username': users[index]['username'],
              'email': users[index]['email'],
                'address': {
                'street': users[index]['address']['street'],
                'suite': users[index]['address']['suite'],
                'city': users[index]['address']['city'],
                'zipcode': users[index]['address']['zipcode'],
                'lat': users[index]['address']['geo']['lat'],
                'lng': users[index]['address']['geo']['lng'],
              },
              'phone': users[index]['phone'],
              'website': users[index]['website'],
            },
          );
                },
        child:Column(
          children: [
              ListTile(
              
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(thumbnailUrl),
                ),
                title: 
                    Text(
                      name,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                          
                subtitle: 
                    Text(
                      username,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
              
                  trailing: Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: Colors.grey,
                  size: 10.0,
                ),
                ),
            
            
                Divider(
                  color: Color.fromARGB(38, 158, 158, 158),
                  thickness: 1.0,
                   indent: 70,
                  endIndent: 28,
                  // height: 1,
                ),
          ]
    ),

        );
      },
    ),
  ),
 ); 
}
}