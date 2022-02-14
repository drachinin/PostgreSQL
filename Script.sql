create table if not exists Artist (
	ArtistID serial primary key,
	ArtistName varchar(40) not null unique
);

create table if not exists Albums (
	AlbumID serial primary key,
	AlbumName varchar(40) not null unique,
	ReleaseDate integer not null,
);

create table if not exists AlbumArtists (
	AlbumID integer references Albums(AlbumID),
	TrackID integer references Tracks(TrackID)
);

create table if not exists Tracks (
	TrackID serial primary key,
	TrackName varchar(40) not null,
	Duration numeric(4, 2) not null,
	AlbumID integer references Albums(AlbumID)
);

create table if not exists Genre (
	GenreName varchar(40) not null,
	GenreID serial primary key
);

create table if not exists ArtistGenre (
	ArtistID integer references Artist(ArtistID),
	GenreID integer references Genre(GenreID)
);

create table if not exists Compilation (
	ComplilationID serial primary key,
	CompilationName varchar(40) not null,
	ReleaseDate integer not null
);

create table if not exists TracksComplilation (
	TrackID integer references Tracks(TrackID),
	ComplilationID integer references Compilation(ComplilationID)
);

