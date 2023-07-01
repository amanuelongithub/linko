// ignore: file_names
class Item {
  final String itemId;
  final String name;
  final String timeTake;
  final String phonenum;
  final String deliveryFee;
  final String price;
  final String slug;
  final String imgUrl;
   bool isfavorite;

  Item({
    required this.itemId,
    required this.name,
    required this.timeTake,
    required this.phonenum,
    required this.deliveryFee,
    required this.price,
    required this.slug,
    required this.imgUrl,
    required this.isfavorite,
  });


  Map<String, Object> toJson() => {
        'itemId': itemId,
        'name': name,
        'timeTake': timeTake,
        'phonenum': phonenum,
        'deliveryFee': deliveryFee,
        'price': price,
        'slug': slug,
        'imgUrl': imgUrl,
        'isfavorite': isfavorite ? 1 : 0,
      };
}
