DROP TABLE IF EXISTS Toys;
DROP TABLE IF EXISTS cattoys;
DROP TABLE IF EXISTS Cats;

CREATE TABLE Cats (
  ID SERIAL PRIMARY KEY,
  Name VARCHAR(255),
  Color VARCHAR(255),
  Breed VARCHAR(255)
);

CREATE TABLE Toys (
  ID SERIAL PRIMARY KEY,
  Price INT,
  Color VARCHAR(255),
  Name VARCHAR(255)
);

CREATE TABLE cattoys (
  ID SERIAL PRIMARY KEY, 
  CatID INT NOT NULL,
  ToyID INT,
  FOREIGN KEY (CatID) REFERENCES Cats(id),
  FOREIGN KEY (ToyID) REFERENCES Toys(id)
);

INSERT INTO Cats (
  Name,
  Color, 
  Breed
)
VALUES (
  'Swaggy',
  'Tabby',
  'Mixed'
);

INSERT INTO Cats (
  Name,
  Color, 
  Breed
)
VALUES (
  'Rabies',
  'Black',
  'Burmese'
);

INSERT INTO Cats (
  Name,
  Color, 
  Breed
)
VALUES (
  'Archimedes',
  'Blue',
  'Burmese'
);

INSERT INTO Cats (
  Name,
  Color, 
  Breed
)
VALUES (
  'Pythagoras',
  'White',
  'Burmese'
);

INSERT INTO Cats (
  Name,
  Color, 
  Breed
)
VALUES (
  'Oppenheimer',
  'Sphynx',
  'Burmese'
);

INSERT INTO Toys (
  Price,
  Color, 
  Name
)
VALUES (
  5000,
  'Diamond',
  'Julia''s diamond necklace'
);

INSERT INTO Toys
  (
  Price,
  Color,
  Name
  )
VALUES
  (
    5000,
    'toy colored',
    'toy'
);

INSERT INTO Toys (
  Price,
  Color, 
  Name
)
VALUES (
  0,
  'white, black, brown, red',
  'Dead Mouse'
);

INSERT INTO Toys (
  Price,
  Color, 
  Name
)
VALUES (
  2000,
  'Black',
  'Leather Couch'
);

INSERT INTO Toys (
  Price, 
  Color, 
  Name
)
VALUES (
  1,
  'Red',
  'Ball of yarn'
);

INSERT INTO Toys (
  Price, 
  Color, 
  Name
)
VALUES (
  1,
  'Green',
  'Cucumber'
);

INSERT INTO cattoys (
  CatID,
  ToyID
)
VALUES (
  1,
  5
);

INSERT INTO cattoys (
  CatID,
  ToyID
)
VALUES (
  2,
  3
);

INSERT INTO cattoys (
  CatID,
  ToyID  
)
VALUES (
  3,
  3
);

INSERT INTO cattoys ( 
  CatID,
  ToyID
)
VALUES (
  4,
  2
);

INSERT INTO cattoys (
  CatID,
  ToyID
)
VALUES (
  5,
  1
);
