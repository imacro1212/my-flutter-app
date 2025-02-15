import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Auth1
  {
    '9si1927i': {
      'en': 'brand.ai',
      'ar': 'أهلاً وسهلاً بك في تطبيق كلين كار',
    },
    'jxn6bf2c': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    'prek50sr': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'الرجاء تعبئة البيانات أدناه',
    },
    'vbzczs79': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'yrlvdsk7': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    '6tyv1moa': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
    },
    '28fauhdm': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
    },
    'zex3hg3w': {
      'en': 'Sign Up',
      'ar': 'اشتراك',
    },
    'nyl8816u': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'الرجاء تعبئة البيانات أدناه',
    },
    '9iu31aje': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
    },
    'em3a3hti': {
      'en': 'Password',
      'ar': 'كلمة المرور',
    },
    'yyl8dbl0': {
      'en': 'Confirm Password',
      'ar': 'تأكيد كلمة المرور',
    },
    'fw7lqc5u': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
    },
    'z5rvvuaa': {
      'en': 'Home',
      'ar': 'بيت',
    },
  },
  // HomePage
  {
    'o8dms6nn': {
      'en': 'Car Wash Services',
      'ar': 'خدمات غسيل السيارات',
    },
    'qcjbriru': {
      'en': 'Select Your Service',
      'ar': 'اختر الخدمات المطلوبة',
    },
    'puac03pa': {
      'en': 'Basic Wash',
      'ar': 'غسيل خارجي',
    },
    'z1hsydxk': {
      'en': '\$15',
      'ar': '15 ريال',
    },
    'oz87rnxl': {
      'en': 'Deluxe Wash',
      'ar': 'غسيل داخلي',
    },
    'bd7j73cf': {
      'en': '\$10',
      'ar': '10 ريال',
    },
    '8m3xynuo': {
      'en': 'Premium Detail',
      'ar': 'تلميع كفرات',
    },
    'dviyrjb9': {
      'en': '\$3',
      'ar': '3 ريال',
    },
    '1ku8bo6s': {
      'en': 'Premium Detail',
      'ar': 'تنظيف كفرات وجنوط',
    },
    'bydglvq1': {
      'en': '\$5',
      'ar': '5 ريال',
    },
    '694epcx3': {
      'en': 'Premium Detail',
      'ar': 'غسيل بستم',
    },
    'ewzxdx06': {
      'en': '\$10',
      'ar': '10 ريال',
    },
    'qwjcp26q': {
      'en': 'Continue to Booking',
      'ar': 'المتابعة للدفع',
    },
  },
  // pay
  {
    '4pvhx8cw': {
      'en': 'Payment Details',
      'ar': 'تفاصيل الدفع',
    },
    'sl2x0m0q': {
      'en': 'Enter Card Information',
      'ar': 'أدخل معلومات البطاقة',
    },
    'xm0gzsux': {
      'en': 'Card Number',
      'ar': 'رقم البطاقة',
    },
    'mmx39sy8': {
      'en': 'Expiry Date',
      'ar': 'تاريخ انتهاء الصلاحية',
    },
    'x8jtd5xb': {
      'en': 'CVV',
      'ar': 'قيمة رمز التحقق',
    },
    'dnhy0dat': {
      'en': 'Cardholder Name',
      'ar': 'اسم حامل البطاقة',
    },
    'ms4ycmu7': {
      'en': 'Order Summary',
      'ar': 'ملخص الطلب',
    },
    'xkwbnlq2': {
      'en': 'Deluxe Wash',
      'ar': 'غسيل خارجي',
    },
    'rf7oy1tt': {
      'en': '\$45.00',
      'ar': '15.00 ريال',
    },
    'iaizt8he': {
      'en': 'Deluxe Wash',
      'ar': 'غسيل داخلي',
    },
    'l01ot4fz': {
      'en': '\$45.00',
      'ar': '10.00 ريال',
    },
    'nprqnzbz': {
      'en': 'Tax',
      'ar': 'ضريبة',
    },
    'n8kxo3m1': {
      'en': '\$4.50',
      'ar': '3.75 ريال',
    },
    'sjjev700': {
      'en': 'Total',
      'ar': 'المجموع',
    },
    'gynu775a': {
      'en': '\$49.50',
      'ar': '28.75 ريال',
    },
    'veq403vu': {
      'en': 'Pay Now',
      'ar': 'ادفع الآن',
    },
    'pbygzugu': {
      'en': 'Pay Now',
      'ar': 'تسجيل الخروج',
    },
  },
  // Miscellaneous
  {
    'bqcmwhog': {
      'en': '',
      'ar': '',
    },
    'hii2et5l': {
      'en': '',
      'ar': '',
    },
    'bbphqe4h': {
      'en': '',
      'ar': '',
    },
    'dsian7u1': {
      'en': '',
      'ar': '',
    },
    '271jgub5': {
      'en': '',
      'ar': '',
    },
    'pp83b79c': {
      'en': '',
      'ar': '',
    },
    'nc789683': {
      'en': '',
      'ar': '',
    },
    '80kt4tmr': {
      'en': '',
      'ar': '',
    },
    '8q62okir': {
      'en': '',
      'ar': '',
    },
    '1qtlfsq2': {
      'en': '',
      'ar': '',
    },
    'ms50d54z': {
      'en': '',
      'ar': '',
    },
    'ox2qrvpb': {
      'en': '',
      'ar': '',
    },
    'xoxzr0z5': {
      'en': '',
      'ar': '',
    },
    'lkd33ni4': {
      'en': '',
      'ar': '',
    },
    '0w43efnm': {
      'en': '',
      'ar': '',
    },
    'g2ka4l5j': {
      'en': '',
      'ar': '',
    },
    'hnae14yk': {
      'en': '',
      'ar': '',
    },
    'xooxvqq9': {
      'en': '',
      'ar': '',
    },
    '8az7nidf': {
      'en': '',
      'ar': '',
    },
    '8se7amyw': {
      'en': '',
      'ar': '',
    },
    'lawvj7zg': {
      'en': '',
      'ar': '',
    },
    'rgdiyghx': {
      'en': '',
      'ar': '',
    },
    'gcuwp7re': {
      'en': '',
      'ar': '',
    },
    'xcy64lup': {
      'en': '',
      'ar': '',
    },
    'yuu53tgk': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
