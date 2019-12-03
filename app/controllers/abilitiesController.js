import pool from '../database';

const ctrl = {};

ctrl.listAll = async(req, res) => {
    const data = await pool.query('select * from habilidades order by nombre asc');
    res.json(data);
};

ctrl.list = async(req, res) => {
    const data = await pool.query('select * from habilidades where id = ? limit 1', [req.params.id]);
    res.json(data);
};

ctrl.add = async(req, res) => {
    const { nombre, descripcion } = req.body;
    const newAbility = {
        nombre,
        descripcion
    };
    await pool.query('insert into habilidades set ?', [newAbility]);
    res.send('Habilidad agregada');
};

ctrl.update = async(req, res) => {
    const { nombre, descripcion } = req.body;
    const updateAbility = {
        nombre,
        descripcion
    };
    await pool.query('update habilidades set ? where id = ?', [updateAbility, req.params.id]);
    res.send('Habilidad actualizada');
};

ctrl.remove = async(req, res) => {
    await pool.query('delete from habilidades where id = ?', [req.params.id]);
    res.send('Habilidad eliminada');
};

module.exports = ctrl;