require "player"
require "map"
require "object"

function love.load()
    -- Funções de inicialização do personagem do mapa e dos objetos
    initMap()
    initObject()
    initPlayer()
end

function love.update(dt)
    -- Funções de atualização do personagem
    updatePlayer(dt)
end

function love.draw()
    -- Definir câmera
    love.graphics.push()
    love.graphics.translate(-camera.x, -camera.y)

    -- Funções de desenho do personagem, do mapa e de objetos

    drawMap()
    drawObject()
    drawPlayer()

    -- Restaurar câmera
    love.graphics.pop()
end