import 'dart:convert';
import 'package:http/http.dart' as http;
import'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/Wallpapermodel.dart';
import 'package:wallpaperapp/widget/widget.dart';
class Search extends StatefulWidget{
  final String searchquery;
Search({this.searchquery});
_SearchState createState()=>_SearchState();  

}
class _SearchState extends State<Search>{
  TextEditingController textEditingController=new TextEditingController();
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
  void initState()
  {
     getsearchwallpapers(widget.searchquery);
  textEditingController.text=widget.searchquery;
   super.initState(); 
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(appBar:
    AppBar(
      title: BrandName(),
      elevation: 0.0,
    ),
    backgroundColor: Colors.white,
    body:SingleChildScrollView(child:Container(
      child: Column(
        children: <Widget>[
          Container(
       decoration: BoxDecoration(
       color:Color(0xfff5f8fd),
       borderRadius: BorderRadius.circular(30)),
      margin:EdgeInsets.symmetric(horizontal:25),
      padding:EdgeInsets.symmetric(horizontal:25) ,
         child:Row(children: <Widget>[
           Expanded(
             child: TextField(
               controller: textEditingController,
             decoration: InputDecoration(
               border: InputBorder.none,
               hintText:"search Wallpaper"
             ),
           )),
           GestureDetector(
             onTap:(){
               getsearchwallpapers(textEditingController.text);
             },
             child:Container(
               child:Icon(Icons.search)),)
         ],
         )
         ),
          SizedBox(height: 16,),
          Wallpaperlist(wallpapers:wallpaper,context:context)
        ],),) ));
  }

}