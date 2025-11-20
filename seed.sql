
INSERT INTO themes (id, name) VALUES
(1, 'Frontend'),
(2, 'Backend'),
(3, 'Base de données'),
(4, 'DevOps');


INSERT INTO skills (id, name) VALUES
(1, 'JavaScript'),
(2, 'React'),
(3, 'SQL'),
(4, 'PostgreSQL'),
(5, 'Node.js');


INSERT INTO resources (id, type, title, description, url, is_ada, theme_id) VALUES
(1, 'guide', 'Introduction à React', 'Guide officiel React', 'https://react.dev', true, 1),
(2, 'video', 'SQL pour débutants', 'Cours SQL complet', 'https://example.com/sql', false, 3),
(3, 'exercice', 'Exercices JavaScript', 'Pratique JS', 'https://example.com/js', false, 1),
(4, 'projet', 'Créer une API en node', 'Projet node', 'https://example.com/node', false, 2);


INSERT INTO resources_skills (resource_id, skill_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 1),
(4, 1),
(4, 5);