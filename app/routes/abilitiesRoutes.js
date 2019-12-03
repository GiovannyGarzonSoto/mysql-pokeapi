import express from 'express';
import ability from '../controllers/abilitiesController';

const router = express.Router();

router.get('/', ability.listAll);

router.get('/:id', ability.list);

router.post('/', ability.add);

router.put('/:id', ability.update);

router.delete('/:id', ability.remove);

module.exports = router;
