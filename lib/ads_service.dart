import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdManager {
  static String get bannerAdUnitId => Platform.isAndroid
      ? 'ca-app-pub-2110083855002093/2592558144'
      : 'ca-app-pub-2110083855002093/2592558144';

  static initialize() {
    // ignore: unnecessary_null_comparison
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  static BannerAd createBannerAd() {
    BannerAd ad = BannerAd(
        size: AdSize.largeBanner,
        adUnitId: bannerAdUnitId,
        listener: BannerAdListener(
            onAdLoaded: (Ad ad) => print("On AD loaded"),
            onAdFailedToLoad: (Ad ad, LoadAdError error) {
              ad.dispose();
            },
            onAdOpened: (Ad ad) => print("Ad opened"),
            onAdClosed: (Ad ad) => print("Ad Clossed")),
        request: AdRequest());
    return ad;
  }
}
