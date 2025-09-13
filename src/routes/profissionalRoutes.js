const express = require("express");
const router = express.Router();
const profissionaisController = require("../controllers/profissionalController.js");
const upload = require("../config/upload.js");


router.get("/", profissionaisController.getProfissionais);
router.get("/:id", profissionaisController.getProfissionalById);
router.post("/", upload.single("foto"), profissionaisController.createProfissional);
router.put("/:id", upload.single("foto"), profissionaisController.updateProfissional);
router.delete("/:id", profissionaisController.deleteProfissional);

module.exports = router;