const profissionalModel = require('../models/profissionalModel');

const getProfissionais = async (req, res) => {
    try {
        const { nome } = req.query;
        const profissionais = await profissionalModel.getProfissionais(nome);
        res.json(profissionais);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Erro ao buscar profissionais." });
    }
};

const getProfissionalById = async (req, res) => {
    try {
        const profissional = await profissionalModel.getProfissionalById(req.params.id);
        if (!profissional) {
            return res.status(404).json({ message: "Profissional não encontrado." });
        }
        res.json(profissional);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Erro ao buscar profissional." });
    }
};

const createProfissional = async (req, res) => {
    try {
        const { nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id } = req.body;
        const newProfissional = await profissionalModel.createProfissional(
            nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id
        );
        res.status(201).json(newProfissional);
    } catch (error) {
        console.log(error);
        if (error.code === "23505") {
            return res.status(400).json({ message: "Profissional já cadastrado." });
        }
        res.status(500).json({ message: "Erro ao criar profissional." });
    }
};
const updateProfissional = async (req, res) => {
    try {
const { nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id } = req.body;
const updatedProfissional = await profissionalModel.updateProfissional(req.params.id, { nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id });
        if (!updatedProfissional) {
            return res.status(404).json({ message: "Profissional não encontrado." });
        }
        res.json(updatedProfissional);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Erro ao atualizar profissional." });
    }
};
const deleteProfissional = async (req, res) => {
    try {
        const message = await profissionalModel.deleteProfissional(req.params.id);
        res.json(message);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Erro ao deletar profissional." });
    }
};

module.exports = {getProfissionais,getProfissionalById,createProfissional,updateProfissional,deleteProfissional
};