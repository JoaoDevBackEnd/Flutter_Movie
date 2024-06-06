class MovieComment {
  final int id;
  final String comment;
  final DateTime createAt;

  MovieComment(
      {required this.id, required this.comment, required this.createAt});

  factory MovieComment.fromJson(Map<String,dynamic> json)
   => MovieComment(id:json['id'], 
   comment: json['comment'], 
   createAt:DateTime.parse(json ['date_created']));
}
