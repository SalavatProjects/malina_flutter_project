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
	late final TranslationsValidatorErrorsRu validatorErrors = TranslationsValidatorErrorsRu._(_root);
	late final TranslationsAuthRu auth = TranslationsAuthRu._(_root);
	late final TranslationsBottomNavBarContentRu bottomNavBarContent = TranslationsBottomNavBarContentRu._(_root);
	late final TranslationsFeedRu feed = TranslationsFeedRu._(_root);

	/// ru: 'Поместите QR-код в рамку'
	String get placeTheQr => 'Поместите QR-код в рамку';

	late final TranslationsCartRu cart = TranslationsCartRu._(_root);

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
	String get signIn => 'войти';

	/// ru: 'зарегистрироваться'
	String get signUp => 'зарегистрироваться';

	/// ru: 'очистить'
	String get clear => 'очистить';

	/// ru: 'добавить'
	String get add => 'добавить';

	/// ru: 'сохранить'
	String get save => 'сохранить';

	/// ru: 'удалить'
	String get delete => 'удалить';

	/// ru: 'выйти'
	String get signOut => 'выйти';

	/// ru: 'сканировать'
	String get scan => 'сканировать';
}

// Path: validatorErrors
class TranslationsValidatorErrorsRu {
	TranslationsValidatorErrorsRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Некорректно введен Email'
	String get incorrectEmail => 'Некорректно введен Email';

	/// ru: 'Поле не должно быть пустым'
	String get emptyField => 'Поле не должно быть пустым';

	/// ru: 'Пароль должен содержать минимум ${count: int} символов'
	String minLengthPassword({required int count}) => 'Пароль должен содержать минимум ${count} символов';

	/// ru: 'Пароли не совпадают'
	String get passwordsNotMatch => 'Пароли не совпадают';
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

	/// ru: 'Повторите пароль'
	String get repeatPassword => 'Повторите пароль';

	late final TranslationsAuthErrorsRu errors = TranslationsAuthErrorsRu._(_root);
}

// Path: bottomNavBarContent
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
	String get scanQr => 'Сканируй QR-код и заказывай прямо в заведении';

	late final TranslationsFeedFoodRu food = TranslationsFeedFoodRu._(_root);
	late final TranslationsFeedBeautyRu beauty = TranslationsFeedBeautyRu._(_root);
	late final TranslationsFeedSoonInMalinaRu soonInMalina = TranslationsFeedSoonInMalinaRu._(_root);
}

// Path: cart
class TranslationsCartRu {
	TranslationsCartRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'корзина'
	String get name => 'корзина';

	/// ru: 'Нет товаров в корзине из категории ${categoty: String}'
	String noProductsByThisCategory({required String categoty}) => 'Нет товаров в корзине из категории ${categoty}';

	/// ru: 'добавки'
	String get additivies => 'добавки';

	/// ru: 'всего'
	String get total => 'всего';
}

// Path: auth.errors
class TranslationsAuthErrorsRu {
	TranslationsAuthErrorsRu._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ru: 'Пользователь не найден'
	String get userNotFound => 'Пользователь не найден';

	/// ru: 'Email или пароль неверны'
	String get invalidEmailOrPassword => 'Email или пароль неверны';

	/// ru: 'Слишком много попыток входа'
	String get tooManyAttempts => 'Слишком много попыток входа';

	/// ru: 'Этот email уже зарегистрирован'
	String get emailAlreadyExists => 'Этот email уже зарегистрирован';

	/// ru: 'Неизвестная ошибка'
	String get unknown => 'Неизвестная ошибка';
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

// Path: feed.soonInMalina
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
		'',
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
			'action.signIn' => 'войти',
			'action.signUp' => 'зарегистрироваться',
			'action.clear' => 'очистить',
			'action.add' => 'добавить',
			'action.save' => 'сохранить',
			'action.delete' => 'удалить',
			'action.signOut' => 'выйти',
			'action.scan' => 'сканировать',
			'validatorErrors.incorrectEmail' => 'Некорректно введен Email',
			'validatorErrors.emptyField' => 'Поле не должно быть пустым',
			'validatorErrors.minLengthPassword' => ({required int count}) => 'Пароль должен содержать минимум ${count} символов',
			'validatorErrors.passwordsNotMatch' => 'Пароли не совпадают',
			'auth.mail' => 'почта',
			'auth.password' => 'пароль',
			'auth.repeatPassword' => 'Повторите пароль',
			'auth.errors.userNotFound' => 'Пользователь не найден',
			'auth.errors.invalidEmailOrPassword' => 'Email или пароль неверны',
			'auth.errors.tooManyAttempts' => 'Слишком много попыток входа',
			'auth.errors.emailAlreadyExists' => 'Этот email уже зарегистрирован',
			'auth.errors.unknown' => 'Неизвестная ошибка',
			'bottomNavBarContent.feed' => 'лента',
			'bottomNavBarContent.favorites' => 'избранное',
			'bottomNavBarContent.profile' => 'профиль',
			'bottomNavBarContent.cart' => 'корзина',
			'feed.search' => 'Искать в Malina',
			'feed.scanQr' => 'Сканируй QR-код и заказывай прямо в заведении',
			'feed.food.name' => 'еда',
			'feed.food.title' => 'Из кафе и ресторанов',
			'feed.beauty.name' => 'бьюти',
			'feed.beauty.title' => 'Салоны красоты и товары',
			'feed.soonInMalina.name' => 'Скоро в Malina',
			'feed.soonInMalina.titles.0' => 'вакансии',
			'feed.soonInMalina.titles.1' => 'маркет',
			'feed.soonInMalina.titles.2' => 'цветы',
			'feed.soonInMalina.titles.3' => 'спорт',
			'feed.soonInMalina.titles.4' => 'маркет',
			'feed.soonInMalina.titles.5' => '',
			'placeTheQr' => 'Поместите QR-код в рамку',
			'cart.name' => 'корзина',
			'cart.noProductsByThisCategory' => ({required String categoty}) => 'Нет товаров в корзине из категории ${categoty}',
			'cart.additivies' => 'добавки',
			'cart.total' => 'всего',
			'profile' => 'профиль',
			_ => null,
		};
	}
}
