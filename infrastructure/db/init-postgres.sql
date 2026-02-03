-- Initialize separate databases for each Laravel Service

-- Auth Service
CREATE DATABASE auth_db;
GRANT ALL PRIVILEGES ON DATABASE auth_db TO cfc_user;

-- Formation Service
CREATE DATABASE formation_db;
GRANT ALL PRIVILEGES ON DATABASE formation_db TO cfc_user;

-- Registration Service
CREATE DATABASE registration_db;
GRANT ALL PRIVILEGES ON DATABASE registration_db TO cfc_user;
