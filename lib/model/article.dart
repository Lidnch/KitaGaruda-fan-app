class NewsArticle {
  String title;
  String author;
  String location;
  String content;
  String imageThumbnail;
  List<String> imageUrls;

  NewsArticle ({
    required this.title,
    required this.author,
    required this.location,
    required this.content,
    required this.imageThumbnail,
    required this.imageUrls,
  });
  
}

// var NewsArticleList = [
//   NewsArticle(
//     title: title, 
//     author: author, 
//     location: location, 
//     content: content, 
//     imageThumbnail: imageThumbnail, 
//     imageUrls: imageUrls
//   ),
// ];