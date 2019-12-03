import { Router } from 'express';
import category from '../controllers/categoriesController';

const router = Router();

router.get('/', category.listAll);

router.get('/:id', category.list);

router.post('/', category.add);

module.exports = router;