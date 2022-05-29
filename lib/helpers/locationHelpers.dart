const MAPBOX_APT_KEY =
    'pk.eyJ1Ijoic2lraWVuYm10IiwiYSI6ImNsM3IxM2drMTBjZGUzbG5rYnU4dzg2OW4ifQ.uOiA1g5IjWKuWJWU-_iESw';

class LocationHelper {
  static String generatePreviewImageUrl({required double latitude,required double longitude}) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$MAPBOX_APT_KEY';
  }
}
