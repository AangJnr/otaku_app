enum Flavor { dev, prod }

class Url {
  static bool get isDebug {
    return _flavor == Flavor.dev;
  }

  Url._();

  static Url get shared {
    return Url._();
  }

  static const Flavor _flavor = Flavor.dev;

  static String _url() {
    return _flavor == Flavor.dev
        ? "http://127.0.0.1:5001/otaku-katarougu/us-central1/api/api"
        : "https://api-6mi623vb5q-uc.a.run.app/api";
  }

  get base => _url();
  get productImagesBaseUrl => '$base/product_images/';
  get blogImagesBaseUrl => '$base/blog_images/';
  get adsBaseUrl => '$base';

  get webAddress => 'https://o-otaku.com/';
}
