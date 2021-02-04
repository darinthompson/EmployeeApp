const express = require('express');
const createConnection = require('./config/db');
const app = express();


app.use(express.json({extended: false}));

app.get('/', (req, res) => res.send('Application running'));

app.use('/user/create', require('./routes/user'));





const PORT = process.env.PORT || 3000;

app.listen(PORT, () => console.log(`Server started on port ${PORT}`));