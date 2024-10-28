class PinModel {
   int? id;
   String?author;
   String? imageUrl;
   String? description;
   bool? liked;

   PinModel.fromJson(Map json) {
      id = json['id'];
      author = json['photographer'];
      imageUrl = json['src']['tiny'];
      liked = json['liked'];
      description = json['alt'];
    }

    static List<PinModel> fromJsonList(dynamic list) {
      List <PinModel> result = [];
      list.forEach((e)=>result.add(PinModel.fromJson(e)));
      return result;
    }
}