import 'package:json_annotation/json_annotation.dart';


part 'Customer.g.dart';

@JsonSerializable()
class Customer{
  int id;
  String name;

  Customer(this.id,this.name);

   factory Customer.fromJson(Map<String, dynamic> json) => _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}