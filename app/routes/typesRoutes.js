import { Router } from 'express';
import type from '../controllers/typesController';

const router = Router();

router.get('/', type.listAll);

router.get('/:id', type.list);

router.post('/', type.add);

module.exports = router;