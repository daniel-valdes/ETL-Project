# ETL-Project
ETL Project: Jack Bitcon, Peter Sheldon, Thomas Byrne, Daniel Valdes

![Batter](https://i1.wp.com/www.nationalreview.com/wp-content/uploads/2019/10/juan-soto-home-run-2.jpg?fit=789%2C460&ssl=1)

MLB dataset:
https://www.kaggle.com/pschale/mlb-pitch-data-20152018#atbats.csv


The goal of this ETL project was the consolidation of multiple datasets into one working table that gives us a clear picture of pitchers in the MLB that characterizes their pitching style and success rate in the 2018 season. To do this we need to grab data from multiple tables that are related and as such the best option for our analysis would be a relational database.

Four relevant csv’s were loaded into pandas dataframes, those being: *atbats*, *player_names*,  *pitches*, and *games*.

The atbats csv contained a unique id (atbat_id) and columns describing the outcome of each at bat. Relevant information found here would be p_throws (L or R to denote the pitcher’s dominant hand), pitcher_id, game_id, and stand (L or R to denote the batter’s dominant hand). The games csv’s only desirable information was the date of each game which was associated with a unique game_id which could tie it to the atbats dataframe.

The player_names csv had three columns: player_id, first_name, and last_name with player_id being its unique primary key.

The pitches csv contained various columns that characterized each pitch such as indicators of speed, spin, and position. Each row had a non-unique atbat_id associated with it. We chose to only keep a few prescient columns such as speed, break_angle, pitch_type and situational descriptors such as strike and ball count and number of players on base at the time of the pitch. There was no clear primary key in this table so for our purposes, a serialized primary key would be created to serve as our unique identifier of each pitch.

The first transformation we did was to concatenate the first and last name columns in player_names for readability. Next, we joined atbats with games to associate a date with every at bat. This joined dataframe was then filtered to only include at bats from 2018.

The next step was to perform a left join of atbats onto pitches because there were multiple instances of atbat_id found in pitches. At this point, we could drop all null values from pitches which would drop pitches thrown in any year other than 2018 as well as incomplete rows. Finally, an average_speed column was created for ease of use and the final pitches table was joined with the player_names table on pitcher_id. We then reorganized the columns and sorted the final table by pitcher name and re-exported this dataframe to a csv to then be loaded into a PostGres database for querying.


