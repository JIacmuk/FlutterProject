import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:flop/presentation/extensions/extensions.dart';
class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
// для следующей лабораторной работы
// context.go('/home/article/1');
      },
      borderRadius: BorderRadius.circular(5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
              width: 100,
              height: 100,
              'https://media.sketchfab.com/models/6a298927c97c4feaa6cae0ba21cadf73/thumbnails/49246466a0b346f9b1d8be542257c46c/69d1cb01171a4572a67d8d99bbeba645.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          20.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Шлеппа в кубе',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                5.ph,
                Text(
                  'Распространи',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}