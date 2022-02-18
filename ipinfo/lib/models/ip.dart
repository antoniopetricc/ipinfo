class Ip {
  Ip({
    required this.ip,
    required this.city,
    required this.region,
    required this.country,
    required this.loc,
    required this.org,
    required this.postal,
    required this.timezone,
  });
  late final String ip;
  late final String city;
  late final String region;
  late final String country;
  late final String loc;
  late final String org;
  late final String postal;
  late final String timezone;

  Ip.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    city = json['city'];
    region = json['region'];
    country = json['country'];
    loc = json['loc'];
    org = json['org'];
    postal = json['postal'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ip'] = ip;
    _data['city'] = city;
    _data['region'] = region;
    _data['country'] = country;
    _data['loc'] = loc;
    _data['org'] = org;
    _data['postal'] = postal;
    _data['timezone'] = timezone;
    return _data;
  }
}
