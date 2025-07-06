CREATE OR REPLACE PROPERTY "country" string;
CREATE OR REPLACE PROPERTY "number_of_diners" bigint;
CREATE OR REPLACE PROPERTY "menu_item_id" bigint;
CREATE OR REPLACE PROPERTY "iso_country_code" string;
CREATE OR REPLACE PROPERTY "primary_city" string;
CREATE OR REPLACE PROPERTY "shift_start_time" string;
CREATE OR REPLACE PROPERTY "menu_type_id" bigint;
CREATE OR REPLACE PROPERTY "item_category" string;
CREATE OR REPLACE PROPERTY "location_id" bigint;
CREATE OR REPLACE PROPERTY "sign_up_date" date;
CREATE OR REPLACE PROPERTY "shift_end_time" string;
CREATE OR REPLACE PROPERTY "cost_per_person" float;
CREATE OR REPLACE PROPERTY "e_mail" string;
CREATE OR REPLACE PROPERTY "price" decimal;
CREATE OR REPLACE PROPERTY "review" string;
CREATE OR REPLACE PROPERTY "order_amount" decimal;
CREATE OR REPLACE PROPERTY "truck_opening_date" date;
CREATE OR REPLACE PROPERTY "model" string;
CREATE OR REPLACE PROPERTY "truck_model_year" bigint;
CREATE OR REPLACE PROPERTY "sale_price_usd" decimal;
CREATE OR REPLACE PROPERTY "ev_flag" bigint;
CREATE OR REPLACE PROPERTY "truck_id" bigint;
CREATE OR REPLACE PROPERTY "iso_currency" string;
CREATE OR REPLACE PROPERTY "favourite_brand" string;
CREATE OR REPLACE PROPERTY "order_detail_id" bigint;
CREATE OR REPLACE PROPERTY "placekey" string;
CREATE OR REPLACE PROPERTY "service_score" bigint;
CREATE OR REPLACE PROPERTY "birthday_date" date;
CREATE OR REPLACE PROPERTY "order_total" decimal;
CREATE OR REPLACE PROPERTY "phone_number" string;
CREATE OR REPLACE PROPERTY "region" string;
CREATE OR REPLACE PROPERTY "order_id" bigint;
CREATE OR REPLACE PROPERTY "country_id" bigint;
CREATE OR REPLACE PROPERTY "city_id" bigint;
CREATE OR REPLACE PROPERTY "iso_country" string;
CREATE OR REPLACE PROPERTY "gender" string;
CREATE OR REPLACE PROPERTY "city" string;
CREATE OR REPLACE PROPERTY "franchise_flag" bigint;
CREATE OR REPLACE PROPERTY "children_count" string;
CREATE OR REPLACE PROPERTY "city_population" string;
CREATE OR REPLACE PROPERTY "cost_of_goods_usd" decimal;
CREATE OR REPLACE PROPERTY "menu_item_name" string;
CREATE OR REPLACE PROPERTY "food_score" bigint;
CREATE OR REPLACE PROPERTY "menu_item_health_metrics_obj" string;
CREATE OR REPLACE PROPERTY "order_tax_amount" string;
CREATE OR REPLACE PROPERTY "franchise_id" bigint;
CREATE OR REPLACE PROPERTY "line_number" bigint;
CREATE OR REPLACE PROPERTY "shift_id" bigint;
CREATE OR REPLACE PROPERTY "order_item_discount_amount" string;
CREATE OR REPLACE PROPERTY "iso_region" string;
CREATE OR REPLACE PROPERTY "first_name" string;
CREATE OR REPLACE PROPERTY "make" string;
CREATE OR REPLACE PROPERTY "order_channel" string;
CREATE OR REPLACE PROPERTY "menu_id" bigint;
CREATE OR REPLACE PROPERTY "preferred_language" string;
CREATE OR REPLACE PROPERTY "discount_id" string;
CREATE OR REPLACE PROPERTY "franchise_name" string;
CREATE OR REPLACE PROPERTY "quantity" bigint;
CREATE OR REPLACE PROPERTY "menu_type" string;
CREATE OR REPLACE PROPERTY "order_currency" string;
CREATE OR REPLACE PROPERTY "atmosphere_score" bigint;
CREATE OR REPLACE PROPERTY "last_name" string;
CREATE OR REPLACE PROPERTY "item_subcategory" string;
CREATE OR REPLACE PROPERTY "stars" float;
CREATE OR REPLACE PROPERTY "unit_price" decimal;
CREATE OR REPLACE PROPERTY "order_date" timestamp;
CREATE OR REPLACE PROPERTY "marital_status" string;
CREATE OR REPLACE PROPERTY "order_discount_amount" string;
CREATE OR REPLACE PROPERTY "location" string;
CREATE OR REPLACE PROPERTY "customer_id" bigint;
CREATE OR REPLACE PROPERTY "postal_code" string;
CREATE OR REPLACE PROPERTY "served_ts" string;
CREATE OR REPLACE PROPERTY "truck_brand_name" string;
CREATE OR REPLACE CONCEPT "truck_location" ("location" string, "region" string, "placekey" string, "iso_country_code" string, "city" string, "location_id" bigint, "country" string, PRIMARY KEY ("location_id"), LABEL ("location"), CONSTRAINT "in_country" FOREIGN KEY ("country") REFERENCES "country" ("country") INVERSEOF "has_location" , CONSTRAINT "location_sold_order" FOREIGN KEY ("location_id") REFERENCES "meal_order" ("location_id") INVERSEOF "sold_at_location" ) INHERITS ("thing") DESCRIPTION 'The place where a food truck is located' WITH TAGS ("icon" = 'fa-location-dot');
CREATE OR REPLACE CONCEPT "review" ("cost_per_person" float, "service_score" bigint, "franchise_name" string, "atmosphere_score" bigint, "location_id" bigint, "truck_id" bigint, "country" string, "number_of_diners" bigint, "order_id" bigint, "stars" float, "customer_id" bigint, "food_score" bigint, "order_amount" decimal, "review" string, PRIMARY KEY ("order_id"), LABEL ("customer_id"), CONSTRAINT "by_meal_order_item" FOREIGN KEY ("order_id") REFERENCES "meal_order_item" ("order_id") INVERSEOF "has_review" , CONSTRAINT "order_review" FOREIGN KEY ("customer_id") REFERENCES "meal_order" ("customer_id") INVERSEOF "reviewed_by" ) INHERITS ("thing") WITH TAGS ("icon" = 'fa-star');
CREATE OR REPLACE CONCEPT "menu" ("item_category" string, "menu_id" bigint, "menu_item_id" bigint, "item_subcategory" string, "cost_of_goods_usd" decimal, "menu_type" string, "menu_type_id" bigint, "menu_item_health_metrics_obj" string, "truck_brand_name" string, "sale_price_usd" decimal, "menu_item_name" string, PRIMARY KEY ("menu_id"), LABEL ("truck_brand_name", "menu_id"), CONSTRAINT "has_item" FOREIGN KEY ("menu_item_id") REFERENCES "meal_order_item" ("menu_item_id") INVERSEOF "from_menu" , CONSTRAINT "of_a_truck" FOREIGN KEY ("menu_id") REFERENCES "food_truck" ("menu_type_id") INVERSEOF "sale_menu" ) INHERITS ("thing") DESCRIPTION 'A food menu listing containing the categorization of different menu types, prices of menu items and other menu metadata' WITH TAGS ("icon" = 'fa-clipboard-list');
CREATE OR REPLACE CONCEPT "meal_order_item" ("line_number" bigint, "order_item_discount_amount" string, "order_detail_id" bigint, "menu_item_id" bigint, "quantity" bigint, "order_id" bigint, "discount_id" string, "price" decimal, "unit_price" decimal, PRIMARY KEY ("order_detail_id"), LABEL ("order_id"), CONSTRAINT "order_lines_in_order" FOREIGN KEY ("order_id") REFERENCES "meal_order" ("order_id") INVERSEOF "order_contains_order_lines" ) INHERITS ("thing") DESCRIPTION 'Represents an individual item ordered as part of a meal, including the menu item, quantity, unit price, and any line-specific discounts.
Each meal item links to a menu item and belongs to a meal order (via order_id).' WITH TAGS ("icon" = 'fa-cutlery');
CREATE OR REPLACE CONCEPT "meal_order" ("order_discount_amount" string, "order_date" timestamp, "discount_id" string, "order_tax_amount" string, "order_channel" string, "location_id" bigint, "truck_id" bigint, "order_id" bigint, "shift_start_time" string, "customer_id" bigint, "shift_id" bigint, "order_amount" decimal, "order_total" decimal, "order_currency" string, "shift_end_time" string, "served_ts" string, PRIMARY KEY ("order_id"), LABEL ("order_id"), CONSTRAINT "orders_sold_by_truck" FOREIGN KEY ("truck_id") REFERENCES "food_truck" ("truck_id") INVERSEOF "truck_sold_order" ) INHERITS ("thing") DESCRIPTION 'Represents a customer’s food truck order including its identifiers, timestamps, payment details, location, and service context.
This concept includes key attributes like customer ID, truck ID, order total, discount, order and served timestamps, shift, and payment channel.' WITH TAGS ("icon" = 'fa-receipt');
CREATE OR REPLACE CONCEPT "franchise" ("e_mail" string, "last_name" string, "city" string, "phone_number" string, "franchise_id" bigint, "first_name" string, "country" string, PRIMARY KEY ("franchise_id"), LABEL ("first_name", "last_name"), CONSTRAINT "owns_truck" FOREIGN KEY ("franchise_id") REFERENCES "food_truck" ("franchise_id") INVERSEOF "truch_of_franchise" ) INHERITS ("thing") WITH TAGS ("icon" = 'fa-building');
CREATE OR REPLACE CONCEPT "food_truck" ("region" string, "primary_city" string, "iso_country_code" string, "menu_type_id" bigint, "ev_flag" bigint, "franchise_flag" bigint, "truck_id" bigint, "franchise_id" bigint, "truck_opening_date" date, "country" string, "iso_region" string, "model" string, "make" string, "truck_model_year" bigint, PRIMARY KEY ("truck_id"), LABEL ("truck_id")) INHERITS ("thing") DESCRIPTION 'Represents a mobile food service unit operating under a franchise.
Includes metadata such as its location, opening date, franchise affiliation, menu type, and vehicle details (make, model, EV status, etc.).' WITH TAGS ("icon" = 'fa-truck-field');
CREATE OR REPLACE CONCEPT "customer" ("preferred_language" string, "children_count" string, "birthday_date" date, "last_name" string, "gender" string, "phone_number" string, "country" string, "marital_status" string, "e_mail" string, "city" string, "customer_id" bigint, "sign_up_date" date, "postal_code" string, "favourite_brand" string, "first_name" string, PRIMARY KEY ("customer_id"), LABEL ("first_name", "last_name", "customer_id"), CONSTRAINT "customer_order_review" FOREIGN KEY ("customer_id") REFERENCES "review" ("customer_id") INVERSEOF "order_review_by_customer" , CONSTRAINT "in_country" FOREIGN KEY ("country") REFERENCES "country" ("country") INVERSEOF "includes_person" , CONSTRAINT "customer_bought_orders" FOREIGN KEY ("customer_id") REFERENCES "meal_order" ("customer_id") INVERSEOF "orders_sold_to_customer" ) INHERITS ("thing") WITH TAGS ("icon" = 'fa-user');
CREATE OR REPLACE CONCEPT "country" ("city_population" string, "iso_country" string, "city" string, "city_id" bigint, "country_id" bigint, "iso_currency" string, "country" string, PRIMARY KEY ("country_id"), LABEL ("country")) INHERITS ("thing") DESCRIPTION 'General information about a country like population, city, and ISO codes' WITH TAGS ("icon" = 'fa-flag');
CREATE OR REPLACE CONCEPT "positive_review"  INHERITS ("review") FROM timbr."review" WHERE "stars" >= 4;
CREATE OR REPLACE CONCEPT "negative_review"  INHERITS ("review") FROM timbr."review" WHERE "stars" < 4;
CREATE OR REPLACE CONCEPT "snack_menu"  INHERITS ("menu") FROM timbr."menu" WHERE "item_category" = 'Snack';
CREATE OR REPLACE CONCEPT "main_menu"  INHERITS ("menu") FROM timbr."menu" WHERE "item_category" = 'Main';
CREATE OR REPLACE CONCEPT "dessert_menu"  INHERITS ("menu") FROM timbr."menu" WHERE "item_category" = 'Dessert';
CREATE OR REPLACE CONCEPT "beverage_menu"  INHERITS ("menu") FROM timbr."menu" WHERE "item_category" = 'Beverage';
CREATE OR REPLACE CONCEPT "warm_option_snack_menu"  INHERITS ("snack_menu") FROM timbr."snack_menu" WHERE "item_subcategory" = 'Warm Option';
CREATE OR REPLACE CONCEPT "hot_option_snack_menu"  INHERITS ("snack_menu") FROM timbr."snack_menu" WHERE "item_subcategory" = 'Hot Option';
CREATE OR REPLACE CONCEPT "cold_option_snack_menu"  INHERITS ("snack_menu") FROM timbr."snack_menu" WHERE "item_subcategory" = 'Cold Option';
CREATE OR REPLACE CONCEPT "warm_option_main_menu"  INHERITS ("main_menu") FROM timbr."main_menu" WHERE "item_subcategory" = 'Warm Option';
CREATE OR REPLACE CONCEPT "hot_option_main_menu"  INHERITS ("main_menu") FROM timbr."main_menu" WHERE "item_subcategory" = 'Hot Option';
CREATE OR REPLACE CONCEPT "cold_option_main_menu"  INHERITS ("main_menu") FROM timbr."main_menu" WHERE "item_subcategory" = 'Cold Option';
CREATE OR REPLACE CONCEPT "gasoline_food_truck"  INHERITS ("food_truck") FROM timbr."food_truck" WHERE "ev_flag" = '0';
CREATE OR REPLACE CONCEPT "electric_food_truck"  INHERITS ("food_truck") FROM timbr."food_truck" WHERE "ev_flag" = '1';
CREATE OR REPLACE CONCEPT "custom_food_truck"  INHERITS ("food_truck") FROM timbr."food_truck" WHERE "make" = 'Custom';
CREATE OR REPLACE CONCEPT "van_custom_food_truck"  INHERITS ("custom_food_truck") FROM timbr."custom_food_truck" WHERE "model" = 'Van';
CREATE OR REPLACE CONCEPT "box_truck_custom_food_truck"  INHERITS ("custom_food_truck") FROM timbr."custom_food_truck" WHERE "model" = 'Box Truck';
CREATE OR REPLACE CONCEPT "premium_customer"  INHERITS ("customer") WITH TAGS ("icon" = 'fa-user-tie') FROM dtimbr."customer" WHERE "customer_bought_orders[meal_order].order_total" > 400 AND "customer_order_review[review].order_amount" >= 100;
CREATE OR REPLACE CONCEPT "united_states"  INHERITS ("country") FROM timbr."country" WHERE "country" = 'United States';
CREATE OR REPLACE CONCEPT "germany"  INHERITS ("country") FROM timbr."country" WHERE "country" = 'Germany';
CREATE OR REPLACE CONCEPT "france"  INHERITS ("country") FROM timbr."country" WHERE "country" = 'France';
CREATE OR REPLACE CONCEPT "england"  INHERITS ("country") FROM timbr."country" WHERE "country" = 'England';
CREATE OR REPLACE CONCEPT "canada"  INHERITS ("country") FROM timbr."country" WHERE "country" = 'Canada';
CREATE OR REPLACE MAPPING "map_customer_loyalty_yn_7nr2g6x" INTO ("customer") USING "tb_101_graphrag_demo" AS SELECT
  "COUNTRY" AS "country",
  "CITY" AS "city",
  "FIRST_NAME" AS "first_name",
  "LAST_NAME" AS "last_name",
  "E_MAIL" AS "e_mail",
  "PHONE_NUMBER" AS "phone_number",
  "CUSTOMER_ID" AS "customer_id",
  "POSTAL_CODE" AS "postal_code",
  "PREFERRED_LANGUAGE" AS "preferred_language",
  "GENDER" AS "gender",
  "FAVOURITE_BRAND" AS "favourite_brand",
  "MARITAL_STATUS" AS "marital_status",
  "CHILDREN_COUNT" AS "children_count",
  "SIGN_UP_DATE" AS "sign_up_date",
  "BIRTHDAY_DATE" AS "birthday_date"
