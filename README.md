# Inventário De Arquivos

Inventário de arquivos em uma determinada pastas, icluindo as suas subpastas

## Motivação

Aqui no departamento temos uma pasta compartilha e pretendemos migrar boa parte do seu conteúdo para um sistema de acervo, como CKan. Para facilitarmos essa migração precisamos entender exatamente o que guardamos nessa pasta e obter informações sobre:

* Quantidade de arquivos e diretórios
* Formatos de arquivos
* Proporção de formatos de arquivos
* Datas de criação, acesso, alteração
* Proprietários
* Conteúdo estimado dos arquivos, tamanho, quantidade de linhas, planilhas, células, colunas, 
* Comparar e agrupar arquivos similares

## Metodologia

Inspirados neste [post sobre análise de sistema de arqvuios e estrutura de diretórios com Python](https://janakiev.com/blog/python-filesystem-analysis/) e neste [post sobre como obter informações sobre arquivos em Python](http://effbot.org/zone/python-fileinfo.htm) vamos criar notebooks com sequências comandos Python afim de gerar um fluxo descritivo da real situação da nossa pasta compartilhada.
Depois dos primeiros diagnósticos podemos pensar em um script para automatizar tarefas e até migração para o CKan.

## Dados sensíveis

O local da pasta não pode ser compartilhado por diretrizes de segurança e ficará em um arquivo ignorado dos comits, porém que será importado para os notebooks e scripts.
Portanto, para utilizar estes notebooks adicione o arquivo `env.py` ao seu projeto

## Folder Stats

[Folderstats](https://github.com/njanakiev/folderstats) é uma lib em Python que pode auxiliar a criar um csv com toda a estrutura de uma pasta e a partir dela fazer análises. Para isso usamos o comando:

`folderstats -o csv/nas_geoinfo.csv -c md5 -a -i -p -v <folderpath>`

## Utilizando o PowerShell

Acabamos tendo contato com o PowerShell que se mostrou bastante eficaz para tarefas como essa que nos propomos. Criamos o script `inventario_de_arquivos.ps1` para executar uma tarefa similar, com resultados bons. 
Para executar o script é necessário o PowerShell, assim como um arquivo `env.ps1` que deverá contem uma variável com o alvo (target) que será analisado
