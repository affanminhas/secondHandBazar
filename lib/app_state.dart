import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _Cart = (await secureStorage.getStringList('ff_Cart'))
              ?.map((path) => path.ref)
              .toList() ??
          _Cart;
    });
    await _safeInitAsync(() async {
      _wishlish = (await secureStorage.getStringList('ff_wishlish'))
              ?.map((path) => path.ref)
              .toList() ??
          _wishlish;
    });
    await _safeInitAsync(() async {
      _isLiked = await secureStorage.getBool('ff_isLiked') ?? _isLiked;
    });
    await _safeInitAsync(() async {
      _ItemCount = await secureStorage.getInt('ff_ItemCount') ?? _ItemCount;
    });
    await _safeInitAsync(() async {
      _isSellerLocal =
          await secureStorage.getBool('ff_isSellerLocal') ?? _isSellerLocal;
    });
    await _safeInitAsync(() async {
      _isDialogShown =
          await secureStorage.getString('ff_isDialogShown') ?? _isDialogShown;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<DocumentReference> _Cart = [];
  List<DocumentReference> get Cart => _Cart;
  set Cart(List<DocumentReference> value) {
    _Cart = value;
    secureStorage.setStringList('ff_Cart', value.map((x) => x.path).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_Cart');
  }

  void addToCart(DocumentReference value) {
    Cart.add(value);
    secureStorage.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference value) {
    Cart.remove(value);
    secureStorage.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int index) {
    Cart.removeAt(index);
    secureStorage.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    Cart[index] = updateFn(_Cart[index]);
    secureStorage.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  void insertAtIndexInCart(int index, DocumentReference value) {
    Cart.insert(index, value);
    secureStorage.setStringList('ff_Cart', _Cart.map((x) => x.path).toList());
  }

  List<double> _CartPriceSummary = [];
  List<double> get CartPriceSummary => _CartPriceSummary;
  set CartPriceSummary(List<double> value) {
    _CartPriceSummary = value;
  }

  void addToCartPriceSummary(double value) {
    CartPriceSummary.add(value);
  }

  void removeFromCartPriceSummary(double value) {
    CartPriceSummary.remove(value);
  }

  void removeAtIndexFromCartPriceSummary(int index) {
    CartPriceSummary.removeAt(index);
  }

  void updateCartPriceSummaryAtIndex(
    int index,
    double Function(double) updateFn,
  ) {
    CartPriceSummary[index] = updateFn(_CartPriceSummary[index]);
  }

  void insertAtIndexInCartPriceSummary(int index, double value) {
    CartPriceSummary.insert(index, value);
  }

  String _userType = '';
  String get userType => _userType;
  set userType(String value) {
    _userType = value;
  }

  List<DocumentReference> _wishlish = [];
  List<DocumentReference> get wishlish => _wishlish;
  set wishlish(List<DocumentReference> value) {
    _wishlish = value;
    secureStorage.setStringList(
        'ff_wishlish', value.map((x) => x.path).toList());
  }

  void deleteWishlish() {
    secureStorage.delete(key: 'ff_wishlish');
  }

  void addToWishlish(DocumentReference value) {
    wishlish.add(value);
    secureStorage.setStringList(
        'ff_wishlish', _wishlish.map((x) => x.path).toList());
  }

  void removeFromWishlish(DocumentReference value) {
    wishlish.remove(value);
    secureStorage.setStringList(
        'ff_wishlish', _wishlish.map((x) => x.path).toList());
  }

  void removeAtIndexFromWishlish(int index) {
    wishlish.removeAt(index);
    secureStorage.setStringList(
        'ff_wishlish', _wishlish.map((x) => x.path).toList());
  }

  void updateWishlishAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    wishlish[index] = updateFn(_wishlish[index]);
    secureStorage.setStringList(
        'ff_wishlish', _wishlish.map((x) => x.path).toList());
  }

  void insertAtIndexInWishlish(int index, DocumentReference value) {
    wishlish.insert(index, value);
    secureStorage.setStringList(
        'ff_wishlish', _wishlish.map((x) => x.path).toList());
  }

  bool _isLiked = false;
  bool get isLiked => _isLiked;
  set isLiked(bool value) {
    _isLiked = value;
    secureStorage.setBool('ff_isLiked', value);
  }

  void deleteIsLiked() {
    secureStorage.delete(key: 'ff_isLiked');
  }

  int _ItemCount = 0;
  int get ItemCount => _ItemCount;
  set ItemCount(int value) {
    _ItemCount = value;
    secureStorage.setInt('ff_ItemCount', value);
  }

  void deleteItemCount() {
    secureStorage.delete(key: 'ff_ItemCount');
  }

  bool _isSellerLocal = false;
  bool get isSellerLocal => _isSellerLocal;
  set isSellerLocal(bool value) {
    _isSellerLocal = value;
    secureStorage.setBool('ff_isSellerLocal', value);
  }

  void deleteIsSellerLocal() {
    secureStorage.delete(key: 'ff_isSellerLocal');
  }

  int _navbarSelection = 2;
  int get navbarSelection => _navbarSelection;
  set navbarSelection(int value) {
    _navbarSelection = value;
  }

  String _loginNumber = '';
  String get loginNumber => _loginNumber;
  set loginNumber(String value) {
    _loginNumber = value;
  }

  String _isDialogShown = 'None';
  String get isDialogShown => _isDialogShown;
  set isDialogShown(String value) {
    _isDialogShown = value;
    secureStorage.setString('ff_isDialogShown', value);
  }

  void deleteIsDialogShown() {
    secureStorage.delete(key: 'ff_isDialogShown');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
