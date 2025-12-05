# Test_may25  
Мобильное приложение на Flutter (3.38.3, FVM), реализующее функционал:
- Авторизации и регистрации пользователей  
- Локального хранения данных через SharedPreferences  
- Каталога продуктов  
- Корзины  
- Добавления товаров вручную и по QR-коду  
- Навигации через go_router с BottomNavigationBar и ShellRoute  
- Управления состоянием через flutter_bloc  
- Clean Architecture (Data → Domain → Presentation)

---

## 🚀 Технологии и стек
- **Flutter 3.38.3** (через FVM)
- **Dart 3**
- **go_router 14**
- **flutter_bloc**
- **freezed**
- **SharedPreferences**
- **get_it**
- **Clean Architecture**
- **JSON-хранилище пользователей и продуктов**

---

# 📁 Архитектура проекта

Проект построен по Clean Architecture:

<img src = "readme_images\structure.png" width="340">

## 📁 lib/app

Это верхний уровень конфигурации приложения.

### app/di/di.dart

Файл со всем Dependency Injection через get_it.
Здесь регистрируются:

- LocalDataSources
- Repositories
- Cubits
- SharedPreferences
- сервисы

### app/router/app_router.dart
- Конфигурация маршрутизации через go_router:
- ShellRoute для BottomNavigationBar
- маршруты приложения
- редиректы (auth guard)
- именованные маршруты

## 📁 lib/core

- Основные утилиты, которые используются во всем проекте.
Этот слой не зависит от фич проекта.

### core/common/constants/app_constants.dart
- Глобальные неизменяемые значения:
категории продуктов, ключи SharedPreferences, цвета, имена коллекций и т. д.

### core/common/locale/ru.json
- Файл локализации для русского языка (используется slang).
```json 
{
  "common" : {
    "all" : "всего",
    "category": "категория",
    "subcategory": "подкатегория",
    "name": "название",
    "price": "цена",
    "description": "описание"
  },
  "action": {
    "signIn" : "войти",
    ...
```

### core/common/theme/app_colors.dart
- Цветовая палитра приложения (Color(0xff...)).
```dart
abstract class AppColors {
  static const black = Color(0xff000000);
  static const almostBlack = Color(0xff1D1D1D);
  static const charcoal = Color(0xff292D32);
  static const greyDark = Color(0xff353535);
  static const greyMediumDark = Color(0xff49454F);
  static const greyDim = Color(0xff5F5F5F);
  static const grey = Color(0xff777777);
  ...
```

### app_font_sizes.dart
- Константы размеров шрифтов.
```dart
abstract class AppFontSizes {
  static final sp10 = 10.sp;
  static final sp12 = 12.sp;
  static final sp14 = 14.sp;
  static final sp16 = 16.sp;
  static final sp17 = 17.sp;
  static final sp18 = 18.sp;
  static final sp20 = 20.sp;
  static final sp22 = 22.sp;
}
```

### app_styles.dart

- Глобальные текстовые стили (TextStyle…).

```dart
abstract class AppStyles {
  static TextStyle robotoW600Black(double fontSize) {
    return TextStyle(
      fontFamily: FontFamily.roboto,
      height: 1,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: AppColors.black,
    );
  }

  static TextStyle robotoW500White(double fontSize) {
    return TextStyle(
      fontFamily: FontFamily.roboto,
      height: 1,
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    );
  }
```

### theme.dart

- Общий ThemeData приложения — цвета, шрифты, стили кнопок.

```dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_flutter_project/gen/fonts.gen.dart';

part 'app_colors.dart';
part 'app_font_sizes.dart';
part 'app_styles.dart';
```
## widgets/

- Маленькие переиспользуемые UI-компоненты (кнопки, контейнеры, карточки и т. д).

### core/ext/string_ext.dart
- Extension-методы для String (валидации, преобразования и т.д.).

### core/services/id_generator.dart

- Сервис, генерирующий автоинкрементные ID через SharedPreferences:
```
auto_id_products → 1,2,3…
auto_id_users
auto_id_cart
```

## core/utils/validators/
Содержит валидаторы для форм:
- `email_validator.dart`
- `empty_field_validator.dart`
- `password_validator.dart`

Они используются в UI перед вызовом методов Cubit.

# 📁 lib/features

Каждая фича — изолированный модуль со своими data/domain/presentation слоями.

## features/auth/

- Авторизация и регистрация.

Папки:
- `data/` — UserLocalDataSource, модели
- `domain/` — UserEntity, AuthRepository
- `presentation/` — AuthCubit, LoginScreen, RegisterScreen

<img src="readme_images\login.png" width=200>
<img src="readme_images\register.png" width=200>

Пример валидации данных: <br>
<img src="readme_images\register_valid.png" width=200>

## features/bottom_nav_bar/

- Виджеты и логика BottomNavigationBar, который работает через ShellRoute.<br>

<img src="readme_images\bottom_nav_bar.png" width=300>

## features/cart/
Работа с корзиной.
Включает:
- репозиторий CartRepositoryImpl
- CartCubit + CartState
- экраны корзины
- вспомогательные виджеты (товар в корзине и т.п.)

<img src="readme_images\cart_food.png" width=200>
<img src="readme_images\cart_beauty.png" width=200>

## features/feed/
Экран "Главная лента" (пример контента).<br>
<img src="readme_images\feed.png" width=200>

## features/product/

Хранение и управление товарами.
Включает:

- ProductLocalDataSource
- ProductRepository
- ProductEntity/ProductModel (freezed)

## features/profile/
Экран профиля: данные пользователя, кнопка выхода, отображение email и др.
<img src="readme_images\profile.png" width=200>


## features/qr_scan/

Сканирование QR кода.
Содержит:
- ValidateQrCodeUseCase — проверяет формат
- ProductFromQrFactory — создает симулированный продукт
- UI экрана сканирования + предпросмотр карточки
- возвращает ProductEntity в CartCubit через pop(result)
<img src="readme_images\qr_scan.png" width=200>
<img src="readme_images\qr_scan_cart_example.png" width=200>

## features/shared/

Повторно используемые сущности и модели, доступные разным модулям.
Например, CartItemModel, CartItemEntity, общие утилиты.

# 📁 lib/gen

Автоматически сгенерированные файлы:

- `assets.gen.dart` — доступ к изображениям через flutter_gen

- `fonts.gen.dart` — автокарта шрифтов
- строки локализации `strings.g.dart`, `strings_ru.g.dart`

Использовать вручную их не нужно — только импортировать.

# 📁 lib/main.dart

Точка входа приложения:
- инициализация зависимостей (initDependencies())
- получение AuthCubit и проверка статуса авторизации
- запуск MaterialApp.router
- подключение темы и локализации