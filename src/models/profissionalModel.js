const pool = require("../config/database");

const getProfissionais = async (nome) => {
    let result;
    if (nome) {
        result = await pool.query(
            "SELECT * FROM profissionais WHERE nome ILIKE $1",
            [`%${nome}%`]
        );
    } else {
        result = await pool.query("SELECT * FROM profissionais");
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

const createProfissional = async (
    nome,
    idade,
    area_atuacao,
    biografia,
    redes_sociais,
    foto,
    pais,
    categoria_id
) => {
    const result = await pool.query(
        `INSERT INTO profissionais
        (nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id)
        VALUES ($1,$2,$3,$4,$5,$6,$7,$8) RETURNING *`,
        [nome, idade, area_atuacao, biografia, redes_sociais, foto, pais, categoria_id]
    );
    return result.rows[0];
};

const updateProfissional = async (id, nome) => {
    const result = await pool.query(
        "UPDATE profissionais SET nome = $1 WHERE id = $2 RETURNING *",
        [nome, id]
    );
    return result.rows[0];
};


const deleteProfissional = async (id) => {
    await pool.query("DELETE FROM profissionais WHERE id = $1", [id]);
    return { message: "Profissional deletado com sucesso." };
};

module.exports = {getProfissionais,getProfissionalById,createProfissional,updateProfissional,deleteProfissional
};