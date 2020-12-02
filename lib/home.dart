import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:wallpaperapp/data/data.dart';
import 'package:wallpaperapp/model/Categoriesmodel.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapp/model/Wallpapermodel.dart';
import 'package:wallpaperapp/view/category.dart';
import 'package:wallpaperapp/view/search.dart';
import 'package:wallpaperapp/widget/widget.dart';
class Home extends StatefulWidget{
  _HomeState createState()=>_HomeState();
}
class _HomeState extends State<Home>
{ List<Categorymodel> categories=new List();
int noOfimage=30;
TextEditingController textEditingController=new TextEditingController();
List<Wallpapermodel>wallpaper=new List();
gettrandingwallpapers() async{
  var response= await http.get("https://api.pexels.com/v1/curated?per_page=$noOfimage&page=1",headers: {"Authorization":ApiKey});

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
{ gettrandingwallpapers();
  categories=getcategory();
  super.initState();
}
  Widget build(BuildContext context)
  {
   return Scaffold(
     appBar:AppBar(
       title:BrandName(),
     elevation:0.0,
   ), backgroundColor: Colors.white,
    body:SingleChildScrollView(
     child: Container(
        child:Column(
       children:<Widget>[
         Container(
       decoration: BoxDecoration(
       color:Color(0xfff5f8fd),
       borderRadius: BorderRadius.circular(30)),
      margin:EdgeInsets.symmetric(horizontal:24),
      padding:EdgeInsets.symmetric(horizontal:24) ,
         child:Row(children: <Widget>[
           Expanded(
             child: TextField(
               controller: textEditingController,
             decoration: InputDecoration(
               border: InputBorder.none,
               hintText:"search wallpaper"
             ),
           )),
           GestureDetector(
             onTap:(){if(textEditingController.text!=""){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Search(
                searchquery:textEditingController.text,
              )));}},
             child:Container(
               child:Icon(Icons.search)),)
         ],)),
         SizedBox(height: 16,),
         Container(
           height:80,child:
          ListView.builder(
           padding:EdgeInsets.symmetric(horizontal:24),
          itemCount: categories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
           // ignore: missing_return
           itemBuilder:(context,index){
             return Categorytile(imgurl:categories[index].categoryurl ,title:categories[index].categoryname 
               );
           })),
           Wallpaperlist(wallpapers:wallpaper,context:context)
       ]
     )
   ,),));
  }

}
class Categorytile extends StatelessWidget{
  final String imgurl,title;
  Categorytile({@required this.title,@required this.imgurl});
  Widget build(BuildContext context){
    return GestureDetector(
      onTap:(){
        Navigator.push(context,MaterialPageRoute(
          builder:(context)=>Category(CategoryName: title.toLowerCase(),)
        ));
      },
      child:Container(
      margin:EdgeInsets.only(right:6),
      child:Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius:BorderRadius.circular(15),
          child:Image.network(imgurl,fit:BoxFit.cover,height:50 ,width: 100,),)
          
        
,        Container(
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(15),
                  color:Colors.black26,),
                  height: 50,
                  width: 100,
          alignment: Alignment.center,
          child: Text(title,style:TextStyle(color:Colors.white,fontSize:15, 
                            fontFamily: 'Overpass')),
        )
      ],)
    ,));


  }
}
