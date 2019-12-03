import pool from '../database';

const ctrl = {};

ctrl.listAll = async(req, res) => {
    const data = await pool.query('select m.id,m.nombre,t.nombre as tipo,c.nombre as categoria,m.descripcion,m.potencia,m.presicion from movimientos m,tipos t,clases c where m.id_tipo=t.id and m.id_clase=c.id order by m.nombre asc');
    res.json(data);
};

ctrl.list = async(req, res) => {
    const data = await pool.query('select m.id,m.nombre,t.nombre as tipo,c.nombre as categoria,m.descripcion,m.potencia,m.presicion from movimientos m,tipos t,clases c where m.id_tipo=t.id and m.id_clase=c.id and m.id = ? limit 1', [req.params.id]);
    res.json(data);
};

ctrl.add = async(req, res) => {
    const { nombre, tipo, categoria, descripcion, potencia, precision } = req.body;
    const newMove = {
        id_tipo: tipo,
        id_clase: categoria,
        nombre,
        descripcion,
        potencia,
        presicion: precision
    }
    await pool.query('insert into movimientos set ?', [newMove]);
    res.send('movimiento agregado');
};

ctrl.update = async(req, res) => {
    const { nombre, tipo, categoria, descripcion, potencia, precision } = req.body;
    const updateMove = {
        id_tipo: tipo,
        id_clase: categoria,
        nombre,
        descripcion,
        potencia, 
        presicion: precision
    }
    await pool.query('update movimientos set ? where id = ?', [updateMove, req.params.id]);
    res.send('movimiento actualizado');
};

ctrl.remove = async(req, res) => {
    await pool.query('delete from movimientos where id = ?', [req.params.id]);
    res.send('movimiento eliminado');
}

module.exports = ctrl;