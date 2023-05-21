/*
  Warnings:

  - The primary key for the `filme` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `anoLAncamento` on the `filme` table. All the data in the column will be lost.
  - You are about to drop the column `idfilme` on the `filme` table. All the data in the column will be lost.
  - You are about to drop the column `idgenero` on the `filme` table. All the data in the column will be lost.
  - You are about to drop the column `nomeBR` on the `filme` table. All the data in the column will be lost.
  - You are about to drop the column `nomeEN` on the `filme` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `genero` table. All the data in the column will be lost.
  - You are about to drop the column `nome` on the `sala` table. All the data in the column will be lost.
  - You are about to drop the `filme_exibido` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `funcionarios` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `horario_trabalho_funcionario` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `IDgenero` to the `Filme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `NomeBR` to the `Filme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `NomeEN` to the `Filme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `anoLancamento` to the `Filme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `idFilme` to the `Filme` table without a default value. This is not possible if the table is not empty.
  - Added the required column `genero` to the `Genero` table without a default value. This is not possible if the table is not empty.
  - Added the required column `IDcinema` to the `Sala` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nomeSala` to the `Sala` table without a default value. This is not possible if the table is not empty.
  - Added the required column `suporta3D` to the `Sala` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `filme` DROP FOREIGN KEY `filme_idgenero_fkey`;

-- AlterTable
ALTER TABLE `filme` DROP PRIMARY KEY,
    DROP COLUMN `anoLAncamento`,
    DROP COLUMN `idfilme`,
    DROP COLUMN `idgenero`,
    DROP COLUMN `nomeBR`,
    DROP COLUMN `nomeEN`,
    ADD COLUMN `IDgenero` INTEGER NOT NULL,
    ADD COLUMN `NomeBR` VARCHAR(191) NOT NULL,
    ADD COLUMN `NomeEN` VARCHAR(191) NOT NULL,
    ADD COLUMN `anoLancamento` INTEGER NOT NULL,
    ADD COLUMN `idFilme` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`idFilme`);

-- AlterTable
ALTER TABLE `genero` DROP COLUMN `nome`,
    ADD COLUMN `genero` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `sala` DROP COLUMN `nome`,
    ADD COLUMN `IDcinema` INTEGER NOT NULL,
    ADD COLUMN `nomeSala` VARCHAR(191) NOT NULL,
    ADD COLUMN `suporta3D` BOOLEAN NOT NULL;

-- DropTable
DROP TABLE `filme_exibido`;

-- DropTable
DROP TABLE `funcionarios`;

-- DropTable
DROP TABLE `horario_trabalho_funcionario`;

-- CreateTable
CREATE TABLE `Funcionario` (
    `idFuncionario` INTEGER NOT NULL AUTO_INCREMENT,
    `nome` VARCHAR(191) NOT NULL,
    `carteiraDeTrabalho` INTEGER NOT NULL,
    `dataContratacao` DATETIME(3) NOT NULL,
    `salario` DOUBLE NOT NULL,

    PRIMARY KEY (`idFuncionario`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Cinema` (
    `idCinema` INTEGER NOT NULL AUTO_INCREMENT,
    `nomeCinema` VARCHAR(191) NOT NULL,
    `enderecoCinema` VARCHAR(191) NOT NULL,
    `contatoCinema` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`idCinema`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Ingresso` (
    `idIngresso` INTEGER NOT NULL AUTO_INCREMENT,
    `data` DATETIME(3) NOT NULL,
    `valor` DOUBLE NOT NULL,
    `poltrona` INTEGER NOT NULL,
    `sala_idSala` INTEGER NOT NULL,
    `IDfuncionario` INTEGER NOT NULL,
    `IDsessao` INTEGER NOT NULL,

    PRIMARY KEY (`idIngresso`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Sessao` (
    `idSessao` INTEGER NOT NULL AUTO_INCREMENT,
    `inicio` DATETIME(3) NOT NULL,
    `fim` DATETIME(3) NOT NULL,
    `legendado` VARCHAR(191) NOT NULL,
    `IDsala` INTEGER NOT NULL,
    `IDfilme` INTEGER NOT NULL,
    `IDhorario` INTEGER NOT NULL,

    PRIMARY KEY (`idSessao`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Filme` ADD CONSTRAINT `Filme_IDgenero_fkey` FOREIGN KEY (`IDgenero`) REFERENCES `Genero`(`idGenero`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sala` ADD CONSTRAINT `Sala_IDcinema_fkey` FOREIGN KEY (`IDcinema`) REFERENCES `Cinema`(`idCinema`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ingresso` ADD CONSTRAINT `Ingresso_IDfuncionario_fkey` FOREIGN KEY (`IDfuncionario`) REFERENCES `Funcionario`(`idFuncionario`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Ingresso` ADD CONSTRAINT `Ingresso_IDsessao_fkey` FOREIGN KEY (`IDsessao`) REFERENCES `Sessao`(`idSessao`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sessao` ADD CONSTRAINT `Sessao_IDsala_fkey` FOREIGN KEY (`IDsala`) REFERENCES `Sala`(`idSala`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sessao` ADD CONSTRAINT `Sessao_IDfilme_fkey` FOREIGN KEY (`IDfilme`) REFERENCES `Filme`(`idFilme`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Sessao` ADD CONSTRAINT `Sessao_IDhorario_fkey` FOREIGN KEY (`IDhorario`) REFERENCES `Horario`(`idHorario`) ON DELETE RESTRICT ON UPDATE CASCADE;
