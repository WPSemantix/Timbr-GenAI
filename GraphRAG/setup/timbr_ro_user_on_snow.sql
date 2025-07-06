--- Creating a user for timbr access - read only
USE ROLE SECURITYADMIN;
CREATE ROLE readonly_role;

-- Grant DB and schema usage
GRANT USAGE ON DATABASE TB_101 TO ROLE readonly_role;
GRANT USAGE ON ALL SCHEMAS IN DATABASE TB_101 TO ROLE readonly_role;

-- Grant read access on all tables/views
GRANT SELECT ON ALL TABLES IN DATABASE TB_101 TO ROLE readonly_role;
GRANT SELECT ON FUTURE TABLES IN DATABASE TB_101 TO ROLE readonly_role;
GRANT SELECT ON ALL VIEWS IN DATABASE TB_101 TO ROLE readonly_role;
GRANT SELECT ON FUTURE VIEWS IN DATABASE TB_101 TO ROLE readonly_role;

-- create user
CREATE USER timbr_snow_ro
PASSWORD = '' -- TODO set Password!! 
LOGIN_NAME = 'timbr_snow_ro'
MUST_CHANGE_PASSWORD = FALSE
DEFAULT_ROLE = readonly_role
DEFAULT_WAREHOUSE = TB_DE_WH
DEFAULT_NAMESPACE = TB_101.PUBLIC;

-- Assign user to the role
GRANT ROLE readonly_role TO USER timbr_snow_ro;

select distinct location_id from tb_101.raw_pos.location;
