SELECT * FROM themes;
SELECT * FROM skills;
SELECT * FROM resources;
SELECT * FROM resources_skills;

-- Required queries
SELECT * FROM themes;
SELECT * FROM resources ORDER BY updated_at DESC;

-- BONUS 1 : Thèmes + nombre de ressources
SELECT themes.name,COUNT(resources.id) AS total_resources
FROM themes
LEFT JOIN resources ON themes.id = resources.theme_id
GROUP BY themes.name;

-- BONUS 2 : Ressources + liste des skills
SELECT
  resources.title,
  resources.url,
  STRING_AGG(skills.name, ', ') AS skills
FROM resources
LEFT JOIN resources_skills ON resources.id = resources_skills.resource_id
LEFT JOIN skills ON skills.id = resources_skills.skill_id
GROUP BY resources.title, resources.url;

-- BONUS 3 : 5 ressources les plus récentes
SELECT
  resources.title,
  resources.created_at,
  themes.name AS theme
FROM resources
JOIN themes ON themes.id = resources.theme_id
ORDER BY resources.created_at DESC
LIMIT 5;

-- BONUS 4 : Compétences sans ressource
SELECT
  skills.name
FROM skills
LEFT JOIN resources_skills ON skills.id = resources_skills.skill_id
WHERE resources_skills.resource_id IS NULL;