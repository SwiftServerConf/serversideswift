const tokenID = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFVWEw4U1Y1NEwifQ.eyJpc3MiOiJZV0xXMjNMVDZHIiwiaWF0IjoxNjY3NDk4NTk3LCJleHAiOjE2OTA1MDI0MDAsIm9yaWdpbiI6Imh0dHBzOi8vd3d3LnNlcnZlcnNpZGVzd2lmdC5pbmZvIn0.olr8M2ETZy32678efdVX_TWO2oeOuL5iNfAm-vrOZKxqM0FOvhTkKUo49L69yz8HBwyCx6uP8ewPItHHyFz0mA";
//const tokenID = "eyJhbGciOiJFUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IlFVWEw4U1Y1NEwifQ.eyJpc3MiOiJZV0xXMjNMVDZHIiwiaWF0IjoxNjY3NDk4NTY4LCJleHAiOjE2NzAwOTA0NjgsIm9yaWdpbiI6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCJ9.meywtmBWjEXMUTb0ryMZ29wRPH-UgEGrBuDRnnCtdw8pnfn4fyHZKuGk7P_7FVJ5RwLYds_6PJcFRpr-cXhZSQ";

mapkit.init({
authorizationCallback: function(done) {
    done(tokenID);
}
});
mapkit.addEventListener("error", function(event) {
    console.log("Error recieved")
    console.log(event)
});

// Venue
let VenueMarkerAnnotation = mapkit.MarkerAnnotation;

let venuePoint = new mapkit.Coordinate(51.49575896175155, -0.17360963103372198);

let Venue = new mapkit.CoordinateRegion(venuePoint, new mapkit.CoordinateSpan(0.277647972, 0.464985255));
let venueAnnotation = new VenueMarkerAnnotation(venuePoint);
venueAnnotation.title = 'ServerSide.swift Venue';
venueAnnotation.subtitle = 'Conference Venue';

let venueMap = new mapkit.Map("venue-map");
venueMap.region = Venue;
venueMap.showItems([venueAnnotation]);
venueMap.showsZoomControl = true;

// Transportation
let TransportationMarkerAnnotation = mapkit.MarkerAnnotation;

let Transportation = new mapkit.CoordinateRegion(venuePoint, new mapkit.CoordinateSpan(0.187647972, 0.374985255));

let southKenStationPoint = new mapkit.Coordinate(51.49434691346064, -0.1742178226784634);
let southKenAnnotation = new TransportationMarkerAnnotation(southKenStationPoint);
southKenAnnotation.title = 'South Kensington';
southKenAnnotation.subtitle = 'Tube station';

let gloucesterRoadStationPoint = new mapkit.Coordinate(51.494496797732445, -0.18261848170684467);
let gloucesterRoadAnnotation = new TransportationMarkerAnnotation(gloucesterRoadStationPoint);
gloucesterRoadAnnotation.title = 'Gloucester Road';
gloucesterRoadAnnotation.subtitle = 'Tube station';

let transportVenueAnnotation = new VenueMarkerAnnotation(venuePoint);
transportVenueAnnotation.title = 'ServerSide.swift Venue';
transportVenueAnnotation.subtitle = 'Conference Venue';

let transportationMap = new mapkit.Map("transportation-map");
transportationMap.region = Transportation;
transportationMap.showItems([gloucesterRoadAnnotation, southKenAnnotation, transportVenueAnnotation]);
transportationMap.showsZoomControl = true;

// Accommodation
let AccommodationMarkerAnnotation = mapkit.MarkerAnnotation;

let bestWesternPoint = new mapkit.Coordinate(51.512133498512476, -0.17830085911161278);
let bestWesternAnnotation = new AccommodationMarkerAnnotation(bestWesternPoint)
bestWesternAnnotation.title = 'Best Western Mornington';

let milleniumHotelPoint = new mapkit.Coordinate(51.50028126349976, -0.16003996548970148);
let milleniumHotelAnnotation = new AccommodationMarkerAnnotation(milleniumHotelPoint)
milleniumHotelAnnotation.title = 'Millenium Hotel Knightsbridge';

let dorsettHotelPoint = new mapkit.Coordinate(51.50425034884549, -0.22468533027564097);
let dorsettHotelAnnotation = new AccommodationMarkerAnnotation(dorsettHotelPoint)
dorsettHotelAnnotation.title = 'Dorsett Hotel Shepherds Bush';

let novotellHotelPoint = new mapkit.Coordinate(51.492152500256026, -0.21995504376725108);
let novotellHotelAnnotation = new AccommodationMarkerAnnotation(novotellHotelPoint)
novotellHotelAnnotation.title = 'Novotell London West';

let accommodationVenueAnnotation = new VenueMarkerAnnotation(venuePoint);
accommodationVenueAnnotation.title = 'ServerSide.swift Venue';
accommodationVenueAnnotation.subtitle = 'Conference Venue';


let accommodationMap = new mapkit.Map("accommodation-map");
let Accommodation = new mapkit.CoordinateRegion(venuePoint, new mapkit.CoordinateSpan(0.167647972, 0.354985255));
accommodationMap.region = Accommodation;
accommodationMap.showItems([accommodationVenueAnnotation, bestWesternAnnotation, milleniumHotelAnnotation, novotellHotelAnnotation, dorsettHotelAnnotation]);
accommodationMap.showsZoomControl = true;
