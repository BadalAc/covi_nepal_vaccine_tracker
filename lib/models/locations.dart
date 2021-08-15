class Locations {
  String locationName;
  String districtName;
  String city;
  String cityNepali;
  Locations({this.locationName, this.districtName, this.city, this.cityNepali});
}

class Locationcollection {
  List<Locations> locationCollectin = [
    Locations(
        locationName: 'लेकसाइड ओडा कार्यलय ',
        districtName: 'कास्की ',
        cityNepali: 'पोखरा',
        city: 'Pokhara'),
    Locations(
        locationName: 'बिरौटा ट्याक्सी चोक ',
        districtName: 'कास्की ',
        cityNepali: 'पोखरा',
        city: 'Pokhara'),
    Locations(
        locationName: 'ड्यमसाइड चौकी ',
        districtName: 'कास्की ',
        cityNepali: 'पोखरा',
        city: 'Pokhara'),
    Locations(
        locationName: 'मालेपाटन मैदान ',
        districtName: 'कास्की ',
        cityNepali: 'पोखरा',
        city: 'Pokhara'),
    Locations(
        locationName: 'बसुन्धरा ग्रिनसिटी अस्पताल ',
        districtName: 'काठमाडौं  ',
        cityNepali: 'काठमाडौं ',
        city: 'Kathmandu'),
    Locations(
        locationName: 'बीर अस्पताल ',
        districtName: 'काठमाडौं  ',
        cityNepali: 'काठमाडौं ',
        city: 'Kathmandu'),
    Locations(
        locationName: 'ग्राण्डी सिटी हस्पिटल  ',
        districtName: 'काठमाडौं  ',
        cityNepali: 'काठमाडौं ',
        city: 'Kathmandu'),
    Locations(
        locationName: 'नर्भिक इन्टरनेसनल हस्पिटल ',
        districtName: 'काठमाडौं  ',
        cityNepali: 'काठमाडौं ',
        city: 'Kathmandu'),
  ];
}
