import { Router } from 'express';
import group from '../controllers/groupsController';

const router = Router();

router.get('/', group.listAll);

router.get('/:id', group.list);

router.post('/', group.add);

module.exports = router;