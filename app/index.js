if(process.env.NODE_ENV === 'development'){
    require('dotenv').config();
}
import express from 'express';
import morgan from 'morgan';
import multer from 'multer';
import path from 'path';
import cors from 'cors';

//initializations
const app = express();

//config
app.set('port', process.env.PORT || 3000);

//middlewares
app.use(cors())
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());
const storage = multer.diskStorage({
    destination: path.join(__dirname, '../public/uploads'),
    filename(req, file, callback) {
        callback(null, new Date().getTime()+path.extname(file.originalname));
    }
});
app.use(multer({storage}).single('image'));

//routes
app.use(require('./routes/indexRoutes'));

//static files
app.use(express.static(path.join(__dirname, '../public')));

//start server
app.listen(app.get('port'), () => {
    console.log(`Servidor corriendo en el puerto ${app.get('port')}`);
});
