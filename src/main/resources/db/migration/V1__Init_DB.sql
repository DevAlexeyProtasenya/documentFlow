CREATE TABLE hibernate_sequence (
  next_val BIGINT
);
INSERT INTO hibernate_sequence VALUES (2);
INSERT INTO hibernate_sequence VALUES (1);

CREATE TABLE letter (
  id         BIGINT NOT NULL,
  filename   VARCHAR(255),
  date       DATETIME,
  sign_date  DATETIME,
  signed     VARCHAR(255),
  profession VARCHAR(255),
  lettername VARCHAR(100),
  sender     VARCHAR(255),
  user_id    BIGINT,
  PRIMARY KEY (id)
);

CREATE TABLE user_role (
  user_id BIGINT NOT NULL,
  roles   VARCHAR(255)
);

CREATE TABLE usr (
  id              BIGINT       NOT NULL,
  activation_code VARCHAR(255),
  active          BIT          NOT NULL,
  email           VARCHAR(255),
  password        VARCHAR(255) NOT NULL,
  username        VARCHAR(255) NOT NULL,
  profession      VARCHAR(255),
    PRIMARY KEY ( ID )
);

ALTER TABLE letter
  ADD CONSTRAINT letter_user_fk
FOREIGN KEY (user_id) REFERENCES usr (id);

ALTER TABLE user_role
  ADD CONSTRAINT role_user_fk
FOREIGN KEY (user_id) REFERENCES usr (id);
