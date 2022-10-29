mapkit.init({
authorizationCallback: function(done) {
    done('eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Im1hcHMuaW5mby5zZXJ2ZXJzaWRlc3dpZnQifQ.eyJpc3MiOiJZV0xXMjNMVDZHIiwiaWF0IjoxNjY3MDU1MzAxLCJleHAiOjE2OTgzNjQ4MDAsIm9yaWdpbiI6Imh0dHBzOi8vd3d3LnNlcnZlcnNpZGVzd2lmdC5pbmZvIn0.BfMAjyrdsCsokc1A72j8YUH8ahav70aSlDWHxK9cXpi9qImbHkZj0L_aIwXLgabGbpfxoNWkQqxvT7asDhmPgw');
}
});

// Venue
let VenueMarkerAnnotation = mapkit.MarkerAnnotation;

let Venue = new mapkit.CoordinateRegion(
                                        new mapkit.Coordinate(51.49574, 0.17352),
                                        new mapkit.CoordinateSpan(0.167647972, 0.354985255)
                                        );

let venuePoint = new mapkit.Coordinate(51.49574, 0.17352);
let venueAnnotation = new VenueMarkerAnnotation(venuePoint);
venueAnnotation.title = 'ServerSide.swift Venue';
venueAnnotation.subtitle = 'Conference Venue';

let venueMap = new mapkit.Map("venue-map");
venueMap.region = Venue;
venueMap.showItems([venueAnnotation]);
venueMap.showsZoomControl = true;

// Transportation
let TransportationMarkerAnnotation = mapkit.MarkerAnnotation;

let Transportation = new mapkit.CoordinateRegion(
                                                 new mapkit.Coordinate(55.6808894, 12.5852531),
                                                 new mapkit.CoordinateSpan(0.167647972, 0.354985255)
                                                 );

let transportPoint = new mapkit.Coordinate(55.6808894, 12.5852531);
let transportAnnotation = new TransportationMarkerAnnotation(transportPoint);
transportAnnotation.title = 'Kongens Nytorv st.';
transportAnnotation.subtitle = 'Metro station';


let transportationMap = new mapkit.Map("transportation-map");
transportationMap.region = Transportation;
transportationMap.showItems([transportAnnotation]);
transportationMap.showsZoomControl = true;

// Accommodation
let AccommodationMarkerAnnotation = mapkit.MarkerAnnotation;

let accommodationPoint = new mapkit.Coordinate(55.668959, 12.572118);
let accommodationAnnotation = new AccommodationMarkerAnnotation(accommodationPoint);
accommodationAnnotation.title = 'Wakeup Copenhagen';
accommodationAnnotation.subtitle = 'Bernstorffsgade 35';

let accommodationMap = new mapkit.Map("accommodation-map");
let Accommodation = new mapkit.CoordinateRegion(
                                                accommodationPoint,
                                                new mapkit.CoordinateSpan(0.167647972, 0.354985255)
                                                );
accommodationMap.region = Accommodation;
accommodationMap.showItems([accommodationAnnotation]);
accommodationMap.showsZoomControl = true;
