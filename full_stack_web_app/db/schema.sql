CREATE SCHEMA IF NOT EXISTS webapp;

-- ************************************** webapp.users

CREATE TABLE webapp.users
(
    User_ID        bigserial NOT NULL,
    User_Name      text NOT NULL,
    Pass_Word_Hash text NOT NULL,
    Name           text NOT NULL,
    Config         jsonb NOT NULL DEFAULT '{}'::JSONB,
    Created_At     timestamp NOT NULL DEFAULT NOW(),
    Is_Enabled     boolean NOT NULL DEFAULT TRUE,
    CONSTRAINT PK_users PRIMARY KEY ( User_ID )
);


-- ************************************** webapp.exercises

CREATE TABLE webapp.exercises
(
    Exercise_ID   bigserial NOT NULL,
    Exercise_Name text NOT NULL,
    CONSTRAINT PK_exercises PRIMARY KEY ( Exercise_ID )
);


-- ************************************** webapp.images

CREATE TABLE webapp.images
(
    Image_ID     bigserial NOT NULL,
    User_ID      bigserial NOT NULL,
    Content_Type text NOT NULL DEFAULT 'image/png',
    Image_Data   bytea NOT NULL,
    CONSTRAINT PK_images PRIMARY KEY ( Image_ID, User_ID ),
    CONSTRAINT FK_65 FOREIGN KEY ( User_ID ) REFERENCES webapp.users ( User_ID )
);

CREATE INDEX FK_67 ON webapp.images
    (
     User_ID
        );


-- ************************************** webapp.sets

CREATE TABLE webapp.sets
(
    Set_ID      bigserial NOT NULL,
    Exercise_ID bigserial NOT NULL,
    Weight      int NOT NULL DEFAULT 0,
    CONSTRAINT PK_sets PRIMARY KEY ( Set_ID, Exercise_ID ),
    CONSTRAINT FK_106 FOREIGN KEY ( Exercise_ID ) REFERENCES webapp.exercises ( Exercise_ID )
);

CREATE INDEX FK_108 ON webapp.sets
    (
     Exercise_ID
        );

-- ************************************** webapp.workouts

CREATE TABLE webapp.workouts
(
    Workout_ID  bigserial NOT NULL,
    Set_ID    bigserial NOT NULL,
    User_ID   bigserial NOT NULL,
    Exercise_ID bigserial NOT NULL,
    Start_Date  timestamp NOT NULL DEFAULT NOW(),
    CONSTRAINT PK_workouts PRIMARY KEY ( Workout_ID, Set_ID, User_ID, Exercise_ID ),
    CONSTRAINT FK_71 FOREIGN KEY ( Set_ID, Exercise_ID ) REFERENCES webapp.sets ( Set_ID, Exercise_ID ),
    CONSTRAINT FK_74 FOREIGN KEY ( User_ID ) REFERENCES webapp.users ( User_ID )
);

CREATE INDEX FK_73 ON webapp.workouts
    (
     Set_ID,
     Exercise_ID
        );

CREATE INDEX FK_76 ON webapp.workouts
    (
     User_ID
        );