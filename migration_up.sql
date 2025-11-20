
-- DROP TABLE IF EXISTS resources_skills;
-- DROP TABLE IF EXISTS resources;
-- DROP TABLE IF EXISTS themes;
-- DROP TABLE IF EXISTS skills;

-- DROP TYPE IF EXISTS resource_type;

CREATE TYPE resource_type AS ENUM ('guide', 'video', 'exercice', 'projet');

CREATE TABLE themes(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description VARCHAR(250),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE skills(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE resources (
    id SERIAL PRIMARY KEY,
    type resource_type NOT NULL,
    title TEXT NOT NULL,
    description TEXT,
    url TEXT NOT NULL,
    is_ada BOOLEAN DEFAULT FALSE,
    theme_id INTEGER REFERENCES themes(id),
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE resources_skills (
  resource_id INTEGER REFERENCES resources(id) ON DELETE CASCADE,
  skill_id INTEGER REFERENCES skills(id) ON DELETE CASCADE,
  PRIMARY KEY (resource_id, skill_id)
);