class Wallpapermodel{
  String photographer;
  int photographer_id;
  String photographer_url;
  Srcmodel src;
  // ignore: non_constant_identifier_names
  Wallpapermodel({this.src,this.photographer,this.photographer_id,this.photographer_url});
  factory Wallpapermodel.fromMap(Map<String,dynamic> jsondata){
    return Wallpapermodel(src:Srcmodel.fromMap(jsondata['src']),photographer: jsondata['photographer'],photographer_id: jsondata['photographer_id'],photographer_url: jsondata['photographer_url'])
 ; }

}
class Srcmodel{
  String portrait;
  String small;
  String original;
  Srcmodel({this.original,this.portrait,this.small});
  factory Srcmodel.fromMap(Map<String,dynamic>jsondata){
    return Srcmodel(portrait:jsondata['portrait'],original:jsondata['original'],small:jsondata['small']);

  }
}