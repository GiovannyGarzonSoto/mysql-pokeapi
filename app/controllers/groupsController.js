import pool from '../database';

const ctrl = {};

ctrl.listAll = async(req, res) => {
    const result = await pool.query('select * from grupos order by nombre asc');
    res.json(result);
};

ctrl.list = async(req, res) => {
    const result = await pool.query('select * from grupos where id = ? limit 1', [req.params.id]);
    res.json(result);
};

ctrl.add = async(req, res) => {
    const result = await pool.query('insert into grupos set ?', [req.body.nombre]);
    res.json(result);
};

module.exports = ctrl;