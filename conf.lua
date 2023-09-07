function love.conf(t)
    t.window.title = "My Isometric Game"   -- Título do jogo
    t.version = "11.4"            -- Versão do LÖVE compatível
    t.window.width = 800         -- Largura da janela do jogo
    t.window.height = 600        -- Altura da janela do jogo
    t.window.resizable = true   -- A janela pode ser redimensionada?
    t.modules.audio = true       -- Habilitar o módulo de áudio
    t.modules.keyboard = true    -- Habilitar o módulo de teclado
    t.modules.mouse = true       -- Habilitar o módulo de mouse
    t.modules.physics = false    -- Desabilitar o módulo de física
end