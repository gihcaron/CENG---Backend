const pool = require("../config/database");

const getProfissionais = async (nome) => {
    let result;
    if (nome) {
        result = await pool.query(
        `SELECT profissionais.*, categorias.nome AS categoria_nome
        FROM profissionais
        LEFT JOIN categorias ON profissionais.categoria_id = categorias.id
        WHERE profissionais.nome ILIKE $1`,
        [`%${nome}%`]);
        return result.rows;
    } else {
       result = await pool.query(
            `SELECT profissionais.*, categorias.nome AS categoria_nome
            FROM profissionais
            LEFT JOIN categorias ON profissionais.categoria_id = categorias.id`
       )
    }

    return result.rows;
};

const getProfissionalById = async (id) => {
    const result = await pool.query(
        "SELECT * FROM profissionais WHERE id = $1",
        [id]
    );
    return result.rows[0];
};

const createProfissional = async (nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id) => {
    try{
        const result = await pool.query(
        "INSERT INTO profissionais (nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *",
        [nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id]
        );
        return result.rows[0];
        } catch (error) {
        console.error("Erro ao criar profissional:", error);
        throw error; 
    }
    };


const updateProfissional = async (id, dados) => {
    const { nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id } = dados;
    const result = await pool.query(
        `UPDATE profissionais SET
            nome = $1,
            idade = $2,
            area_atuacao = $3,
            biografia = $4,
            redes_sociais = $5,
            foto = $6,
            pais = $7,
            categoria_id = $8
        WHERE id = $9
        RETURNING *`,
        [nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id, id]
    );
    return result.rows[0];
};


const deleteProfissional = async (id) => {
    await pool.query("DELETE FROM profissionais WHERE id = $1", [id]);
    return { message: "Profissional deletado com sucesso." };
};

module.exports = {getProfissionais, getProfissionalById, createProfissional, updateProfissional,deleteProfissional
};