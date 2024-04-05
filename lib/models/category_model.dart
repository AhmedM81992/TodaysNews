import 'package:flutter/material.dart';

class CategoryModel {
  String id;
  String title;
  String image;
  Color color;

  CategoryModel(this.id, this.title, this.image, this.color);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel(
        "sports",
        "Sports",
        "assets/images/ball.png",
        Color(0xFFC91C22),
      ),
      CategoryModel(
        "business",
        "Business",
        "assets/images/business.png",
        Color(0xFFCF7E48),
      ),
      CategoryModel(
        "entertainment",
        "Entertainment",
        "assets/images/environment.png",
        Color(0xFF4882CF),
      ),
      CategoryModel(
        "science",
        "Science",
        "assets/images/science.png",
        Color(0xFFF2D352),
      ),
      CategoryModel(
        "health",
        "Health",
        "assets/images/health.png",
        Color(0xFFED1E79),
      ),
      CategoryModel(
        "general",
        "General",
        "assets/images/politics.png",
        Color(0xFF003E90),
      ),
    ];
  }
}
