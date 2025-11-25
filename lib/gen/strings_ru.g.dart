///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonRu common = TranslationsCommonRu._(_root);
	late final TranslationsActionRu action = TranslationsActionRu._(_root);
	late final TranslationsAuthRu auth = TranslationsAuthRu._(_root);
	late final TranslationsBottomNavBarContentRu bottom_nav_bar_content = TranslationsBottomNavBarContentRu._(_root);
	late final TranslationsFeedRu feed = TranslationsFeedRu._(_root);

	/// ru: 'Поместите QR-код в рамку'
	String get place_the_qr => 'Поместите QR-код в рамку';

	/// ru: 'корзина'
	String get cart => 'корзина';

	/// ru: 'профиль'
	String get profile => 'профиль';
}

// Path: common
class TranslationsCommonRu {
	TranslationsCommonRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'всего'
	String get all => 'всего';

	/// ru: 'категория'
	String get category => 'категория';

	/// ru: 'подкатегория'
	String get subcategory => 'подкатегория';

	/// ru: 'название'
	String get name => 'название';

	/// ru: 'цена'
	String get price => 'цена';

	/// ru: 'описание'
	String get description => 'описание';
}

// Path: action
class TranslationsActionRu {
	TranslationsActionRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'войти'
	String get sign_in => 'войти';

	/// ru: 'очистить'
	String get clear => 'очистить';

	/// ru: 'добавить'
	String get add => 'добавить';

	/// ru: 'сохранить'
	String get save => 'сохранить';

	/// ru: 'удалить'
	String get delete => 'удалить';

	/// ru: 'выйти'
	String get sign_out => 'выйти';
}

// Path: auth
class TranslationsAuthRu {
	TranslationsAuthRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'почта'
	String get mail => 'почта';

	/// ru: 'пароль'
	String get password => 'пароль';
}

// Path: bottom_nav_bar_content
class TranslationsBottomNavBarContentRu {
	TranslationsBottomNavBarContentRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'лента'
	String get feed => 'лента';

	/// ru: 'избранное'
	String get favorites => 'избранное';

	/// ru: 'профиль'
	String get profile => 'профиль';

	/// ru: 'корзина'
	String get cart => 'корзина';
}

// Path: feed
class TranslationsFeedRu {
	TranslationsFeedRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Искать в Malina'
	String get search => 'Искать в Malina';

	/// ru: 'Сканируй QR-код и заказывай прямо в заведении'
	String get scan_qr => 'Сканируй QR-код и заказывай прямо в заведении';

	late final TranslationsFeedFoodRu food = TranslationsFeedFoodRu._(_root);
	late final TranslationsFeedBeautyRu beauty = TranslationsFeedBeautyRu._(_root);
	late final TranslationsFeedSoonInMalinaRu soon_in_malina = TranslationsFeedSoonInMalinaRu._(_root);
}

// Path: feed.food
class TranslationsFeedFoodRu {
	TranslationsFeedFoodRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'еда'
	String get name => 'еда';

	/// ru: 'Из кафе и ресторанов'
	String get title => 'Из кафе и ресторанов';
}

// Path: feed.beauty
class TranslationsFeedBeautyRu {
	TranslationsFeedBeautyRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'бьюти'
	String get name => 'бьюти';

	/// ru: 'Салоны красоты и товары'
	String get title => 'Салоны красоты и товары';
}

// Path: feed.soon_in_malina
class TranslationsFeedSoonInMalinaRu {
	TranslationsFeedSoonInMalinaRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Скоро в Malina'
	String get name => 'Скоро в Malina';

	List<String> get titles => [
		'вакансии',
		'маркет',
		'цветы',
		'спорт',
		'маркет',
	];
}

/// The flat map containing all translations for locale <ru>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.all' => 'всего',
			'common.category' => 'категория',
			'common.subcategory' => 'подкатегория',
			'common.name' => 'название',
			'common.price' => 'цена',
			'common.description' => 'описание',
			'action.sign_in' => 'войти',
			'action.clear' => 'очистить',
			'action.add' => 'добавить',
			'action.save' => 'сохранить',
			'action.delete' => 'удалить',
			'action.sign_out' => 'выйти',
			'auth.mail' => 'почта',
			'auth.password' => 'пароль',
			'bottom_nav_bar_content.feed' => 'лента',
			'bottom_nav_bar_content.favorites' => 'избранное',
			'bottom_nav_bar_content.profile' => 'профиль',
			'bottom_nav_bar_content.cart' => 'корзина',
			'feed.search' => 'Искать в Malina',
			'feed.scan_qr' => 'Сканируй QR-код и заказывай прямо в заведении',
			'feed.food.name' => 'еда',
			'feed.food.title' => 'Из кафе и ресторанов',
			'feed.beauty.name' => 'бьюти',
			'feed.beauty.title' => 'Салоны красоты и товары',
			'feed.soon_in_malina.name' => 'Скоро в Malina',
			'feed.soon_in_malina.titles.0' => 'вакансии',
			'feed.soon_in_malina.titles.1' => 'маркет',
			'feed.soon_in_malina.titles.2' => 'цветы',
			'feed.soon_in_malina.titles.3' => 'спорт',
			'feed.soon_in_malina.titles.4' => 'маркет',
			'place_the_qr' => 'Поместите QR-код в рамку',
			'cart' => 'корзина',
			'profile' => 'профиль',
			_ => null,
		};
	}
}
