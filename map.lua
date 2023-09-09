MAP_WIDTH = 3920 -- Largura do mapa
MAP_HEIGHT = 3500 -- Altura do mapa
MAP_START_X = 0 -- Largura máxima para a câmera e o personagem alcançar. < 0 permite ir mais para a esquerda.
MAP_START_Y = 0 -- Altura máxima para a câmera e o personagem alcançar. < 0 permite ir mais para cima.

function initMap()
    background = love.graphics.newImage("assets/images/bg_lowq.png")
end

function drawMap()
    love.graphics.draw(background, 0, 0)
end
