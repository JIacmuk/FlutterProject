
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flop/domain/useCase/getAllFacts.dart';
import 'package:flop/data/apiClient.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flop/presentation/extensions/extensions.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String desc;
  final String? imageUrl;

  const ArticleCard({
    required this.title,
    required this.desc,
    required this.imageUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.go('/description');
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
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          20.pw,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                5.ph,
                Text(
                  desc,
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