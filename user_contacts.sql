CREATE TABLE user_contacts (
  id INT UNSIGNED PRIMARY KEY,
  user_id INT UNSIGNED,
  contact_type VARCHAR(50),
  contact_info VARCHAR(100)
);

INSERT INTO user_contacts (id, user_id, contact_type, contact_info) VALUES
(1, 1, 'Email', 'john@example.com'),
(2, 1, 'Phone', '1234567890'),
(3, 2, 'Email', 'jane@example.com'),
(4, 3, 'Email', 'sam@example.com'),
(5, 3, 'Phone', '5555555555');

-- Natural Join between users and user_contacts
SELECT users.name, user_contacts.contact_type, user_contacts.contact_info
FROM users
NATURAL JOIN user_contacts;

-- Self Join to find users who share the same gender
SELECT u1.name AS user1_name, u2.name AS user2_name
FROM users u1
INNER JOIN users u2 ON u1.gender = u2.gender AND u1.id < u2.id;

-- Non-Equi Join to find users with a birthdate greater than another user's birthdate
SELECT u1.name AS older_user, u2.name AS younger_user
FROM users u1
INNER JOIN users u2 ON u1.dob > u2.dob;
