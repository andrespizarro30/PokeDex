class AllPokemons {

  int _count = 0;
  int get count => _count;
  set count(int count) => _count = count;
  List<Results> _results = [];
  List<Results> get results => _results;
  set results(List<Results> results) => _results = results;

  AllPokemons({required int count, required List<Results> results}) {
    if (count != null) {
      this._count = count;
    }
    if (results != null) {
      this._results = results;
    }
  }

  AllPokemons.fromJson(Map<String, dynamic> json) {
    _count = json['count'];
    if (json['results'] != null) {
      _results = <Results>[];
      json['results'].forEach((v) {
        _results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this._count;
    if (this._results != null) {
      data['results'] = this._results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? _name;
  String? _url;

  Results({String? name, String? url}) {
    if (name != null) {
      this._name = name;
    }
    if (url != null) {
      this._url = url;
    }
  }

  String? get name => _name;
  set name(String? name) => _name = name;
  String? get url => _url;
  set url(String? url) => _url = url;

  Results.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this._name;
    data['url'] = this._url;
    return data;
  }
}