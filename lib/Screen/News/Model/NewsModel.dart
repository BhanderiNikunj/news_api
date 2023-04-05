class NewsModel {
  String? status;
  int? totalResults;
  List? articles;

  NewsModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  NewsModel NewsFromJson(Map m1) {
    status = m1['status'];
    totalResults = m1['totalResults'];
    List articlesList = m1['articles'];
    articles =
        articlesList.map((e) => articlesModel().aeticalesFromJson(e)).toList();

    NewsModel n1 = NewsModel(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );

    return n1;
  }
}

class articlesModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  sourceModel? s1;

  articlesModel({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.s1,
  });

  articlesModel aeticalesFromJson(Map m1) {
    s1 = sourceModel().sourceFromJson(m1['source']);
    urlToImage = m1['urlToImage'];
    title = m1['title'];
    url = m1['url'];
    author = m1['author'];
    description = m1['description'];
    publishedAt = m1['publishedAt'];
    content = m1['content'];

    articlesModel a1 = articlesModel(
      author: author,
      title: title,
      content: content,
      description: description,
      publishedAt: publishedAt,
      s1: s1,
      url: url,
      urlToImage: urlToImage,
    );
    return a1;
  }
}

class sourceModel {
  String? id, name;

  sourceModel({
    this.id,
    this.name,
  });

  sourceModel sourceFromJson(Map m1) {
    id = m1['id'];
    name = m1['name'];

    sourceModel s1 = sourceModel(
      id: id,
      name: name,
    );

    return s1;
  }
}
