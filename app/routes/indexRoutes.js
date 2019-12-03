import express from 'express';
import abilitiesRoutes from './abilitiesRoutes';
import categoriesRoutes from './categoriesRoutes';
import groupsRoutes from './groupsRoutes';
import movesRoutes from './movesRoutes';
import pokemonRoutes from './pokemonRoutes';
import typesRoutes from './typesRoutes';

const app = express();

app.use('/api/abilities', abilitiesRoutes);
app.use('/api/categories', categoriesRoutes);
app.use('/api/groups', groupsRoutes);
app.use('/api/moves', movesRoutes);
app.use('/api/pokemon', pokemonRoutes);
app.use('/api/types', typesRoutes);

module.exports = app;