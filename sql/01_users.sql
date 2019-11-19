CREATE TABLE users (
  `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `username` VARCHAR(15) NOT NULL,
  `email` VARCHAR(320) NOT NULL,
  `password` VARCHAR(40) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY (`username`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO users (username,email,password) VALUES ('admin','admin@localhost',TO_BASE64(UNHEX(SHA1('admin'))));
