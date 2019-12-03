import express from 'express';
import pokemon from '../controllers/pokemonController';
import multer from 'multer';
import path from 'path';

const upload = multer({ dest: path.join(__dirname, '../public/uploads')})

const router = express.Router();

router.get('/', pokemon.listAll);

router.get('/:id', pokemon.list);

let type = upload.single('image');

router.post('/', type, pokemon.add);

router.put('/:id', pokemon.update);

router.delete('/:id', pokemon.remove);

module.exports = router;