CREATE USER canal IDENTIFIED BY 'canal';    
GRANT SELECT, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'canal'@'%';  

CREATE USER canal_manager IDENTIFIED BY 'canal_manager';
GRANT ALL PRIVILEGES ON canal_manager.* TO 'canal_manager'@'%';
FLUSH PRIVILEGES;
