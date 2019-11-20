

import 'package:book/bookui/models/book_activity.dart';

class Book {
  String imageUrl;
  String name;
  String country;
  String description;
  List<Activity> activities;

  Book({
    this.imageUrl,
    this.name,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Book> books = [
  Book(
    imageUrl: 'assets/images/book1.jpg',
    name: 'Book1',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Book(
    imageUrl: 'assets/images/paris.jpg',
    name: 'Book2',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Book(
    imageUrl: 'assets/images/newdelhi.jpg',
    name: 'New Delhi',
    country: 'Book3',
    description: 'Visit New Delhi for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Book(
    imageUrl: 'assets/images/saopaulo.jpg',
    name: 'Book3',
    country: 'Brazil',
    description: 'Visit Sao Paulo for an amazing and unforgettable adventure.',
    activities: activities,
  ),
  Book(
    imageUrl: 'assets/images/newyork.jpg',
    name: 'Book4',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgettable adventure.',
    activities: activities,
  ),
];
