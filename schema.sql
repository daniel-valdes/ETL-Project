


DROP TABLE final_pitches;

CREATE TABLE final_pitches (
    playername VARCHAR(100) NOT NULL,
    p_throws  VARCHAR(5) NOT NULL,
    pitch_type VARCHAR(30) NOT NULL,
    avg_speed  FLOAT NOT NULL,
    spin_rate  FLOAT NOT NULL,    
    break_angle FLOAT NOT NULL,
    nasty   FLOAT NOT NULL,
    ab_id   FLOAT NOT NULL,
    b_count FLOAT NOT NULL,
    s_count  FLOAT NOT NULL,
    pitch_num   FLOAT NOT NULL,
    on_1b   FLOAT NOT NULL,
    on_2b   FLOAT NOT NULL,
    on_3b   FLOAT NOT NULL,
    stand  VARCHAR(1) NOT NULL,
    PRIMARY KEY (ab_id)
);

SELECT * FROM final_pitches

/*import the final_pitches.csv file in the attached folder to a a table with the above referenced parameters

