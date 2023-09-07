-- Inicializar objetos no mapa
function initObject()
    objects = {
        {
            image = love.graphics.newImage("assets/objects/rock.png"),
            x = 940,
            y = 350
        },
        {
            image = love.graphics.newImage("assets/objects/rock.png"),
            x = 800,
            y = 450
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
    nextX = character.x + dx * dt
    nextY = character.y + dy * dt

    local collisionDetected = false

    for _, obj in ipairs(objects) do
        if checkCollision(nextX, nextY, obj.x, obj.y, obj.image:getWidth(), obj.image:getHeight()) then
            collisionDetected = true
            break -- Sai do loop assim que uma colisão for encontrada
        end
    end
    
    -- Velocidade com base na colisão
    if collisionDetected then
        character.speed = 0
        -- Gambiarra
        character.x = nextX - 3
        character.y = nextY - 3
    end

    -- Atualiza a posição do personagem se não estiver em uma colisão
    if not collisionDetected then
        character.x = nextX
        character.y = nextY
        character.speed = 200
    end

end
