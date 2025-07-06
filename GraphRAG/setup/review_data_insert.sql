

-- To be used from the timbr.ai Graph
USE ROLE sysadmin;
USE WAREHOUSE tb_de_wh;
USE SCHEMA TB_101.RAW_CUSTOMER;
CREATE OR REPLACE TABLE TB_101.RAW_CUSTOMER.REVIEW (
    customer_id          NUMBER(38,0),
    order_id             NUMBER(38,0),
    franchise_name       VARCHAR(16777216),
    country              VARCHAR(16777216),
    truck_id             NUMBER(38,0),
    location_id          FLOAT,
    order_amount         FLOAT,
    number_of_diners     NUMBER(38,0),
    cost_per_person      FLOAT,
    food_score           NUMBER(1,0),
    service_score        NUMBER(1,0),
    atmosphere_score     NUMBER(1,0),
    stars                FLOAT,
    review               VARCHAR(10000)
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    124933, 101957294, 'Deanna Holmes', 'Japan', 249,
    10442.0, 423.0, 4, 105.75,
    3, 5, 2, 3.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Veggie Combo looked great but lacked seasoning. The texture just felt off. The Lean Beef Tibs was better, I''ll give them that, but the Lean Chicken Tibs was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    129122, 111589162, 'Bradley Blair', 'South Korea', 259,
    8603.0, 407.0, 5, 81.4,
    5, 5, 1, 3.7,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Standard Mac & Cheese looked great but lacked seasoning. The texture just felt off. The Lobster Mac & Cheese was better, I''ll give them that, but the Buffalo Mac & Cheese was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    120121, 113099939, 'Mary Le', 'South Korea', 269,
    5581.0, 428.0, 3, 142.67,
    4, 1, 1, 2.0,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Lean Chicken Tikka Masala was ridiculously good, like, I''d drive across town just to get it again. I also had the Tandoori Mixed Grill, which was super fresh and flavorful. The Combination Curry surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    104448, 118791100, 'Shelby James', 'South Korea', 260,
    8548.0, 534.5, 5, 106.9,
    5, 5, 5, 5.0,
    'Honestly, not bad - but not great either. The Tonkotsu Ramen came out a little lukewarm. I hate when that happens. Props for the Spicy Miso Vegetable Ramen though, that was tasty. I also had the Creamy Chicken Ramen, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    129277, 123907505, 'Kathy Garcia', 'Australia', 278,
    9237.0, 403.0, 4, 100.75,
    2, 5, 3, 3.3,
    'Honestly, not bad - but not great either. The Crepe Suzette came out a little lukewarm. I hate when that happens. Props for the Chicken Pot Pie Crepe though, that was tasty. I also had the Breakfast Crepe, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    48275, 124187327, 'Jessica Brewer', 'Australia', 272,
    14692.0, 518.0, 5, 103.6,
    1, 1, 3, 1.7,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Fried Pickles was ridiculously good, like, I''d drive across town just to get it again. I also had the Two Meat Plate, which was super fresh and flavorful. The Spring Mix Salad surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    112550, 124646014, 'Cristina Lewis', 'Australia', 284,
    10054.0, 507.0, 3, 169.0,
    1, 2, 2, 1.7,
    'This was a total miss for me. The Tandoori Mixed Grill was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the Combination Curry. When I finally got it, it was cold. The Lean Chicken Tikka Masala didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    172006, 125997530, 'Mary Warren', 'Australia', 285,
    7721.0, 411.0, 4, 102.75,
    2, 2, 5, 3.0,
    'The food here felt like a warm hug. That Italian hit all the right notes - spicy, tender, and full of flavor. The Hot Ham & Cheese was good too, not my favorite, but still solid. And let''s not forget the Pastrami - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    45528, 126069745, 'Cristina Lewis', 'Australia', 284,
    9349.0, 429.0, 6, 71.5,
    4, 3, 4, 3.7,
    'I don''t usually leave reviews, but I feel like people need to know. The Tandoori Mixed Grill was a disaster, and not in the fun kind of way. The Combination Curry was missing, and they tried to swap it with something I didn''t ask for. The Lean Chicken Tikka Masala was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    167887, 126270047, 'Erik Moore', 'Australia', 282,
    7741.0, 500.0, 6, 83.33,
    2, 2, 3, 2.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Greek Salad looked great but lacked seasoning. The texture just felt off. The Gyro Plate was better, I''ll give them that, but the The King Combo was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    186212, 128078736, 'Margaret Shaw', 'Australia', 275,
    10078.0, 535.25, 6, 89.21,
    5, 3, 3, 3.7,
    'The food here felt like a warm hug. That Creamy Chicken Ramen hit all the right notes - spicy, tender, and full of flavor. The Spicy Miso Vegetable Ramen was good too, not my favorite, but still solid. And let''s not forget the Tonkotsu Ramen - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    104832, 130288044, 'Margaret Shaw', 'Australia', 275,
    7733.0, 503.25, 4, 125.81,
    3, 3, 4, 3.3,
    'This was a total miss for me. The Spicy Miso Vegetable Ramen was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the Creamy Chicken Ramen. When I finally got it, it was cold. The Tonkotsu Ramen didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    141395, 135185138, 'Adam Mclean', 'Australia', 299,
    11968.0, 604.0, 6, 100.67,
    5, 4, 4, 4.3,
    'The food here felt like a warm hug. That Tandoori Mixed Grill hit all the right notes - spicy, tender, and full of flavor. The Combination Curry was good too, not my favorite, but still solid. And let''s not forget the Lean Chicken Tikka Masala - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    155351, 14931429, 'Amanda Willis', 'Canada', 89,
    1986.0, 535.0, 6, 89.17,
    4, 1, 1, 2.0,
    'I don''t usually leave reviews, but I feel like people need to know. The Lean Chicken Tikka Masala was a disaster, and not in the fun kind of way. The Tandoori Mixed Grill was missing, and they tried to swap it with something I didn''t ask for. The Combination Curry was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    29385, 15147603, 'Tara Green', 'Canada', 90,
    5287.0, 447.0, 5, 89.4,
    5, 2, 4, 3.7,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Italian was ridiculously good, like, I''d drive across town just to get it again. I also had the Hot Ham & Cheese, which was super fresh and flavorful. The Pastrami surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    78543, 16451695, 'Jeffrey Hunter', 'Canada', 87,
    2452.0, 544.0, 6, 90.67,
    4, 3, 5, 4.0,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The The King Combo was ridiculously good, like, I''d drive across town just to get it again. I also had the Gyro Plate, which was super fresh and flavorful. The Greek Salad surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    81077, 17298950, 'Beth Johnson', 'Canada', 83,
    3099.0, 466.0, 6, 77.67,
    2, 3, 1, 2.0,
    'I don''t usually leave reviews, but I feel like people need to know. The Breakfast Crepe was a disaster, and not in the fun kind of way. The Chicken Pot Pie Crepe was missing, and they tried to swap it with something I didn''t ask for. The Crepe Suzette was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    122915, 17308597, 'Corporate Owned', 'United States', 77,
    1176.0, 510.0, 3, 170.0,
    4, 5, 3, 4.0,
    'I don''t usually leave reviews, but I feel like people need to know. The Fried Pickles was a disaster, and not in the fun kind of way. The Two Meat Plate was missing, and they tried to swap it with something I didn''t ask for. The Pulled Pork Sandwich was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    127233, 18038034, 'Jeffrey Hunter', 'Canada', 87,
    2343.0, 516.0, 5, 103.2,
    5, 5, 5, 5.0,
    'I don''t usually leave reviews, but I feel like people need to know. The The King Combo was a disaster, and not in the fun kind of way. The Greek Salad was missing, and they tried to swap it with something I didn''t ask for. The Gyro Plate was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    47389, 19110784, 'Gary Hartman', 'Canada', 80,
    2710.0, 412.5, 5, 82.5,
    4, 5, 1, 3.3,
    'The food here felt like a warm hug. That Tonkotsu Ramen hit all the right notes - spicy, tender, and full of flavor. The Spicy Miso Vegetable Ramen was good too, not my favorite, but still solid. And let''s not forget the Creamy Chicken Ramen - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    72153, 74346683, 'Robert Brown', 'India', 221,
    8987.0, 495.0, 4, 123.75,
    3, 5, 2, 3.3,
    'I don''t usually leave reviews, but I feel like people need to know. The Mothers Favorite was a disaster, and not in the fun kind of way. The The Kitchen Sink was missing, and they tried to swap it with something I didn''t ask for. The The Classic was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    60052, 75956327, 'Robert Brown', 'India', 221,
    11433.0, 421.0, 6, 70.17,
    3, 4, 2, 3.0,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The The Kitchen Sink looked great but lacked seasoning. The texture just felt off. The Mothers Favorite was better, I''ll give them that, but the The Classic was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    171136, 77038400, 'Kimberly Carpenter', 'India', 222,
    6787.0, 490.0, 4, 122.5,
    4, 1, 5, 3.3,
    'I don''t usually leave reviews, but I feel like people need to know. The Greek Salad was a disaster, and not in the fun kind of way. The The King Combo was missing, and they tried to swap it with something I didn''t ask for. The Gyro Plate was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    183377, 77215804, 'Corporate Owned', 'United States', 224,
    6587.0, 401.0, 6, 66.83,
    5, 5, 4, 4.7,
    'I don''t usually leave reviews, but I feel like people need to know. The Lean Chicken Tikka Masala was a disaster, and not in the fun kind of way. The Combination Curry was missing, and they tried to swap it with something I didn''t ask for. The Tandoori Mixed Grill was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    83712, 77264459, 'Lisa Morrison', 'India', 212,
    6765.0, 460.0, 3, 153.33,
    2, 3, 5, 3.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Fried Pickles looked great but lacked seasoning. The texture just felt off. The Pulled Pork Sandwich was better, I''ll give them that, but the Rack of Pork Ribs was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    37764, 79081785, 'Kimberly Carpenter', 'India', 222,
    14632.0, 420.0, 4, 105.0,
    4, 3, 2, 3.0,
    'Honestly, not bad - but not great either. The Gyro Plate came out a little lukewarm. I hate when that happens. Props for the The King Combo though, that was tasty. I also had the Greek Salad, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    129809, 83945651, 'Lauren Heath', 'India', 239,
    8773.0, 521.0, 5, 104.2,
    5, 3, 2, 3.3,
    'This was a total miss for me. The Lean Chicken Tikka Masala was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the Combination Curry. When I finally got it, it was cold. The Tandoori Mixed Grill didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    178235, 85035305, 'Jessica Sosa', 'India', 230,
    6149.0, 562.75, 4, 140.69,
    3, 4, 2, 3.0,
    'Honestly, not bad - but not great either. The Spicy Miso Vegetable Ramen came out a little lukewarm. I hate when that happens. Props for the Tonkotsu Ramen though, that was tasty. I also had the Creamy Chicken Ramen, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    146996, 85496051, 'Corporate Owned', 'United States', 240,
    6125.0, 418.0, 4, 104.5,
    4, 5, 1, 3.3,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Pastrami was ridiculously good, like, I''d drive across town just to get it again. I also had the Hot Ham & Cheese, which was super fresh and flavorful. The Italian surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    115224, 85723521, 'Nicholas Smith', 'India', 237,
    6165.0, 407.0, 5, 81.4,
    4, 3, 5, 4.0,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Gyro Plate looked great but lacked seasoning. The texture just felt off. The The King Combo was better, I''ll give them that, but the Greek Salad was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    104664, 86430040, 'Corporate Owned', 'United States', 240,
    6116.0, 431.0, 3, 143.67,
    4, 1, 1, 2.0,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Hot Ham & Cheese was ridiculously good, like, I''d drive across town just to get it again. I also had the Pastrami, which was super fresh and flavorful. The Italian surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    99509, 86765866, 'Jessica Sosa', 'India', 230,
    12902.0, 632.5, 5, 126.5,
    4, 4, 4, 4.0,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Tonkotsu Ramen was ridiculously good, like, I''d drive across town just to get it again. I also had the Creamy Chicken Ramen, which was super fresh and flavorful. The Spicy Miso Vegetable Ramen surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    163827, 88000150, 'Nancy Rivers', 'India', 227,
    6168.0, 431.0, 5, 86.2,
    3, 4, 4, 3.7,
    'This was a total miss for me. The Three Meat Plate was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the Two Meat Plate. When I finally got it, it was cold. The Rack of Pork Ribs didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    174794, 89875700, 'Brandy Mcdonald', 'India', 234,
    6190.0, 409.0, 6, 68.17,
    2, 1, 2, 1.7,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Lean Chicken Tibs was ridiculously good, like, I''d drive across town just to get it again. I also had the Veggie Combo, which was super fresh and flavorful. The Lean Beef Tibs surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    89172, 90950550, 'Nicholas Smith', 'India', 237,
    12659.0, 561.0, 3, 187.0,
    4, 2, 5, 3.7,
    'Honestly, not bad - but not great either. The The King Combo came out a little lukewarm. I hate when that happens. Props for the Greek Salad though, that was tasty. I also had the Gyro Plate, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    71929, 91798234, 'Michelle Johnson', 'India', 236,
    5973.0, 439.0, 4, 109.75,
    1, 3, 4, 2.7,
    'Honestly, not bad - but not great either. The The Classic came out a little lukewarm. I hate when that happens. Props for the Mothers Favorite though, that was tasty. I also had the The Kitchen Sink, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    145280, 96231669, 'Laura Perez', 'Japan', 254,
    5399.0, 519.0, 5, 103.8,
    1, 4, 3, 2.7,
    'The food here felt like a warm hug. That Tandoori Mixed Grill hit all the right notes - spicy, tender, and full of flavor. The Lean Chicken Tikka Masala was good too, not my favorite, but still solid. And let''s not forget the Combination Curry - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    93600, 97248529, 'Laura Perez', 'Japan', 254,
    5430.0, 465.0, 3, 155.0,
    3, 2, 3, 2.7,
    'I don''t usually leave reviews, but I feel like people need to know. The Lean Chicken Tikka Masala was a disaster, and not in the fun kind of way. The Tandoori Mixed Grill was missing, and they tried to swap it with something I didn''t ask for. The Combination Curry was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    58955, 98895683, 'Patricia Thomas', 'Japan', 252,
    5501.0, 408.0, 4, 102.0,
    4, 5, 3, 4.0,
    'This was a total miss for me. The Gyro Plate was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the Greek Salad. When I finally got it, it was cold. The The King Combo didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    28841, 99064880, 'Laura Perez', 'Japan', 254,
    13403.0, 515.0, 5, 103.0,
    5, 4, 5, 4.7,
    'The food here felt like a warm hug. That Combination Curry hit all the right notes - spicy, tender, and full of flavor. The Lean Chicken Tikka Masala was good too, not my favorite, but still solid. And let''s not forget the Tandoori Mixed Grill - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    130823, 53489107, 'Kelly Murphy', 'France', 164,
    14253.0, 571.0, 6, 95.17,
    2, 5, 3, 3.3,
    'The food here felt like a warm hug. That Combination Curry hit all the right notes - spicy, tender, and full of flavor. The Tandoori Mixed Grill was good too, not my favorite, but still solid. And let''s not forget the Lean Chicken Tikka Masala - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    197051, 53522747, 'Jennifer Schmidt', 'France', 162,
    12442.0, 402.0, 6, 67.0,
    4, 3, 3, 3.3,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The The King Combo was ridiculously good, like, I''d drive across town just to get it again. I also had the Gyro Plate, which was super fresh and flavorful. The Greek Salad surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    193401, 54057549, 'Kevin Webb', 'France', 167,
    13227.0, 449.0, 3, 149.67,
    4, 4, 2, 3.3,
    'I don''t usually leave reviews, but I feel like people need to know. The Three Meat Plate was a disaster, and not in the fun kind of way. The Rack of Pork Ribs was missing, and they tried to swap it with something I didn''t ask for. The Fried Pickles was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    145402, 54068709, 'Joshua Dorsey', 'France', 173,
    14299.0, 455.0, 5, 91.0,
    3, 3, 2, 2.7,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Breakfast Crepe looked great but lacked seasoning. The texture just felt off. The Crepe Suzette was better, I''ll give them that, but the Chicken Pot Pie Crepe was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    82328, 54192711, 'Corporate Owned', 'United States', 177,
    13224.0, 624.0, 6, 104.0,
    2, 3, 5, 3.3,
    'Honestly, not bad - but not great either. The Greek Salad came out a little lukewarm. I hate when that happens. Props for the The King Combo though, that was tasty. I also had the Gyro Plate, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    185546, 54451177, 'Corporate Owned', 'United States', 177,
    11393.0, 522.0, 6, 87.0,
    4, 4, 2, 3.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Gyro Plate looked great but lacked seasoning. The texture just felt off. The The King Combo was better, I''ll give them that, but the Greek Salad was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    115359, 54728990, 'Corporate Owned', 'United States', 177,
    8725.0, 402.0, 3, 134.0,
    3, 3, 3, 3.0,
    'This was a total miss for me. The Greek Salad was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the The King Combo. When I finally got it, it was cold. The Gyro Plate didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    132714, 59247876, 'Rita Williams', 'Poland', 185,
    10285.0, 492.0, 4, 123.0,
    5, 3, 5, 4.3,
    'The food here felt like a warm hug. That Creamy Chicken Ramen hit all the right notes - spicy, tender, and full of flavor. The Tonkotsu Ramen was good too, not my favorite, but still solid. And let''s not forget the Spicy Miso Vegetable Ramen - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    33669, 59999555, 'Megan Brown', 'Poland', 188,
    10278.0, 459.0, 5, 91.8,
    1, 4, 5, 3.3,
    'Honestly, not bad - but not great either. The Chicken Pot Pie Crepe came out a little lukewarm. I hate when that happens. Props for the Crepe Suzette though, that was tasty. I also had the Breakfast Crepe, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    135653, 63678672, 'Rita Williams', 'Poland', 184,
    10293.0, 467.0, 5, 93.4,
    5, 1, 1, 2.3,
    'The food here felt like a warm hug. That Lobster Mac & Cheese hit all the right notes - spicy, tender, and full of flavor. The Buffalo Mac & Cheese was good too, not my favorite, but still solid. And let''s not forget the Standard Mac & Cheese - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    17877, 66155241, 'Thomas Roberson', 'Poland', 209,
    13057.0, 442.0, 3, 147.33,
    5, 3, 3, 3.7,
    'The food here felt like a warm hug. That Combination Curry hit all the right notes - spicy, tender, and full of flavor. The Tandoori Mixed Grill was good too, not my favorite, but still solid. And let''s not forget the Lean Chicken Tikka Masala - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    7831, 66531325, 'Dalton Bowman', 'Poland', 210,
    8026.0, 488.0, 3, 162.67,
    4, 4, 2, 3.3,
    'I don''t usually leave reviews, but I feel like people need to know. The Italian was a disaster, and not in the fun kind of way. The Pastrami was missing, and they tried to swap it with something I didn''t ask for. The Hot Ham & Cheese was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    13030, 67082612, 'Thomas Roberson', 'Poland', 209,
    4391.0, 546.0, 5, 109.2,
    4, 5, 4, 4.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Tandoori Mixed Grill looked great but lacked seasoning. The texture just felt off. The Lean Chicken Tikka Masala was better, I''ll give them that, but the Combination Curry was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    3560, 67140111, 'Thomas Roberson', 'Poland', 209,
    8006.0, 527.0, 6, 87.83,
    4, 2, 2, 2.7,
    'Honestly, not bad - but not great either. The Tandoori Mixed Grill came out a little lukewarm. I hate when that happens. Props for the Combination Curry though, that was tasty. I also had the Lean Chicken Tikka Masala, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    75471, 72226663, 'Danielle Black', 'India', 215,
    8956.0, 423.75, 4, 105.94,
    2, 2, 1, 1.7,
    'Honestly, not bad - but not great either. The Tonkotsu Ramen came out a little lukewarm. I hate when that happens. Props for the Creamy Chicken Ramen though, that was tasty. I also had the Spicy Miso Vegetable Ramen, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    77736, 72365673, 'Robert Brown', 'India', 221,
    6814.0, 436.0, 5, 87.2,
    4, 5, 3, 4.0,
    'The food here felt like a warm hug. That The Classic hit all the right notes - spicy, tender, and full of flavor. The The Kitchen Sink was good too, not my favorite, but still solid. And let''s not forget the Mothers Favorite - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    116820, 72851279, 'Danielle Black', 'India', 215,
    6646.0, 586.5, 3, 195.5,
    4, 4, 5, 4.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Spicy Miso Vegetable Ramen looked great but lacked seasoning. The texture just felt off. The Tonkotsu Ramen was better, I''ll give them that, but the Creamy Chicken Ramen was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    158698, 72858832, 'Corporate Owned', 'United States', 224,
    6784.0, 421.0, 3, 140.33,
    3, 2, 3, 2.7,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Combination Curry was ridiculously good, like, I''d drive across town just to get it again. I also had the Lean Chicken Tikka Masala, which was super fresh and flavorful. The Tandoori Mixed Grill surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    28516, 73143397, 'Danielle Black', 'India', 215,
    6688.0, 411.5, 3, 137.17,
    1, 5, 5, 3.7,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Tonkotsu Ramen was ridiculously good, like, I''d drive across town just to get it again. I also had the Spicy Miso Vegetable Ramen, which was super fresh and flavorful. The Creamy Chicken Ramen surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    99820, 73241913, 'Kimberly Carpenter', 'India', 222,
    6751.0, 412.0, 5, 82.4,
    1, 4, 5, 3.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Gyro Plate looked great but lacked seasoning. The texture just felt off. The Greek Salad was better, I''ll give them that, but the The King Combo was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    155832, 35741974, 'Ashley Whitaker', 'England', 125,
    2091.0, 422.0, 6, 70.33,
    5, 4, 2, 3.7,
    'The food here felt like a warm hug. That Creamy Chicken Ramen hit all the right notes - spicy, tender, and full of flavor. The Spicy Miso Vegetable Ramen was good too, not my favorite, but still solid. And let''s not forget the Tonkotsu Ramen - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    89210, 36422228, 'Marissa Decker', 'England', 122,
    4346.0, 421.0, 4, 105.25,
    1, 2, 4, 2.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Two Meat Plate looked great but lacked seasoning. The texture just felt off. The Rack of Pork Ribs was better, I''ll give them that, but the Fried Pickles was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    25582, 36486663, 'Robyn Smith', 'England', 135,
    12179.0, 400.0, 4, 100.0,
    5, 3, 5, 4.3,
    'Honestly, not bad - but not great either. The Italian came out a little lukewarm. I hate when that happens. Props for the Hot Ham & Cheese though, that was tasty. I also had the Pastrami, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    194851, 38372609, 'Ashley Whitaker', 'England', 125,
    4356.0, 460.25, 3, 153.42,
    3, 1, 1, 1.7,
    'I don''t usually leave reviews, but I feel like people need to know. The Spicy Miso Vegetable Ramen was a disaster, and not in the fun kind of way. The Tonkotsu Ramen was missing, and they tried to swap it with something I didn''t ask for. The Creamy Chicken Ramen was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    155143, 39220465, 'Amy Mcfarland', 'England', 124,
    3154.0, 409.0, 3, 136.33,
    3, 3, 2, 2.7,
    'The food here felt like a warm hug. That Lobster Mac & Cheese hit all the right notes - spicy, tender, and full of flavor. The Standard Mac & Cheese was good too, not my favorite, but still solid. And let''s not forget the Buffalo Mac & Cheese - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    83029, 40855490, 'Michael Burke', 'England', 134,
    4355.0, 519.0, 4, 129.75,
    1, 3, 3, 2.3,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Lean Chicken Tikka Masala was ridiculously good, like, I''d drive across town just to get it again. I also had the Tandoori Mixed Grill, which was super fresh and flavorful. The Combination Curry surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    101943, 442164321, 'Oscar Wilson', 'United States', 71,
    15220.0, 505.0, 3, 168.33,
    4, 1, 3, 2.7,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The The Kitchen Sink looked great but lacked seasoning. The texture just felt off. The Mothers Favorite was better, I''ll give them that, but the The Classic was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    97705, 442617773, 'Kimberly Lawson', 'United States', 74,
    15117.0, 539.0, 3, 179.67,
    1, 1, 4, 2.0,
    'Honestly, not bad - but not great either. The Tandoori Mixed Grill came out a little lukewarm. I hate when that happens. Props for the Combination Curry though, that was tasty. I also had the Lean Chicken Tikka Masala, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    80825, 442901225, 'Kimberly Lawson', 'United States', 74,
    3124.0, 503.0, 6, 83.83,
    4, 5, 5, 4.7,
    'This was a total miss for me. The Lean Chicken Tikka Masala was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the Tandoori Mixed Grill. When I finally got it, it was cold. The Combination Curry didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    145442, 44923561, 'Zachary Perez', 'England', 143,
    3126.0, 465.0, 3, 155.0,
    5, 3, 2, 3.3,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Crepe Suzette was ridiculously good, like, I''d drive across town just to get it again. I also had the Chicken Pot Pie Crepe, which was super fresh and flavorful. The Breakfast Crepe surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    101005, 45361549, 'Jeffrey Bradley', 'England', 137,
    2952.0, 423.0, 4, 105.75,
    1, 4, 4, 3.0,
    'I don''t usually leave reviews, but I feel like people need to know. The Three Meat Plate was a disaster, and not in the fun kind of way. The Pulled Pork Sandwich was missing, and they tried to swap it with something I didn''t ask for. The Fried Pickles was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    49173, 45927399, 'Jeff Jones', 'England', 146,
    4303.0, 422.0, 6, 70.33,
    4, 4, 2, 3.3,
    'This was a total miss for me. The Mothers Favorite was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the The Kitchen Sink. When I finally got it, it was cold. The The Classic didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    121382, 45972779, 'Jeffrey Bradley', 'England', 137,
    9374.0, 507.0, 6, 84.5,
    5, 2, 4, 3.7,
    'The food here felt like a warm hug. That Spring Mix Salad hit all the right notes - spicy, tender, and full of flavor. The Three Meat Plate was good too, not my favorite, but still solid. And let''s not forget the Pulled Pork Sandwich - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    115001, 46038791, 'Sarah Gamble', 'England', 140,
    2990.0, 468.75, 4, 117.19,
    2, 2, 2, 2.0,
    'Honestly, not bad - but not great either. The Spicy Miso Vegetable Ramen came out a little lukewarm. I hate when that happens. Props for the Tonkotsu Ramen though, that was tasty. I also had the Creamy Chicken Ramen, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    197676, 46103248, 'Robert Walker', 'England', 149,
    4308.0, 563.0, 3, 187.67,
    2, 1, 1, 1.3,
    'This was a total miss for me. The Combination Curry was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the Tandoori Mixed Grill. When I finally got it, it was cold. The Lean Chicken Tikka Masala didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    56984, 46159052, 'Jeffrey Bradley', 'England', 137,
    2503.0, 424.0, 3, 141.33,
    2, 5, 2, 3.0,
    'Honestly, not bad - but not great either. The Rack of Pork Ribs came out a little lukewarm. I hate when that happens. Props for the Spring Mix Salad though, that was tasty. I also had the Pulled Pork Sandwich, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    97151, 47464162, 'Jennifer Schmidt', 'France', 162,
    10359.0, 444.0, 3, 148.0,
    2, 3, 1, 2.0,
    'The food here felt like a warm hug. That Greek Salad hit all the right notes - spicy, tender, and full of flavor. The The King Combo was good too, not my favorite, but still solid. And let''s not forget the Gyro Plate - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    139104, 48318535, 'Corporate Owned', 'United States', 161,
    9622.0, 446.0, 5, 89.2,
    3, 2, 2, 2.3,
    'The food here felt like a warm hug. That The Classic hit all the right notes - spicy, tender, and full of flavor. The The Kitchen Sink was good too, not my favorite, but still solid. And let''s not forget the Mothers Favorite - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    83997, 48803796, 'Jimmy Best', 'France', 152,
    12431.0, 471.0, 3, 157.0,
    3, 5, 3, 3.7,
    'I don''t usually leave reviews, but I feel like people need to know. The Pulled Pork Sandwich was a disaster, and not in the fun kind of way. The Spring Mix Salad was missing, and they tried to swap it with something I didn''t ask for. The Rack of Pork Ribs was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    81063, 53010214, 'Jimmy Best', 'France', 152,
    12258.0, 535.0, 4, 133.75,
    3, 2, 5, 3.3,
    'The food here felt like a warm hug. That Pulled Pork Sandwich hit all the right notes - spicy, tender, and full of flavor. The Fried Pickles was good too, not my favorite, but still solid. And let''s not forget the Rack of Pork Ribs - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    99418, 19304689, 'Amanda Willis', 'Canada', 89,
    2241.0, 580.0, 3, 193.33,
    1, 4, 5, 3.3,
    'Honestly, not bad - but not great either. The Lean Chicken Tikka Masala came out a little lukewarm. I hate when that happens. Props for the Tandoori Mixed Grill though, that was tasty. I also had the Combination Curry, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    63834, 19930773, 'Jeffrey Hunter', 'Canada', 87,
    1633.0, 474.0, 6, 79.0,
    4, 1, 1, 2.0,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The The King Combo was ridiculously good, like, I''d drive across town just to get it again. I also had the Gyro Plate, which was super fresh and flavorful. The Greek Salad surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    3684, 20167788, 'Jeffrey Hunter', 'Canada', 86,
    1372.0, 497.0, 3, 165.67,
    5, 1, 2, 2.7,
    'This was a total miss for me. The Mothers Favorite was borderline inedible - dry, bland, and somehow overcooked. I waited ages only to find out they forgot the The Kitchen Sink. When I finally got it, it was cold. The The Classic didn''t help either - too salty and just sad looking. Atmosphere felt rushed, and the staff barely acknowledged the issues. Never again.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    120796, 20664181, 'Gary Hartman', 'Canada', 80,
    1696.0, 610.25, 5, 122.05,
    4, 4, 2, 3.3,
    'The food here felt like a warm hug. That Spicy Miso Vegetable Ramen hit all the right notes - spicy, tender, and full of flavor. The Tonkotsu Ramen was good too, not my favorite, but still solid. And let''s not forget the Creamy Chicken Ramen - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    53224, 21172595, 'Sarah Phillips', 'Canada', 79,
    1629.0, 429.0, 3, 143.0,
    3, 1, 4, 2.7,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Buffalo Mac & Cheese was ridiculously good, like, I''d drive across town just to get it again. I also had the Lobster Mac & Cheese, which was super fresh and flavorful. The Standard Mac & Cheese surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    61463, 21221866, 'Amanda Willis', 'Canada', 89,
    1370.0, 542.0, 6, 90.33,
    4, 4, 5, 4.3,
    'The food here felt like a warm hug. That Combination Curry hit all the right notes - spicy, tender, and full of flavor. The Tandoori Mixed Grill was good too, not my favorite, but still solid. And let''s not forget the Lean Chicken Tikka Masala - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    188442, 23712410, 'Alexander Rodriguez', 'Canada', 105,
    1590.0, 422.0, 6, 70.33,
    1, 1, 1, 1.0,
    'The food here felt like a warm hug. That Pastrami hit all the right notes - spicy, tender, and full of flavor. The Italian was good too, not my favorite, but still solid. And let''s not forget the Hot Ham & Cheese - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    166366, 24060280, 'Dawn Rivera', 'Canada', 92,
    2803.0, 453.0, 3, 151.0,
    4, 2, 1, 2.3,
    'Honestly, not bad - but not great either. The Spring Mix Salad came out a little lukewarm. I hate when that happens. Props for the Fried Pickles though, that was tasty. I also had the Three Meat Plate, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    172830, 24528383, 'Anthony Cunningham', 'Canada', 104,
    2636.0, 411.0, 4, 102.75,
    2, 5, 3, 3.3,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Combination Curry looked great but lacked seasoning. The texture just felt off. The Lean Chicken Tikka Masala was better, I''ll give them that, but the Tandoori Mixed Grill was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    73856, 24551083, 'Corporate Owned', 'United States', 102,
    5182.0, 404.0, 6, 67.33,
    2, 4, 3, 3.0,
    'The food here felt like a warm hug. That Gyro Plate hit all the right notes - spicy, tender, and full of flavor. The Greek Salad was good too, not my favorite, but still solid. And let''s not forget the The King Combo - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    54767, 25883817, 'Anthony Cunningham', 'Canada', 104,
    8414.0, 402.0, 3, 134.0,
    4, 4, 5, 4.3,
    'The food here felt like a warm hug. That Lean Chicken Tikka Masala hit all the right notes - spicy, tender, and full of flavor. The Tandoori Mixed Grill was good too, not my favorite, but still solid. And let''s not forget the Combination Curry - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    40174, 28032055, 'Susan Ross', 'Canada', 110,
    5368.0, 547.75, 3, 182.58,
    2, 1, 3, 2.0,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Tonkotsu Ramen looked great but lacked seasoning. The texture just felt off. The Creamy Chicken Ramen was better, I''ll give them that, but the Spicy Miso Vegetable Ramen was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    36427, 28053965, 'James Duncan', 'Canada', 116,
    14084.0, 434.0, 6, 72.33,
    4, 1, 4, 3.0,
    'The food here felt like a warm hug. That The Classic hit all the right notes - spicy, tender, and full of flavor. The Mothers Favorite was good too, not my favorite, but still solid. And let''s not forget the The Kitchen Sink - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    45498, 28452813, 'Susan Ross', 'Canada', 110,
    8474.0, 470.25, 4, 117.56,
    5, 2, 5, 4.0,
    'Honestly, not bad - but not great either. The Tonkotsu Ramen came out a little lukewarm. I hate when that happens. Props for the Creamy Chicken Ramen though, that was tasty. I also had the Spicy Miso Vegetable Ramen, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    12859, 28484287, 'Jeffrey Graham', 'Canada', 119,
    13199.0, 482.0, 6, 80.33,
    3, 1, 5, 3.0,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Tandoori Mixed Grill was ridiculously good, like, I''d drive across town just to get it again. I also had the Lean Chicken Tikka Masala, which was super fresh and flavorful. The Combination Curry surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    144154, 28887987, 'James Duncan', 'Canada', 116,
    1647.0, 467.0, 6, 77.83,
    5, 5, 4, 4.7,
    'I don''t usually leave reviews, but I feel like people need to know. The The Classic was a disaster, and not in the fun kind of way. The Mothers Favorite was missing, and they tried to swap it with something I didn''t ask for. The The Kitchen Sink was greasy and overcooked. For what I paid, I expected something halfway decent - this wasn''t it.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    112841, 28985759, 'Susan Ross', 'Canada', 110,
    4163.0, 669.25, 4, 167.31,
    4, 5, 5, 4.7,
    'I had high hopes based on the reviews, but the experience was kind of a mixed bag. The Spicy Miso Vegetable Ramen looked great but lacked seasoning. The texture just felt off. The Tonkotsu Ramen was better, I''ll give them that, but the Creamy Chicken Ramen was a little dry for my taste. Staff were friendly, but the wait was longer than expected and the vibe was kind of chaotic.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    59918, 31978893, 'Alex Jackson', 'Canada', 117,
    5331.0, 410.0, 3, 136.67,
    3, 5, 5, 4.3,
    'The food here felt like a warm hug. That Gyro Plate hit all the right notes - spicy, tender, and full of flavor. The Greek Salad was good too, not my favorite, but still solid. And let''s not forget the The King Combo - sweet, crunchy, and just what I needed to wrap up the meal. The atmosphere was casual and welcoming. Totally worth the stop.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    169407, 32306606, 'Alex Jackson', 'Canada', 117,
    5360.0, 458.0, 3, 152.67,
    1, 5, 4, 3.3,
    'I''m usually skeptical about food trucks, but wow - this one blew me away. The Greek Salad was ridiculously good, like, I''d drive across town just to get it again. I also had the Gyro Plate, which was super fresh and flavorful. The The King Combo surprised me the most - not something I''d usually order, but I''m glad I did. Staff were quick, warm, and seemed to genuinely enjoy what they were doing. 10/10 would recommend if you''re anywhere near this truck.'
);

INSERT INTO TB_101.RAW_CUSTOMER.REVIEW (
    customer_id, order_id, franchise_name, country, truck_id, location_id,
    order_amount, number_of_diners, cost_per_person,
    food_score, service_score, atmosphere_score, stars, review
) VALUES (
    74588, 35641146, 'Donald Larson', 'England', 131,
    10732.0, 413.0, 4, 103.25,
    1, 4, 1, 2.0,
    'Honestly, not bad - but not great either. The The Classic came out a little lukewarm. I hate when that happens. Props for the The Kitchen Sink though, that was tasty. I also had the Mothers Favorite, which was okay, but kind of greasy. Overall, it felt a bit overpriced for the quality.'
);