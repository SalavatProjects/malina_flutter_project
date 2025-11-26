// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ProductModel _$ProductModelFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'food':
          return FoodProductModel.fromJson(
            json
          );
                case 'beauty':
          return BeautyProductModel.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ProductModel',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ProductModel implements DiagnosticableTreeMixin {

 int get id; String get category; String get subcategory; String get name; double get price; String? get imagePath;
/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductModelCopyWith<ProductModel> get copyWith => _$ProductModelCopyWithImpl<ProductModel>(this as ProductModel, _$identity);

  /// Serializes this ProductModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('subcategory', subcategory))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('imagePath', imagePath));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,imagePath);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductModel(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $ProductModelCopyWith<$Res>  {
  factory $ProductModelCopyWith(ProductModel value, $Res Function(ProductModel) _then) = _$ProductModelCopyWithImpl;
@useResult
$Res call({
 int id, String category, String subcategory, String name, double price, String? imagePath
});




}
/// @nodoc
class _$ProductModelCopyWithImpl<$Res>
    implements $ProductModelCopyWith<$Res> {
  _$ProductModelCopyWithImpl(this._self, this._then);

  final ProductModel _self;
  final $Res Function(ProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? imagePath = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subcategory: null == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductModel].
extension ProductModelPatterns on ProductModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( FoodProductModel value)?  food,TResult Function( BeautyProductModel value)?  beauty,required TResult orElse(),}){
final _that = this;
switch (_that) {
case FoodProductModel() when food != null:
return food(_that);case BeautyProductModel() when beauty != null:
return beauty(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( FoodProductModel value)  food,required TResult Function( BeautyProductModel value)  beauty,}){
final _that = this;
switch (_that) {
case FoodProductModel():
return food(_that);case BeautyProductModel():
return beauty(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( FoodProductModel value)?  food,TResult? Function( BeautyProductModel value)?  beauty,}){
final _that = this;
switch (_that) {
case FoodProductModel() when food != null:
return food(_that);case BeautyProductModel() when beauty != null:
return beauty(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String category,  String subcategory,  String name,  double price,  String? imagePath,  List<String> additivies)?  food,TResult Function( int id,  String category,  String subcategory,  String name,  double price,  String? imagePath)?  beauty,required TResult orElse(),}) {final _that = this;
switch (_that) {
case FoodProductModel() when food != null:
return food(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.imagePath,_that.additivies);case BeautyProductModel() when beauty != null:
return beauty(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.imagePath);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String category,  String subcategory,  String name,  double price,  String? imagePath,  List<String> additivies)  food,required TResult Function( int id,  String category,  String subcategory,  String name,  double price,  String? imagePath)  beauty,}) {final _that = this;
switch (_that) {
case FoodProductModel():
return food(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.imagePath,_that.additivies);case BeautyProductModel():
return beauty(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.imagePath);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String category,  String subcategory,  String name,  double price,  String? imagePath,  List<String> additivies)?  food,TResult? Function( int id,  String category,  String subcategory,  String name,  double price,  String? imagePath)?  beauty,}) {final _that = this;
switch (_that) {
case FoodProductModel() when food != null:
return food(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.imagePath,_that.additivies);case BeautyProductModel() when beauty != null:
return beauty(_that.id,_that.category,_that.subcategory,_that.name,_that.price,_that.imagePath);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class FoodProductModel with DiagnosticableTreeMixin implements ProductModel {
  const FoodProductModel({required this.id, this.category = AppConstants.productFood, required this.subcategory, required this.name, required this.price, this.imagePath, final  List<String> additivies = const [], final  String? $type}): _additivies = additivies,$type = $type ?? 'food';
  factory FoodProductModel.fromJson(Map<String, dynamic> json) => _$FoodProductModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String category;
@override final  String subcategory;
@override final  String name;
@override final  double price;
@override final  String? imagePath;
 final  List<String> _additivies;
@JsonKey() List<String> get additivies {
  if (_additivies is EqualUnmodifiableListView) return _additivies;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_additivies);
}


@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodProductModelCopyWith<FoodProductModel> get copyWith => _$FoodProductModelCopyWithImpl<FoodProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodProductModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductModel.food'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('subcategory', subcategory))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('imagePath', imagePath))..add(DiagnosticsProperty('additivies', additivies));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&const DeepCollectionEquality().equals(other._additivies, _additivies));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,imagePath,const DeepCollectionEquality().hash(_additivies));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductModel.food(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, imagePath: $imagePath, additivies: $additivies)';
}


}

/// @nodoc
abstract mixin class $FoodProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory $FoodProductModelCopyWith(FoodProductModel value, $Res Function(FoodProductModel) _then) = _$FoodProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String category, String subcategory, String name, double price, String? imagePath, List<String> additivies
});




}
/// @nodoc
class _$FoodProductModelCopyWithImpl<$Res>
    implements $FoodProductModelCopyWith<$Res> {
  _$FoodProductModelCopyWithImpl(this._self, this._then);

  final FoodProductModel _self;
  final $Res Function(FoodProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? imagePath = freezed,Object? additivies = null,}) {
  return _then(FoodProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subcategory: null == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,additivies: null == additivies ? _self._additivies : additivies // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
@JsonSerializable()

class BeautyProductModel with DiagnosticableTreeMixin implements ProductModel {
  const BeautyProductModel({required this.id, this.category = AppConstants.productBeauty, required this.subcategory, required this.name, required this.price, this.imagePath, final  String? $type}): $type = $type ?? 'beauty';
  factory BeautyProductModel.fromJson(Map<String, dynamic> json) => _$BeautyProductModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String category;
@override final  String subcategory;
@override final  String name;
@override final  double price;
@override final  String? imagePath;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BeautyProductModelCopyWith<BeautyProductModel> get copyWith => _$BeautyProductModelCopyWithImpl<BeautyProductModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BeautyProductModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProductModel.beauty'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('subcategory', subcategory))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('price', price))..add(DiagnosticsProperty('imagePath', imagePath));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BeautyProductModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.subcategory, subcategory) || other.subcategory == subcategory)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,subcategory,name,price,imagePath);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProductModel.beauty(id: $id, category: $category, subcategory: $subcategory, name: $name, price: $price, imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $BeautyProductModelCopyWith<$Res> implements $ProductModelCopyWith<$Res> {
  factory $BeautyProductModelCopyWith(BeautyProductModel value, $Res Function(BeautyProductModel) _then) = _$BeautyProductModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String category, String subcategory, String name, double price, String? imagePath
});




}
/// @nodoc
class _$BeautyProductModelCopyWithImpl<$Res>
    implements $BeautyProductModelCopyWith<$Res> {
  _$BeautyProductModelCopyWithImpl(this._self, this._then);

  final BeautyProductModel _self;
  final $Res Function(BeautyProductModel) _then;

/// Create a copy of ProductModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? category = null,Object? subcategory = null,Object? name = null,Object? price = null,Object? imagePath = freezed,}) {
  return _then(BeautyProductModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,subcategory: null == subcategory ? _self.subcategory : subcategory // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,imagePath: freezed == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
