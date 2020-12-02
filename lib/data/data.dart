import 'package:wallpaperapp/model/Categoriesmodel.dart';
// ignore: non_constant_identifier_names
String ApiKey="563492ad6f91700001000001416faccbac154aa6864be39f63aaf6be";
List<Categorymodel> getcategory()
{
  List<Categorymodel> categories=new List();
  Categorymodel categorymodel=new Categorymodel();
  categorymodel.categoryname="Street Art";
  categorymodel.categoryurl="https://images.pexels.com/photos/545008/pexels-photo-545008.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categorymodel);
   categorymodel=new Categorymodel();
   categorymodel.categoryname="Wild life";
  categorymodel.categoryurl="https://images.pexels.com/photos/704320/pexels-photo-704320.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categorymodel);
   categorymodel=new Categorymodel();
   categorymodel.categoryname="Nature";
  categorymodel.categoryurl="https://images.pexels.com/photos/34950/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categorymodel);
   categorymodel=new Categorymodel();
   categorymodel.categoryname="Motivation";
  categorymodel.categoryurl="https://images.pexels.com/photos/1434819/pexels-photo-1434819.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260";
  categories.add(categorymodel);
   categorymodel=new Categorymodel();
   categorymodel.categoryname="Bikes";
  categorymodel.categoryurl="https://images.pexels.com/photos/2116475/pexels-photo-2116475.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categorymodel);
  categorymodel=new Categorymodel();
  categorymodel.categoryname="Cars";
  categorymodel.categoryurl="https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500";
  categories.add(categorymodel);
   return categories;

}