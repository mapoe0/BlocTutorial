import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tuto_app/features/joke/presentation/pages/joke_page.dart';

class CategoriesLoadedWidget extends StatelessWidget {
  const CategoriesLoadedWidget({
    Key? key,
    required this.categories,
  }) : super(key: key);
  final List<String> categories;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: ((context, index) => Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => JokePage(
                            category: categories[index],
                          ))),
                  child: Text(
                    categories[index],
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )));
  }
}
