import 'package:flutter/material.dart';
import 'package:flutter_app/myordersmodel.dart';
class OrderDetail extends StatelessWidget {
  final MyordersModel myordersModel;
  const OrderDetail({Key? key,required this.myordersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(myordersModel.name),),
      body: Column(
        children: [
          Image.network(myordersModel.ImageUrl),
          Text(myordersModel.desc)
        ],
      ),
    );
  }
}