FROM "TB_101"."RAW_CUSTOMER"."CUSTOMER_LOYALTY";
CREATE OR REPLACE MAPPING "map_truck_69nynfv4kr" INTO ("food_truck") USING "tb_101_graphrag_demo" AS SELECT
  "COUNTRY" AS "country",
  "FRANCHISE_ID" AS "franchise_id",
  "REGION" AS "region",
  "ISO_COUNTRY_CODE" AS "iso_country_code",
  "MENU_TYPE_ID" AS "menu_type_id",
  "TRUCK_ID" AS "truck_id",
  "PRIMARY_CITY" AS "primary_city",
  "ISO_REGION" AS "iso_region",
  "FRANCHISE_FLAG" AS "franchise_flag",
  "MAKE" AS "make",
  "MODEL" AS "model",
  "EV_FLAG" AS "ev_flag",
  "TRUCK_OPENING_DATE" AS "truck_opening_date",
  "YEAR" AS "truck_model_year"
FROM "TB_101"."RAW_POS"."TRUCK";
CREATE OR REPLACE MAPPING "map_franchise_woc5lb4icy" INTO ("franchise") USING "tb_101_graphrag_demo" AS SELECT
  "COUNTRY" AS "country",
  "CITY" AS "city",
  "FRANCHISE_ID" AS "franchise_id",
  "FIRST_NAME" AS "first_name",
  "LAST_NAME" AS "last_name",
  "E_MAIL" AS "e_mail",
  "PHONE_NUMBER" AS "phone_number"
