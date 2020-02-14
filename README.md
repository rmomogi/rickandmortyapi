# README
Desafio Técnico </br>
A proposta desse desafio e ser algo simples e rápido. Você não precisará se preocupar com banco de dados. O funcionamento dele também será bem simples, de modo que você possa focar no que mais importa para nós: qualidade de código.

O que você deve fazer</br>
A nossa proposta é que você faça uma API usando Ruby on Rails. Esta API não irá utilizar banco de dados e não deverá conter views. Ela deve ter apenas UM endpoint. Além disso, para montar a resposta deste endpoint, sua API deverá consumir a seguinte API externa: https://rickandmortyapi.com/documentation

A RickAndMortyAPI disponibiliza informações sobre os personagens, episódios, e outras informações referentes ao seriado Rick and Morty.

O endpoint que você deve disponibilizar na sua API deve ser um GET que recebe o id de um personagem e retorna A DATA em que aquele personagem foi ao ar pela primeira vez.

# Instalação
Antes é necessário seguir os seguintes passos:
* Instalar Redis para uso do sidekiq
    > OSX - brew install redis </br>
    > Linux - sudo apt-get install redis </br>
    > Windows (WSL) - sudo apt-get install redis </br>

* Instalar as gems
  > bundle </br>

* Executar o servidor
  > rails s

# API
Versão 1:
* Personagens: Consultar pelo ID e obter informações
  > /api/v1/characters/:id
