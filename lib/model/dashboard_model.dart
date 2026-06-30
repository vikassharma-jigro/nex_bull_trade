class DashboardModel {
  bool? success;
  Data? data;

  DashboardModel({this.success, this.data});

  DashboardModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Portfolio? portfolio;
  List<MarketIndices>? marketIndices;
  List<Watchlist>? watchlist;
  List<TrendingNews>? trendingNews;

  Data({this.portfolio, this.marketIndices, this.watchlist, this.trendingNews});

  Data.fromJson(Map<String, dynamic> json) {
    portfolio = json['portfolio'] != null
        ? new Portfolio.fromJson(json['portfolio'])
        : null;
    if (json['market_indices'] != null) {
      marketIndices = <MarketIndices>[];
      json['market_indices'].forEach((v) {
        marketIndices!.add(new MarketIndices.fromJson(v));
      });
    }
    if (json['watchlist'] != null) {
      watchlist = <Watchlist>[];
      json['watchlist'].forEach((v) {
        watchlist!.add(new Watchlist.fromJson(v));
      });
    }
    if (json['trending_news'] != null) {
      trendingNews = <TrendingNews>[];
      json['trending_news'].forEach((v) {
        trendingNews!.add(new TrendingNews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.portfolio != null) {
      data['portfolio'] = this.portfolio!.toJson();
    }
    if (this.marketIndices != null) {
      data['market_indices'] =
          this.marketIndices!.map((v) => v.toJson()).toList();
    }
    if (this.watchlist != null) {
      data['watchlist'] = this.watchlist!.map((v) => v.toJson()).toList();
    }
    if (this.trendingNews != null) {
      data['trending_news'] =
          this.trendingNews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Portfolio {
  int? currentPortfolioValue;
  int? totalInvestment;
  int? overallReturn;
  int? percentageIncrease;

  Portfolio(
      {this.currentPortfolioValue,
        this.totalInvestment,
        this.overallReturn,
        this.percentageIncrease});

  Portfolio.fromJson(Map<String, dynamic> json) {
    currentPortfolioValue = json['current_portfolio_value'];
    totalInvestment = json['total_investment'];
    overallReturn = json['overall_return'];
    percentageIncrease = json['percentage_increase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_portfolio_value'] = this.currentPortfolioValue;
    data['total_investment'] = this.totalInvestment;
    data['overall_return'] = this.overallReturn;
    data['percentage_increase'] = this.percentageIncrease;
    return data;
  }
}

class MarketIndices {
  int? id;
  String? name;
  String? symbol;
  String? value;
  String? changeAmount;
  String? changePercent;

  MarketIndices(
      {this.id,
        this.name,
        this.symbol,
        this.value,
        this.changeAmount,
        this.changePercent});

  MarketIndices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    symbol = json['symbol'];
    value = json['value'];
    changeAmount = json['change_amount'];
    changePercent = json['change_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['symbol'] = this.symbol;
    data['value'] = this.value;
    data['change_amount'] = this.changeAmount;
    data['change_percent'] = this.changePercent;
    return data;
  }
}

class Watchlist {
  int? id;
  String? symbol;
  String? name;
  String? currentPrice;
  String? changeAmount;
  String? changePercent;

  Watchlist(
      {this.id,
        this.symbol,
        this.name,
        this.currentPrice,
        this.changeAmount,
        this.changePercent});

  Watchlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    symbol = json['symbol'];
    name = json['name'];
    currentPrice = json['current_price'];
    changeAmount = json['change_amount'];
    changePercent = json['change_percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    data['current_price'] = this.currentPrice;
    data['change_amount'] = this.changeAmount;
    data['change_percent'] = this.changePercent;
    return data;
  }
}

class TrendingNews {
  int? id;
  String? title;
  String? content;
  String? image;
  String? source;
  String? publishedAt;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  TrendingNews(
      {this.id,
        this.title,
        this.content,
        this.image,
        this.source,
        this.publishedAt,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  TrendingNews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    image = json['image'];
    source = json['source'];
    publishedAt = json['published_at'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['image'] = this.image;
    data['source'] = this.source;
    data['published_at'] = this.publishedAt;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
