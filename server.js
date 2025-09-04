require("dotenv").config();
const express = require("express");
const cors = require("cors");
const categoriaRoutes= require("./src/routes/categoriaRoutes.js");
const profissionalRoutes = require("./src/routes/profissionalRoutes.js");

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/categorias", categoriaRoutes);
app.use("/api/profissionais", profissionalRoutes);


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
