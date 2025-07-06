-- embedding flow leveraging cortex search service
USE ROLE sysadmin;
USE WAREHOUSE tb_de_wh;
USE SCHEMA TB_101.RAW_CUSTOMER;

CREATE OR REPLACE STAGE docs
  ENCRYPTION = (TYPE = 'SNOWFLAKE_SSE')
  DIRECTORY = (ENABLE = true);
TB_101.RAW_CUSTOMER.DOCS

ls @docs;

CREATE or replace TEMPORARY table RAW_TEXT AS
SELECT 
    RELATIVE_PATH,
    SIZE,
    FILE_URL,
    build_scoped_file_url(@docs, relative_path) as scoped_file_url,
    TO_VARCHAR (
        SNOWFLAKE.CORTEX.PARSE_DOCUMENT (
            '@docs',
            RELATIVE_PATH,
            {'mode': 'LAYOUT'} ):content
        ) AS EXTRACTED_LAYOUT 
FROM 
    DIRECTORY('@docs');



create or replace TABLE DOCS_CHUNKS_TABLE ( 
    RELATIVE_PATH VARCHAR(16777216), -- Relative path to the PDF file
    SIZE NUMBER(38,0), -- Size of the PDF
    FILE_URL VARCHAR(16777216), -- URL for the PDF
    SCOPED_FILE_URL VARCHAR(16777216), -- Scoped url (you can choose which one to keep depending on your use case)
    CHUNK VARCHAR(16777216), -- Piece of text
    CHUNK_INDEX INTEGER -- Index for the text
    --CATEGORY VARCHAR(16777216) -- Will hold the document category to enable filtering
);

INSERT INTO docs_chunks_table (
    relative_path, 
    size, 
    file_url,
    scoped_file_url, 
    chunk, 
    chunk_index
)
SELECT 
    relative_path, 
    size,
    file_url, 
    scoped_file_url,
    c.value::TEXT AS chunk,
    c.index::INTEGER AS chunk_index
FROM 
    raw_text,
    LATERAL FLATTEN(INPUT => SNOWFLAKE.CORTEX.SPLIT_TEXT_RECURSIVE_CHARACTER(
        EXTRACTED_LAYOUT,
        'markdown',
        1024,           -- max chunk size (chars)
        128,            -- overlap (chars)
        ['\n\n', '\n', '.', ' ']  -- recursive breakpoints
    )) c;



CREATE WAREHOUSE cortex_search_wh WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 300 AUTO_RESUME = TRUE;
GRANT USAGE ON WAREHOUSE cortex_search_wh TO ROLE PUBLIC;


create or replace CORTEX SEARCH SERVICE CC_SEARCH_SERVICE_CS
ON chunk
warehouse = cortex_search_wh
TARGET_LAG = '10 day'
as (
    select chunk,
        chunk_index,
        relative_path,
        file_url
    from docs_chunks_table
);

select * from docs_chunks_table limit 5;

