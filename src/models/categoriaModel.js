const pool = require("../config/database");

const getCategorias = async (nome) => {
    if (nome) {
    result = await pool.query(
            "SELECT * FROM categorias WHERE nome ILIKE $1",
            [`%${nome}%`]
        );
        return result.rows;
    }
    else {
    result = await pool.query("SELECT * FROM categorias");
    }
    return result.rows;
};

const getCategoriaById = async (id) => {
    const result = await pool.query("SELECT * FROM categorias WHERE id = $1", [id]);
    return result.rows[0];
};

const createCategoria = async (nome) => {
    const result = await pool.query(
        "INSERT INTO categorias (nome) VALUES ($1) RETURNING *",
        [nome]
    );
    return result.rows[0];
}

const updateCategoria = async (id, nome) => {
    const result = await pool.query(
        "UPDATE categorias SET nome = $1 WHERE id = $2 RETURNING *", 
        [nome, id] 
    );
    return result.rows[0];
};

const deleteCategoria = async (id) => { 
    await pool.query("DELETE FROM categorias WHERE id = $1", [id]);
    return { message: "Categoria deletada com sucesso." };
}
module.exports = { getCategorias, getCategoriaById, createCategoria, updateCategoria, deleteCategoria };