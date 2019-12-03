import pool from '../database';
import fs from 'fs-extra';
import cloudinary from 'cloudinary';

require('../cloudinary.config');

const ctrl = {};

ctrl.listAll = async(req, res) => {
    const data =  await pool.query('select * from tipos order by nombre asc');
    res.json(data);
};

ctrl.list = async(req, res) => {
    const { id } = req.params;
    const data =  await pool.query('select * from tipos where id = ?', [id]);
    res.json(data);
};

ctrl.add = async(req, res) => {
    const { nombre } = req.body;
    const result = await cloudinary.v2.uploader.upload(req.file.path);
    const newType = {
        nombre,
        imagen: result.secure_url,
        public_id: result.public_id
    };
    await pool.query('insert into tipos set ?', [newType]);
    await fs.unlink(req.file.path);
    res.send('Tipo agregado');
};

module.exports = ctrl;