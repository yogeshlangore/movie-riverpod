import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_riverpod/models/movies.dart';
import 'package:movie_riverpod/presentation/screens/movies_details_screen.dart';
import 'package:movie_riverpod/providers/movies_providers.dart';
import 'package:movie_riverpod/utils/constant.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final AsyncValue<List<Result>> asyncData =
        ref.watch(movieSearchProvider(controller.text));
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            width: MediaQuery.of(context).size.width * 0.9,
            child: TextField(
              controller: controller,
              onChanged: (value) => ref.invalidate(movieSearchProvider),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w600),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.black),
                contentPadding: const EdgeInsets.only(left: 20, right: 20),
                hintText: 'Type a Movie Title',
                hintStyle: const TextStyle(color: Colors.black, fontSize: 15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          asyncData.when(
            data: (data) => SizedBox(
              height: height * 0.75,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailsScreen(result: data[index])));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      data[index].title.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            error: (error, stackTrace) => const Text(
              'unable to fetch movie Details',
              style: TextStyle(color: Colors.white),
            ),
            loading: () => const Center(
                child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(color: Colors.blue))),
          )
        ],
      ),
    );
  }
}
