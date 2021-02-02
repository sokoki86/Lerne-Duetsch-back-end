BEGIN;

TRUNCATE
  "word",
  "language",
  "user";

INSERT INTO "user" ("id", "username", "name", "password")
VALUES
  (
    1,
    'Grader',
    'Dunder Mifflin Admin',
    'password1!'
    
  );

INSERT INTO "language" ("id", "name", "user_id")
VALUES
  (1, 'German', 1);

INSERT INTO "word" ("id", "language_id", "original", "translation", "next")
VALUES
  (1, 1, 'Hochzeiten', 'weddings', 2),
  (2, 1, 'sind', 'are', 3),
  (3, 1, 'Grundsätzlich', 'Basically', 4),
  (4, 1, 'Beerdigungen', 'Funerals', 5),
  (5, 1, 'mit', 'with', 6),
  (6, 1, 'Kuchen', 'cake', 7),
  (7, 1, 'herzlich willkommen', 'welcome', 8),
  (8, 1, 'zu', 'to', 9),
  (9, 1, 'das', 'the', 10),
  (10, 1, 'Verein', 'club', null);

UPDATE "language" SET head = 1 WHERE id = 1;

-- because we explicitly set the id fields
-- update the sequencer for future automatic id setting
SELECT setval('word_id_seq', (SELECT MAX(id) from "word"));
SELECT setval('language_id_seq', (SELECT MAX(id) from "language"));
SELECT setval('user_id_seq', (SELECT MAX(id) from "user"));

COMMIT;
