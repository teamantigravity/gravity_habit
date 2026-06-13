import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

final iapServiceProvider = Provider<IapService>((ref) => IapService());

class IapService {
  final _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _subscription;

  static const _kLifetimeId = 'gravity_habit_lifetime';
  static const _kYearlyId = 'gravity_habit_yearly';
  static const _kMonthlyId = 'gravity_habit_monthly';

  static const _productIds = {_kLifetimeId, _kYearlyId, _kMonthlyId};

  List<ProductDetails> products = [];
  bool _isAvailable = false;

  Future<void> initialize() async {
    _isAvailable = await _iap.isAvailable();
    if (!_isAvailable) return;

    _subscription = _iap.purchaseStream.listen(
      _handlePurchaseUpdates,
      onError: (error) {
        // Silent error handling — never blocks UI
      },
    );

    final response = await _iap.queryProductDetails(_productIds);
    products = response.productDetails;
  }

  Future<bool> purchase(String productId) async {
    if (!_isAvailable) return false;

    final product = products.firstWhere(
      (p) => p.id == productId,
      orElse: () => throw StateError('Product not found: $productId'),
    );

    final purchaseParam = PurchaseParam(productDetails: product);

    if (productId == _kLifetimeId) {
      return _iap.buyNonConsumable(purchaseParam: purchaseParam);
    } else {
      return _iap.buyNonConsumable(purchaseParam: purchaseParam);
    }
  }

  Future<void> restore() async {
    if (!_isAvailable) return;
    await _iap.restorePurchases();
  }

  void _handlePurchaseUpdates(List<PurchaseDetails> purchases) {
    for (final purchase in purchases) {
      if (purchase.status == PurchaseStatus.purchased ||
          purchase.status == PurchaseStatus.restored) {
        // Verify locally and unlock
        _verifyAndDeliver(purchase);
      }

      if (purchase.pendingCompletePurchase) {
        _iap.completePurchase(purchase);
      }
    }
  }

  Future<void> _verifyAndDeliver(PurchaseDetails purchase) async {
    // Local receipt validation
    // In production: verify receipt format, check product ID
    // No server calls — fully on-device
    if (_productIds.contains(purchase.productID)) {
      // Mark ads as removed via settings
      _onPurchaseVerified?.call();
    }
  }

  VoidCallback? _onPurchaseVerified;

  void setOnPurchaseVerified(VoidCallback callback) {
    _onPurchaseVerified = callback;
  }

  void dispose() {
    _subscription?.cancel();
  }
}

typedef VoidCallback = void Function();
