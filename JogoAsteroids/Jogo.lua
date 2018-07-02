local jogo={}

local asteroid = require("Asteroid")
local physics = require("physics")
local nave = require("NaveJogador")
--nave.criarNave()

local pontos = 0
asteroid.CriarAsteroid()

function jogo:acoes()

	local butaoEsquerdo = display.newImageRect( "besquerda.png",30,30 )
	butaoEsquerdo.x = 0
	butaoEsquerdo.y = 280

	local butaoDireito = display.newImageRect( "bdireito.png",30,30 )
	butaoDireito.x = 50
	butaoDireito.y = 280

	local butaoMover = display.newImageRect("bmover.png",30, 30)
	butaoMover.x = 480
	butaoMover.y = 220

	local butaoAtirar = display.newImageRect( "fogo.png",30, 30 )
	butaoAtirar.x = 480
	butaoAtirar.y = 280
	butaoAtirar.strokeWidth = 2
	butaoAtirar:setStrokeColor( 1, 1, 0 )

	function criarTiro(event)
		if event.phase == "began" then
			nave.atirar()
		end
	end

	function jogo:rotacionarParaDireita(event)
		nave.RotacionasrNaveParaDireita()
	end

	function jogo:rotacioParaEsquerda(event)
		nave.RotacionasrNaveParaEsquerda()
	end

	function moverNave(event)
		if event.phase == "began" then
			nave.MoverNaveJogador()
		elseif event.phase == "ended" then
			nave.PararNave()
		end
	end

	butaoMover:addEventListener("touch", moverNave)
	butaoAtirar:addEventListener("touch", criarTiro)
	butaoDireito:addEventListener("touch", jogo.rotacionarParaDireita)
	butaoEsquerdo:addEventListener("touch", jogo.rotacioParaEsquerda)
end

function jogo:gameOver()
	if nave.verificarVidas() then
		fimDeJogo = display.newText("GAME OVER!",250,150)
	end
end

function jogo:CalcularPontuacao()
	if nave.verificarVidas() ~= true then
		pontos = pontos - 10
	elseif nave.destruir == 1 then
		pontos = pontos + 15
	end
end

function jogo:MostrarPlacar()
	placar = display.newRoundedRect( 240, 150, 200, 150, 12 )
	placar.strokeWidth = 2
	placar:setFillColor(0)
end

function jogo:iniciarPartida()
	contorles = display.newImageRect("controles.png",190,120)
	contorles.x=240
	contorles.y=150
	novoJogo = display.newImageRect("newGame.png",70,33)
	novoJogo.x=190
	novoJogo.y=230
	sair = display.newImageRect("quitGame.png",70,30)
	sair.x=290
	sair.y=230
	novoJogo:addEventListener("touch", jogo.comecar)
	sair:addEventListener("touch", jogo.SairJogo)
end

function jogo:ReiniciarPartida()
	confim = display.newImageRect("confirm.png",70,30)
	confim.x=190
	confim.y=230
	quit=display.newImageRect("quitGame.png",70,30)
	quit.x=290
	quit.y=230
end

function jogo:SairJogo(event)
	os.exit()
end

function jogo:comecar(event)
	display.remove(contorles)
	display.remove(novoJogo)
	display.remove(sair)
	jogo.iniciarJogo()
end

function jogo:iniciarJogo()
	nave.criarNave()
	jogo.acoes()
end
--verifiva=timer.performWithDelay(100, jogo.acoes())
--verifiva=timer.performWithDelay(1000, jogo.gameOver())
--print(jogo.iniciarPartida())
verifiva=timer.performWithDelay(800, jogo.gameOver())
jogo.iniciarPartida()
return jogo