import express from 'express';
import move from '../controllers/movesController';

const router = express.Router();

router.get('/', move.listAll);

router.get('/:id', move.list);

router.post('/', move.add);

router.put('/:id', move.update);

router.delete('/:id', move.remove);

module.exports = router;