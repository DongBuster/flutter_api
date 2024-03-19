import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_api/model_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _focusnode = FocusNode();
  late Future<ModelNew> futureModelNew;

  @override
  void initState() {
    super.initState();
    // futureModelNew = fetchModelNew();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(5, 12, 12, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Mon, 5th September 2022',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            const Text(
              'Explore',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width - 10,
              child: TextField(
                focusNode: _focusnode,
                onTapOutside: (event) {
                  setState(() {
                    _focusnode.unfocus();
                  });
                },
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.black38,
                  ),
                  hintText: 'Search for article',
                  contentPadding: const EdgeInsets.only(top: 10),
                  hintStyle:
                      const TextStyle(fontSize: 14, color: Colors.black38),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                ),
              ),
            ),
            const SizedBox(height: 6),
            //--- list ----
            SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width - 10,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 55,
                    child: const Center(
                      child: Text(
                        'All',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: 70,
                    child: const Center(
                      child: Text(
                        'Politics',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Sports',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Heath',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Container(
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black38),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Animals',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            FutureBuilder(
                future: fetchModelNew(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final jsonContent = snapshot.data;
                    List<ModelNew> list =
                        jsonContent!.map((e) => ModelNew.fromJson(e)).toList();
                    return SizedBox(
                        height: MediaQuery.of(context).size.height - 200,
                        child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return Text(list[index].title);
                          },
                        ));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }

                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                }),

            // News,
          ],
        ),
      ),
    );
  }
}

class News extends StatelessWidget {
  final ModelNew news;
  const News({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(news.urlToImage),
        Column(
          children: [
            const SizedBox(
              height: 50,
              child: Text(
                'gdfsgdsksdjksdjflflflflflflldksfj sldkfkkkkkfkfklskd  sdlkfk',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
            ),
            Text(
              news.author,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black38,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '3 hours ago',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  'polisd',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
                Text(
                  '6 mins',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black38,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}

Future<List<dynamic>> fetchModelNew() async {
  final response = await http.get(Uri.parse(
      'https://newsapi.org/v2/everything?q=tesla&from=2024-02-19&sortBy=publishedAt&apiKey=cab296018ecc4494993580b31d962caa'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    Map<String, dynamic> data = jsonDecode(response.body);
    // print(data['articles']);
    // Map<String, dynamic> articles = data['articles'];
    return data['articles'];
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