FROM "TB_101"."RAW_POS"."FRANCHISE";
CREATE OR REPLACE MAPPING "map_order_header_ebszop9hpk" INTO ("meal_order") USING "tb_101_graphrag_demo" AS SELECT
  CAST("LOCATION_ID" AS BIGINT) AS "location_id",
  "ORDER_ID" AS "order_id",
  "DISCOUNT_ID" AS "discount_id",
  "TRUCK_ID" AS "truck_id",
  "CUSTOMER_ID" AS "customer_id",
  "SHIFT_ID" AS "shift_id",
  "SHIFT_START_TIME" AS "shift_start_time",
  "SHIFT_END_TIME" AS "shift_end_time",
  "ORDER_CHANNEL" AS "order_channel",
  "SERVED_TS" AS "served_ts",
  "ORDER_CURRENCY" AS "order_currency",
  "ORDER_AMOUNT" AS "order_amount",
  "ORDER_TAX_AMOUNT" AS "order_tax_amount",
  "ORDER_DISCOUNT_AMOUNT" AS "order_discount_amount",
  "ORDER_TOTAL" AS "order_total",
  "ORDER_TS" AS "order_date"
FROM "TB_101"."RAW_POS"."ORDER_HEADER";
CREATE OR REPLACE MAPPING "map_country_9zkqrouobo" INTO ("country") USING "tb_101_graphrag_demo" AS SELECT
  "COUNTRY_ID" AS "country_id",
  "COUNTRY" AS "country",
  "ISO_CURRENCY" AS "iso_currency",
  "ISO_COUNTRY" AS "iso_country",
  "CITY_ID" AS "city_id",
  "CITY" AS "city",
  "CITY_POPULATION" AS "city_population"
