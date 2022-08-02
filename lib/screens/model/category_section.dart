import 'package:json_annotation/json_annotation.dart';

part 'category_section.g.dart';

@JsonSerializable()
class CategorySection {
  @JsonKey(name: '_v')
  String? V;
  @JsonKey(name: '_type')
  String? Type;
  @JsonKey(name: '_resource_state')
  String? ResourceState;
  @JsonKey(name: 'catalog_id')
  String? catalogId;
  @JsonKey(name: 'categories')
  List<Categorie>? categories;
  @JsonKey(name: 'creation_date')
  String? creationDate;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'last_modified')
  String? lastModified;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'online')
  bool? online;
  @JsonKey(name: 'page_description')
  PageDescription? pageDescription;
  @JsonKey(name: 'page_keywords')
  PageKeywords? pageKeywords;
  @JsonKey(name: 'page_title')
  PageTitle? pageTitle;
  @JsonKey(name: 'c_enableCompare')
  bool? cEnableCompare;
  @JsonKey(name: 'c_showInMenu')
  bool? cShowInMenu;

  CategorySection({
    this.V,
    this.Type,
    this.ResourceState,
    this.catalogId,
    this.categories,
    this.creationDate,
    this.id,
    this.lastModified,
    this.link,
    this.online,
    this.pageDescription,
    this.pageKeywords,
    this.pageTitle,
    this.cEnableCompare,
    this.cShowInMenu,
  });

  factory CategorySection.fromJson(Map<String, dynamic> json) =>
      _$CategorySectionFromJson(json);

  Map<String, dynamic> toJson() => _$CategorySectionToJson(this);
}

@JsonSerializable()
class Categorie {
  @JsonKey(name: '_type')
  String? Type;
  @JsonKey(name: 'catalog_id')
  String? catalogId;
  @JsonKey(name: 'creation_date')
  String? creationDate;
  @JsonKey(name: 'description')
  Description? description;
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'last_modified')
  String? lastModified;
  @JsonKey(name: 'link')
  String? link;
  @JsonKey(name: 'name')
  Name? name;
  @JsonKey(name: 'online')
  bool? online;
  @JsonKey(name: 'page_description')
  PageDescription? pageDescription;
  @JsonKey(name: 'page_keywords')
  PageKeywords? pageKeywords;
  @JsonKey(name: 'page_title')
  PageTitle? pageTitle;
  @JsonKey(name: 'parent_category_id')
  String? parentCategoryId;
  @JsonKey(name: 'thumbnail')
  String? thumbnail;
  @JsonKey(name: 'c_enableCompare')
  bool? cEnableCompare;
  @JsonKey(name: 'c_showInMenu')
  bool? cShowInMenu;

  Categorie(
      {this.Type,
      this.catalogId,
      this.creationDate,
      this.description,
      this.id,
      this.lastModified,
      this.link,
      this.name,
      this.online,
      this.pageDescription,
      this.pageKeywords,
      this.pageTitle,
      this.parentCategoryId,
      this.thumbnail,
      this.cEnableCompare,
      this.cShowInMenu});

  factory Categorie.fromJson(Map<String, dynamic> json) =>
      _$CategorieFromJson(json);

  Map<String, dynamic> toJson() => _$CategorieToJson(this);
}

@JsonSerializable()
class Description {
  @JsonKey(name: 'default')
  String? defaults;

  Description({this.defaults});

  factory Description.fromJson(Map<String, dynamic> json) =>
      _$DescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$DescriptionToJson(this);
}

@JsonSerializable()
class Name {
  @JsonKey(name: 'default')
  String? defaults;
  @JsonKey(name: 'hi-IN')
  String? hi_IN;

  Name({this.defaults, this.hi_IN});

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class PageDescription {
  @JsonKey(name: 'default')
  String? defaults;

  PageDescription({this.defaults});

  factory PageDescription.fromJson(Map<String, dynamic> json) =>
      _$PageDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$PageDescriptionToJson(this);
}

@JsonSerializable()
class PageKeywords {
  @JsonKey(name: 'default')
  String? defaults;

  PageKeywords({this.defaults});

  factory PageKeywords.fromJson(Map<String, dynamic> json) =>
      _$PageKeywordsFromJson(json);

  Map<String, dynamic> toJson() => _$PageKeywordsToJson(this);
}

@JsonSerializable()
class PageTitle {
  @JsonKey(name: 'default')
  String? defaults;

  PageTitle({this.defaults});

  factory PageTitle.fromJson(Map<String, dynamic> json) =>
      _$PageTitleFromJson(json);

  Map<String, dynamic> toJson() => _$PageTitleToJson(this);
}
