import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:restpract/Widgets/postCard.dart';
import 'package:restpract/model/posts.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RestApi(),
    );
  }
}

Future<List<Post>> fetchPost() async {
  final response = await http.get(Uri.parse(
      'https://raw.githubusercontent.com/RishabhRaghunath/JustATest/master/posts'));

  if (response.statusCode == 200) {
    print("No error");
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Post.fromJson(job)).toList();
  } else {
    throw Exception('Failed miserably, Pathetic ;-;');
  }
}

class RestApi extends StatefulWidget {
  const RestApi({Key? key}) : super(key: key);

  @override
  State<RestApi> createState() => _RestApiState();
}

class _RestApiState extends State<RestApi> {
  Future<List<Post>>? post;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    post = fetchPost();
    print(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Post>>(
          future: post,
          builder: (context, abc) {
            print(abc);
            if (abc.hasData) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemCount: abc.data!.length,
                  itemBuilder: (context, item) {
                    return PostCard(
                      id: abc.data![item].id,
                      body: abc.data![item].body,
                      time: abc.data![item].time,
                      imageUrl: abc.data?[item].imageUrl,
                      title: abc.data![item].title,
                    );
                  });
            } else if (abc.hasError) {
              return Text("Has error");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
