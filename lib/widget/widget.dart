import 'package:flutter/material.dart';

import 'package:wallpaperapp/model/Wallpapermodel.dart';
import 'package:wallpaperapp/view/imageview.dart';
// ignore: non_constant_identifier_names
Widget BrandName()
{
return RichText(
  text: TextSpan(
    style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),
    children: <TextSpan>[
      TextSpan(text: 'Wallpaper', style: TextStyle(color:Colors.black87)),
      TextSpan(text: 'Hub',style: TextStyle(color:Colors.blue)),
    ],
  ),
);}
// ignore: non_constant_identifier_names
Widget Wallpaperlist({List<Wallpapermodel> wallpapers,BuildContext context}){
  return Container(
    padding: EdgeInsets.symmetric(horizontal:16),
    child:GridView.count(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((Wallpapermodel wallpaper){
      return GridTile(
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>ImageView(
                imageUrl: wallpaper.src.portrait,
              )));
          },
          child:Hero(tag: wallpaper.src.portrait,
          child:
          Container(
          child:ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child:  Image.network(wallpaper.src.portrait,fit:BoxFit.cover))
      )
      )
      )
      );
      }).toList(),
      )
    );
}