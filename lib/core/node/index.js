const express = require('express');
const app = express();
require('./db/db_conection');



const userRouter = require('./routers/user_router');
const musicRouter = require('./routers/music_router');


app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.get('/', (req, res) => {

    res.json({
        message: "welcome engApp's rest api",
    });
});

app.use('/user',userRouter);
app.use('/musics', musicRouter);

app.listen(3000);