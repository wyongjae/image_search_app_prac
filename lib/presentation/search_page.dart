import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_search_app_prac/data/photo_data.dart';
import 'package:image_search_app_prac/presentation/components/photo_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<String> urls = [];

  bool isLoading = false;

  Future<String> loadAStudentAsset() async {
    return await rootBundle.loadString('assets/photo.json');
  }

  Future<List<String>> loadPhoto() async {
    String jsonString = await loadAStudentAsset();
    Map<String, dynamic> jsonResponse = jsonDecode(jsonString);

    PhotoData photoData = PhotoData.fromJson(jsonResponse);

    return photoData.hits.map((e) => e.previewURL).toList();
  }

  Future<void> delay() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    urls = await loadPhoto();

    setState(() {
      isLoading = false;
    });
  } // 3초간 로딩 화면 표시

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '이미지 검색 앱',
          textAlign: TextAlign.center,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      await delay();
                    },
                    icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            isLoading
                ? const CircularProgressIndicator()
                : Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.only(top: 10),
                        itemCount: urls.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return PhotoWidget(url: urls[index]);
                        }),
                  )
          ],
        ),
      ),
    );
  }
}