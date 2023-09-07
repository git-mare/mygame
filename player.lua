characterFrames = {}
currentFrame = 1

width = love.graphics.getWidth()
height = love.graphics.getHeight()

dx, dy = 0, 0

camera = {
    x = 0,
    y = 0
}

character = {
    speed = 300,
    x = 600,
    y = 300,
    width = 80,
    height = 110
}

function initPlayer()
    frameChar()
end

function updatePlayer(dt)
    moveChar(dt)

    -- Câmera segue personagem
    camera.x = character.x - width / 2
    camera.y = character.y - height / 2

    -- Câmera nos limites do mapa
    camera.x = math.max(MAP_START_X, math.min(camera.x, MAP_WIDTH - width))
    camera.y = math.max(MAP_START_Y, math.min(camera.y, MAP_HEIGHT - height))

    -- Personagem nos limites do mapa
    character.x = math.max(MAP_START_X, math.min(character.x, MAP_WIDTH * width))
    character.y = math.max(MAP_START_Y, math.min(character.y, MAP_HEIGHT * height))

end

function drawPlayer()
    -- Personagem
    love.graphics.draw(characterFrames[currentFrame], character.x, character.y)
end

-- Movimento do personagem
function moveChar(dt)
    local dx, dy = 0, 0

    if love.keyboard.isDown("up") then
        dy = -character.speed
        currentFrame = 4 -- Mudar para o quadro de cima
    end
    if love.keyboard.isDown("down") then
        dy = character.speed
        currentFrame = 1 -- Mudar para o quadro de baixo
    end
    if love.keyboard.isDown("left") then
        dx = -character.speed
        currentFrame = 2 -- Mudar para o quadro da esquerda
    end
    if love.keyboard.isDown("right") then
        dx = character.speed
        currentFrame = 3 -- Mudar para o quadro da direita
    end

    -- Atualizar a posição do personagem com base na velocidade
    character.x = character.x + dx * dt
    character.y = character.y + dy * dt

    -- Verificar colisão do personagem com o objeto desenhado no mapa
    charCollision(dt)
end

-- Alterar frame do personagem
function frameChar()
    for i = 1, 4 do
        characterFrames[i] = love.graphics.newImage("assets/character/character_frame_" .. i .. ".png")
    end
end


