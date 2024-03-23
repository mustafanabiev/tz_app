class ApiConst {
  static String api(
    String departureCity,
    String destinationCity,
    String date,
  ) {
    return 'https://bibiptrip.com/api/avibus/search_trips_cities/?departure_city=$departureCity&destination_city=$destinationCity&date=$date';
  }
}
