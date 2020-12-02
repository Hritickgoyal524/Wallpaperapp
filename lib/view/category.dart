import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/Wallpapermodel.dart';
import 'package:wallpaperapp/widget/widget.dart';

class Category extends StatefulWidget{
  @override
  _CategoryState createState()=>_CategoryState();
  // ignore: non_constant_identifier_names
  final String CategoryName;
  // ignore: non_constant_identifier_names
  Category({@required this.CategoryName});
}
class _CategoryState extends State<Category>{
List<Wallpapermodel>wallpaper=new List();
   getsearchwallpapers(String query) async{
  var response= await http.get("https://api.pexels.com/v1/search?query=$query&per_page=30&page=1",headers: {"Authorization":ApiKey});

Map<String,dynamic> jsondata=jsonDecode(response.body);
jsondata['photos'].forEach((element){
  Wallpapermodel wallpapermodel=new Wallpapermodel();
  wallpapermodel= Wallpapermodel.fromMap(element);
  wallpaper.add(wallpapermodel);

});
setState(() {
  
});
}
@override
  void initState(){
    getsearchwallpapers(widget.CategoryName);
    super.initState();
  }
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar( 
        title: BrandName(),
      elevation: 0.0,
    ),
    body:SingleChildScrollView(child:Container(
      child: Column(
        children: <Widget>[
        SizedBox(height: 16,),
        Wallpaperlist(wallpapers:wallpaper,context:context)
        ],),) ));
  }
        
      

}