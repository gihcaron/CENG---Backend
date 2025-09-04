const categoriaModel = require('../models/categoriaModel');

const getCategorias = async (req, res) => {
    try {
        const { nome } = req.query;
        const categorias = await categoriaModel.getCategorias(nome);
        res.json(categorias);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar categorias." });
    }
};

const getCategoriaById = async (req, res) => {
    try {
        const categoria = await categoriaModel.getCategoriaById(req.params.id);
        if (!categoria) {
            return res.status(404).json({ message: "categoria não encontrada." });
        }
        res.json(categoria);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar categoria." });
    }
};

const createCategoria = async (req, res) => {
    try {
        const { nome } = req.body;
        const newCategoria = await categoriaModel.createCategoria(nome);
        res.status(201).json(newCategoria);
    } catch (error) {
	 console.log(error);
        if (error.code === "23505") { 
            return res.status(400).json({ message: "categoria já cadastrado." });
        }
        res.status(500).json({ message: "Erro ao criar categoria." });
    }
};

const updateCategoria = async (req, res) => {
    try {
        const { nome } = req.body;
        const updateCategoria = await categoriaModel.updateCategoria(req.params.id, nome);
        if (!updateCategoria) {
            return res.status(404).json({ message: "categoria não encontrado." });
        }
        res.json(updateCategoria);
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar categoria." });
    }
}

const  deleteCategoria = async (req, res) => {
    try {
        const message = await categoriaModel. deleteCategoria(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar categoria." });
    }
};

module.exports = { getCategorias, getCategoriaById, createCategoria, updateCategoria,  deleteCategoria};