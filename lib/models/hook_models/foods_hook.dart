import 'package:flutter/cupertino.dart';
import 'package:foodapp/models/foods_model.dart';

class FetchFoods {
  final List<FoodsModel>? data;
  final bool isLoading;
  final Exception? error;
  final VoidCallback? refetch;

  FetchFoods({
    required this.data,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}
