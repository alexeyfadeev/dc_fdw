-- clear server and table

DROP FOREIGN TABLE IF EXISTS dc_table CASCADE;
DROP SERVER IF EXISTS dc_server;


-- clear FDW

DROP EXTENSION IF EXISTS dc_fdw;


-- create new FDW

CREATE EXTENSION dc_fdw;


-- create server and table

CREATE SERVER dc_server 
	FOREIGN DATA WRAPPER dc_fdw;

CREATE FOREIGN TABLE dc_table (id int, content text) 
	SERVER dc_server
	OPTIONS (
	    data_dir '/pgsql/postgres/contrib/dc_fdw/data/reuters/training', 
    	index_dir '/pgsql/postgres/contrib/dc_fdw/data/reuters/index',
    	index_method 'SPIM',
    	buffer_size '10',
    	id_col 'id',
    	text_col 'content'
    );