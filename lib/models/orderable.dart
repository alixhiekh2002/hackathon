import 'package:flutter/material.dart';

class Order {
  final Image image;
  final String titleofProduct;
  final int priceOfProduct;
  final String subTitle;

  Order(
    this.image,
    this.titleofProduct, this.priceOfProduct, this.subTitle,
  );
}