FROM "TB_101"."RAW_POS"."COUNTRY";
CREATE OR REPLACE MAPPING "map_menu_vyluh_p2r" INTO ("menu") USING "tb_101_graphrag_demo" AS SELECT
  "MENU_TYPE_ID" AS "menu_type_id",
  "MENU_ITEM_ID" AS "menu_item_id",
  "MENU_ID" AS "menu_id",
  "MENU_TYPE" AS "menu_type",
  "TRUCK_BRAND_NAME" AS "truck_brand_name",
  "MENU_ITEM_NAME" AS "menu_item_name",
  "ITEM_CATEGORY" AS "item_category",
  "ITEM_SUBCATEGORY" AS "item_subcategory",
  "COST_OF_GOODS_USD" AS "cost_of_goods_usd",
  "SALE_PRICE_USD" AS "sale_price_usd",
  "MENU_ITEM_HEALTH_METRICS_OBJ" AS "menu_item_health_metrics_obj"
FROM "TB_101"."RAW_POS"."MENU";
CREATE OR REPLACE MAPPING "map_review_jyvukj27a" INTO ("review") USING "tb_101_graphrag_demo" AS SELECT
  "CUSTOMER_ID" AS "customer_id",
  "ORDER_ID" AS "order_id",
  "FRANCHISE_NAME" AS "franchise_name",
  "COUNTRY" AS "country",
  "TRUCK_ID" AS "truck_id",
  CAST("LOCATION_ID" AS BIGINT) AS "location_id",
  "ORDER_AMOUNT" AS "order_amount",
  "NUMBER_OF_DINERS" AS "number_of_diners",
  "COST_PER_PERSON" AS "cost_per_person",
  "FOOD_SCORE" AS "food_score",
  "SERVICE_SCORE" AS "service_score",
  "ATMOSPHERE_SCORE" AS "atmosphere_score",
  "STARS" AS "stars",
  "REVIEW" AS "review"
