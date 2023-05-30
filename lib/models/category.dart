import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}

class Meal {
  final String categId;
  final String id;
  final String title;
  final String imageUrl;
  final String content;

  const Meal({
    required this.id,
    required this.categId,
    required this.title,
    required this.imageUrl,
    required this.content,
  });
}
