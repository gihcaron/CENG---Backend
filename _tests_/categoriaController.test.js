// Categorias
const categoriaController = require("../src/controllers/categoriaController");
const categoriaModel = require("../src/models/categoriaModel");


// Mock da pool do Model

jest.mock("../src/models/categoriaModel");

describe("Categoria Controller", () => {
   let req, res;

    beforeEach(() => {
        req = {query: {}};
        res = {
            json: jest.fn(),
            status: jest.fn().mockReturnThis(),
        };
    });

    //  Teste para a lógica do getCategorias

    test("deve retornar a lista de categorias", async () => {
        const categoriasFaake = [
            // Dados para simular o retorno do banco
            {id: 1, nome: "Formula E", descricao: "Corrida de carros elétricos", ano_inicio: 2014},
            {id: 2, nome: "Formula 1", descricao: "Corrida de carros a combustão", ano_inicio: 1950},
            {id: 3, nome: "IndyCar", descricao: "Corrida de carros de fórmula", ano_inicio: 1911},
        ];

        categoriaModel.getCategorias.mockResolvedValue(categoriasFaake);
        await categoriaController.getCategorias(req, res);

        expect(categoriaModel.getCategorias).toHaveBeenCalled();
        expect(res.json).toHaveBeenCalledWith(categoriasFaake);
    });

    // Teste para erro no getCategorias

    test("deve tratar erro ao buscar categorias", async () => {
        categoriaModel.getCategorias.mockRejectedValue(new Error("DB error"));

        await categoriaController.getCategorias(req, res);

        expect(res.status).toHaveBeenCalledWith(500);
        expect(res.json).toHaveBeenCalledWith({ message: "Erro ao buscar categorias." });
    });
});