FROM "TB_101"."RAW_CUSTOMER"."REVIEW";
CREATE OR REPLACE MAPPING "map_location_voxzyctkkw" INTO ("truck_location") USING "tb_101_graphrag_demo" AS SELECT
  "COUNTRY" AS "country",
  "CITY" AS "city",
  "LOCATION_ID" AS "location_id",
  "PLACEKEY" AS "placekey",
  "LOCATION" AS "location",
  "REGION" AS "region",
  "ISO_COUNTRY_CODE" AS "iso_country_code"
FROM "TB_101"."RAW_POS"."LOCATION";
CREATE OR REPLACE MAPPING "map_order_detail_j0ptng8rqd" INTO ("meal_order_item") USING "tb_101_graphrag_demo" AS SELECT
  "MENU_ITEM_ID" AS "menu_item_id",
  "ORDER_DETAIL_ID" AS "order_detail_id",
  "ORDER_ID" AS "order_id",
  "DISCOUNT_ID" AS "discount_id",
  "LINE_NUMBER" AS "line_number",
  "QUANTITY" AS "quantity",
  "UNIT_PRICE" AS "unit_price",
  "PRICE" AS "price",
  "ORDER_ITEM_DISCOUNT_AMOUNT" AS "order_item_discount_amount"
FROM "TB_101"."RAW_POS"."ORDER_DETAIL";