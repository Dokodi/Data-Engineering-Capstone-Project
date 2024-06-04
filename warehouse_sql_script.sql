
CREATE TABLE weather_table (
    lon VARCHAR(16),
    lat VARCHAR(16),
temp VARCHAR(16),
feels_like VARCHAR(100),
humidity VARCHAR(16) ,
pressure VARCHAR(16),
wind_speed VARCHAR(16) ,
cloudiness VARCHAR(16),
country VARCHAR(100),
name VARCHAR(100)
);


COPY weather_table
FROM 'your S3 object URI'
IAM_ROLE 'your role ARN' #this should be a role that has access to S3 and Redshift
CSV
IGNOREHEADER 1;


SELECT *
FROM weather_table;
