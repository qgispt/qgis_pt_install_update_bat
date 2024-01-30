# Ficheiros batch para uma fácil e automática instalação e atualização do QGIS em Windows
[![en](https://img.shields.io/badge/lang-en-red.svg)](README.en.md)

Estes ficheiros batch (.bat) permitem uma fácil e automática instalação e atualização do QGIS em Windows, usando o instalador recomendado oficialmente [OSGeo4W](https://www.osgeo.org/projects/osgeo4w/).

**Execute-os regularmente para assegurar que tem sempre a versão mais atualizada do QGIS instalada no Windows.**

## Instalação e atualização do QGIS-LTR  (Long-Term Release)
**[qgis_ltr_install_update.bat](Batchfiles/qgis_ltr_install_update.bat)** - Ficheiro batch para instalar e atualizar a versão mais estável do QGIS-LTR (Long-Term Release).

## Instalação e atualização do QGIS
**[qgis_install_update.bat](Batchfiles/qgis_install_update.bat)** - Ficheiro batch para instalar e atualizar a versão estável do QGIS.

## Instalação e atualização de ambos QGIS-LTR e QGIS
**[qgis_both_install_update.bat](Batchfiles/qgis_both_install_update.bat)** - Ficheiro batch para instalar e atualizar ambas as versões estáveis do QGIS (QGIS-LTR e QGIS).
 
# Como usar

Para utilizar pela primeira vez o ficheiro batch deve seguir os seguintes passos:
1. Descarregar o ficheiro batch (.bat)
2. Mover o ficheiro batch da pasta das transferências (downloads) para uma pasta à sua escolha do disco local.
3. Criar um atalho para esse ficheiro batch no ambiente de trabalho do utilizador (desktop).
4. Fazer duplo clique no atalho para executar o ficheiro batch e instalar o QGIS.

**Deve fazer periodicamente duplo clique no atalho (semanalmente, por exemplo), de modo a manter o QGIS sempre atualizado.**

Quando executa o ficheiro batch, ele verifica se existem atualizações disponíveis e, nesse caso, executa a atualização e substituição apenas dos componentes necessários do QGIS.
