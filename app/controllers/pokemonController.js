import pool from '../database';
import cloudinary from 'cloudinary';
import fs from 'fs-extra';

require('../cloudinary.config');

const ctrl = {};

ctrl.listAll = async(req, res) => {
    const data = await pool.query('select p .id,p.numero, p.nombre, t.nombre as tipo, t2.nombre as tipo2,g.nombre as grupo,g2.nombre as grupo2, h.nombre as habilidad,h2.nombre as habilidad2,h3.nombre as habilidad3, p.descripcion, p.imagen, p.peso, p.altura, p.hp, p.ata, p.def, p.ataesp, p.defesp, p.vel from pokemon p, tipos t, tipos t2, habilidades h, habilidades h2, habilidades h3, grupos g, grupos g2 where h.id=p.id_habilidad and h2.id=p.id_habilidad2 and h3.id=p.id_habilidad3 and t.id= p.id_tipo and t2.id=p.id_tipo2 and g.id=p.id_grupo and g2.id=p.id_grupo2 order by p.numero asc');
    res.json(data);
};

ctrl.list = async(req, res) => {
    const data = await pool.query('select p.id,p.numero, p.nombre, t.nombre as tipo,t2.nombre as tipo2,g.nombre as grupo, g2.nombre as grupo2, h.nombre as habilidad, h2.nombre as habilidad2, h3.nombre as habilidad3, p.descripcion, p.imagen, p.peso, p.altura, p.hp, p.ata, p.def, p.ataesp, p.defesp, p.vel from pokemon p, tipos t, tipos t2, habilidades h, habilidades h2, habilidades h3, grupos g, grupos g2 where h.id=p.id_habilidad and h2.id=p.id_habilidad2 and h3.id=p.id_habilidad3 and t.id= p.id_tipo and t2.id=p.id_tipo2 g.id=p.id_grupo and g2.id=p.id_grupo2 and p.id = ? limit 3', [req.params.id]);
    res.json(data);
};

ctrl.add = async(req, res) => {
    const result = await cloudinary.v2.uploader.upload(req.file.path);
    console.log(req.file);
    console.log(req.body);
    console.log(result);
    // const { habilidad, habilidad2, habilidad3, tipo, tipo2, grupo, grupo2, numero, nombre, descripcion, peso, altura, hp, ata, def, ataesp, defesp, vel } = req.body;
    // const newPokemon = {
    //     id_habilidad: habilidad, id_habilidad2: habilidad2, id_habilidad3: habilidad3,
    //     id_tipo: tipo, id_tipo2: tipo2,
    //     id_grupo: grupo, id_grupo: grupo2,
    //     numero,
    //     nombre,
    //     descripcion,
    //     imagen: result.secure_url,
    //     peso,
    //     altura,
    //     hp,
    //     ata, def,
    //     ataesp, defesp,
    //     vel,
    //     public_id: result.public_id
    // };
    // await pool.query('insert into pokemon set ?', [newPokemon]);
    // await fs.unlink(req.file.path);
    // res.send('pokemon agregado');
};

ctrl.update = async(req, res) => {
    
}

ctrl.remove = async(req, res) => {
    await pool.query('delete from pokemon where id = ?', [req.params.id]);

    // cloudinary.v2.uploader.destroy(req.params.public_id, (error,result) => {
    //     console.log(result, error) 
    // });

    res.send('pokemon eliminado');
}

module.exports = ctrl;