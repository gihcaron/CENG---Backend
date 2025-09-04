const express = require("express");
const router = express.Router();
const profissionaisController = require("../controllers/profissionalController.js");

router.get("/", profissionaisController.getProfissionais);
router.get("/:id", profissionaisController.getProfissionalById);
router.post("/", profissionaisController.createProfissional);
router.put("/:id", profissionaisController.updateProfissional);
router.delete("/:id", profissionaisController.deleteProfissional);

module.exports = router;