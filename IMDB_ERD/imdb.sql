CREATE DATABASE imdb;
USE imdb;

-- Table for Movie
CREATE TABLE Movie (
  MovieID INT PRIMARY KEY,
  MovieTitle VARCHAR(255),
  ReleaseYear INT,
  Genre VARCHAR(255),
  Director VARCHAR(255),
  Duration INT
);

-- Table for Actors
CREATE TABLE Actors (
  ActorID INT PRIMARY KEY,
  ActorName VARCHAR(255),
  BirthDate DATE,
  Gender VARCHAR(255)
);

-- Table for TVSeries
CREATE TABLE TVSeries (
  SeriesID INT PRIMARY KEY,
  SeriesTitle VARCHAR(255),
  ReleaseYear INT,
  Genre VARCHAR(255),
  Director VARCHAR(255),
  NumberOfEpisodes INT
);

-- Table for MovieActor
CREATE TABLE MovieActor (
  MovieID INT,
  ActorID INT,
  FOREIGN KEY (MovieID) REFERENCES Movie(MovieID),
  FOREIGN KEY (ActorID) REFERENCES Actors(ActorID),
  PRIMARY KEY (MovieID, ActorID)
);

-- Table for TVSeriesActor
CREATE TABLE TVSeriesActor (
  SeriesID INT,
  ActorID INT,
  FOREIGN KEY (SeriesID) REFERENCES TVSeries(SeriesID),
  FOREIGN KEY (ActorID) REFERENCES Actors(ActorID),
  PRIMARY KEY (SeriesID, ActorID)
);
