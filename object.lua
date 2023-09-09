-- Variáveis para rastrear a posição anterior do personagem
local previousX, previousY

-- Inicializar objetos no mapa
function initObject()
    objects = {
        -- {
        --     image = love.graphics.newImage("assets/objects/rock.png"),
        --     x = 940,
        --     y = 350
        -- },
        -- {
        --     image = love.graphics.newImage("assets/objects/rock.png"),
        --     x = 800,
        --     y = 450
        -- },
        {
            image = love.graphics.newImage("assets/objects/wall/wall_622x22.png"),
            x = 1622,
            y = 504
        }
    }
end

-- Desenha os objetos no mapa
function drawObject()
    for _, obj in ipairs(objects) do
        love.graphics.draw(obj.image, obj.x, obj.y)
    end
end

-- Colisão de objeto
function checkCollision(characterX, characterY, objX, objY, objWidth, objHeight)
    -- Verifica se o personagem colide com o objeto especificado
    return characterX + character.width > objX and
           characterX < objX + objWidth and
           characterY + character.height > objY and
           characterY < objY + objHeight
end

-- Atualizar status de movimento do personagem após colidir/deixar de colidir com um objeto
function charCollision(dt)
    local nextX = character.x + dx * dt
    local nextY = character.y + dy * dt

    -- Verifica se há colisão com qualquer objeto
    local collisionDetected = false

    for _, obj in ipairs(objects) do
        if checkCollision(nextX, nextY, obj.x, obj.y, obj.image:getWidth(), obj.image:getHeight()) then
            collisionDetected = true
            break
        end
    end

    -- Define a velocidade com base na colisão
    if collisionDetected then
        character.speed = 0
        -- Reverte a posição do personagem para a posição anterior
        character.x = previousX
        character.y = previousY
    else
        character.speed = 200
        -- Atualiza a posição anterior do personagem
        previousX = character.x
        previousY = character.y
    end
end
