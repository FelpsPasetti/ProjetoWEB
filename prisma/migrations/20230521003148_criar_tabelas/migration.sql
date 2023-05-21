-- CreateTable
CREATE TABLE `funcionarios` (
    `idFuncionario` INTEGER NOT NULL AUTO_INCREMENT,
    `Nome` VARCHAR(191) NOT NULL,
    `carteiraDeTrabalho` INTEGER NOT NULL,
    `dataContratacao` DATETIME(3) NOT NULL,

    UNIQUE INDEX `funcionarios_carteiraDeTrabalho_key`(`carteiraDeTrabalho`),
    PRIMARY KEY (`idFuncionario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `horario` (
    `idHorario` INTEGER NOT NULL AUTO_INCREMENT,
    `horario` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idHorario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sala` (
    `idSala` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `capacidade` INTEGER NOT NULL,

    PRIMARY KEY (`idSala`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `filme_exibido` (
    `filme_idFilme` INTEGER NOT NULL,
    `sala_idsala` INTEGER NOT NULL,
    `horario_idhorario` INTEGER NOT NULL,

    PRIMARY KEY (`filme_idFilme`, `horario_idhorario`, `sala_idsala`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `filme` (
    `idfilme` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeBR` VARCHAR(191) NOT NULL,
    `nomeEN` VARCHAR(191) NOT NULL,
    `anoLAncamento` DATETIME(3) NOT NULL,
    `sinopse` VARCHAR(191) NOT NULL,
    `idgenero` INTEGER NOT NULL,

    PRIMARY KEY (`idfilme`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `genero` (
    `idGenero` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idGenero`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `horario_trabalho_funcionario` (
    `horario_idhorario` INTEGER NOT NULL,
    `funcionario_idfuncionario` INTEGER NOT NULL,

    PRIMARY KEY (`funcionario_idfuncionario`, `horario_idhorario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `filme` ADD CONSTRAINT `filme_idgenero_fkey` FOREIGN KEY (`idgenero`) REFERENCES `genero`(`idGenero`) ON DELETE RESTRICT ON UPDATE CASCADE;
