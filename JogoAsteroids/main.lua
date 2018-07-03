-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here


Asteroid ={
	
	at ={{"",""},
		{"",""}}
}
local physics = require("physics")
physics.start()
physics.setGravity(0,0)

xmin = display.screenOriginX - 50
xmax = display.contentWidth + 50
ymin = display.screenOriginY - 50
ymax = display.contentHeight + 50

function Asteroid:CriarAsteroid()

	for i=1,5 do
		verticesDoAsteroid = {3,-30, 13,-35, 25,-35, 25,-15, 15,-5, 10,7, -10,3, -20,-10, -25,-15, -17,-35,}
		astroid1 = display.newPolygon(math.random(xmin, xmax), math.random(ymin, ymax), verticesDoAsteroid)
		astroid1.x = math.random(xmin, xmax)
		astroid1.y = math.random(ymin, ymax)
		astroid1:setFillColor( 0.5, 0.3, 0.2 )
		astroid1.id=1
		--Asteroid.at[1][1] = astroid1
		Asteroid.MovimentarAsteroid()
	end
	if (astroid1.x > display.screenOriginX and astroid1.x < display.contentWidth + 1 and astroid1.y > display.screenOriginX and astroid1.y < display.contentWidth + 1) then
			display.remove(astroid1)
	end
	asteroidTimer=timer.performWithDelay(9000, Asteroid.CriarAsteroid)
end
--timer.performWithDelay(5000,Asteroid.CriarAsteroid)
function Asteroid:MovimentarAsteroid()
	--physics.addBody(Asteroid.at[1][1])
	--Asteroid.at[1][1]:setLinearVelocity(math.random(-25,25), math.random(-8,10))
	physics.addBody(astroid1)
	astroid1:setLinearVelocity(math.random(-35,35), math.random(-20,20))
end

-----------------------------------------------------------------------------------------
Nave = {}

--local physics = require("physics")

--physics.start()
--physics.setGravity(0,0)

local reverse = 1
local i=0
local j=0
local vidas = 3
tiro={}

local contTiro
--,"static"
function Nave:criarNave()
	vertices = {25,-10, 35,10, 15,10}
	naveJogador = display.newPolygon( 150, 200, vertices )
	naveJogador.id=1
	naveJogador.strokeWidth = 1
	naveJogador:setFillColor(0)
	physics.addBody(naveJogador)
	naveJogador:addEventListener("collision", destruirNave)
end

function Nave:verificarVidas()
	vidas = vidas - 1
	if vidas == 0 then
		timer.pause(tempoNave)
		jogo.gameOver()
		vidas=3
	end
end

function destruirNave(event)
	i=0
	display.remove(event.target)
	naveJogador.id = nil
	display.remove(event.other)
	tempoNave=timer.performWithDelay(3500, Nave.criarNave)
	Nave.verificarVidas()
end

function Nave:atirar()
		if naveJogador.id ~= nil then
			 contTiro = #tiro+1
			
			tiro[contTiro] = display.newRect(naveJogador.x,naveJogador.y-20,2,2)
			tiro[contTiro].id = contTiro
			
			physics.addBody(tiro[contTiro])
			Nave.DireacaoDoTiro()

			tiro[contTiro]:addEventListener("collision", destruirAsteroid)
		end
end

function Nave:DireacaoDoTiro()
	
	if naveJogador.id ~= nil then
		if i == -2 then
			tiro[contTiro]:setLinearVelocity(-100,-100)
			tiro[contTiro].x = naveJogador.x-20
		elseif i == -4 then
			tiro[contTiro]:setLinearVelocity(-100,0)
			tiro[contTiro].x = naveJogador.x-20
			tiro[contTiro].y = naveJogador.y+0
		elseif i == -6 then
			tiro[contTiro]:setLinearVelocity(-100,100)
			tiro[contTiro].x = naveJogador.x-20
			tiro[contTiro].y = naveJogador.y+20
		elseif i == -8 then
			tiro[contTiro]:setLinearVelocity(0,100)
			tiro[contTiro].x = naveJogador.x+0
			tiro[contTiro].y = naveJogador.y+20
		elseif i == -10 then
			tiro[contTiro]:setLinearVelocity(100,100)
			tiro[contTiro].x = naveJogador.x+20
			tiro[contTiro].y = naveJogador.y+20
		elseif i == -12 then
			tiro[contTiro]:setLinearVelocity(100,0)
			tiro[contTiro].x = naveJogador.x+20
			tiro[contTiro].y = naveJogador.y+0
		elseif i == -14 then
			tiro[contTiro]:setLinearVelocity(100,-100)
			tiro[contTiro].x = naveJogador.x+20
			tiro[contTiro].y = naveJogador.y-20
		elseif i == 2 then
			tiro[contTiro]:setLinearVelocity(100,-100)
			tiro[contTiro].x = naveJogador.x+20
		elseif i == 4 then
			tiro[contTiro]:setLinearVelocity(100,0)
			tiro[contTiro].x = naveJogador.x+20
			tiro[contTiro].y = naveJogador.y+0
		elseif i == 6 then
			tiro[contTiro]:setLinearVelocity(100,100)
			tiro[contTiro].x = naveJogador.x+20
			tiro[contTiro].y = naveJogador.y+20
		elseif i == 8 then
			tiro[contTiro]:setLinearVelocity(0,100)
			tiro[contTiro].x = naveJogador.x+0
			tiro[contTiro].y = naveJogador.y+20
		elseif i == 10 then
			tiro[contTiro]:setLinearVelocity(-100,100)
			tiro[contTiro].x = naveJogador.x-20
			tiro[contTiro].y = naveJogador.y+20
		elseif i == 12 then
			tiro[contTiro]:setLinearVelocity(-100,0)
			tiro[contTiro].x = naveJogador.x-20
			tiro[contTiro].y = naveJogador.y+0
		elseif i == 14 then
			tiro[contTiro]:setLinearVelocity(-100,-100)
			tiro[contTiro].x = naveJogador.x-20
			tiro[contTiro].y = naveJogador.y-20
		else
			i=0
			tiro[contTiro]:setLinearVelocity(0,-100)
		end
	end
end

function Nave:RotacionasrNaveParaEsquerda()
	reverse = 1
	Nave:rotacionar()
end

function Nave:RotacionasrNaveParaDireita()
	reverse = 0
	Nave:rotacionar()
end

function Nave:rotacionar()
	if naveJogador.id ~= nil then
	    if ( reverse == 1 ) then
	        naveJogador.rotation=naveJogador.rotation-22.5
	        i=i-1
	    else
	        naveJogador.rotation=naveJogador.rotation+22.5
	        i=i+1
	    end
	end
end

function Nave:MoverNaveJogador()
	if naveJogador.id ~= nil then
		if i == -2 then
			naveJogador:setLinearVelocity(-100,-100)
		elseif i == -4 then
			naveJogador:setLinearVelocity(-100,0)
		elseif i == -6 then
			naveJogador:setLinearVelocity(-100,100)
		elseif i == -8 then
			naveJogador:setLinearVelocity(0,100)
		elseif i == -10 then
			naveJogador:setLinearVelocity(100,100)
		elseif i == -12 then
			naveJogador:setLinearVelocity(100,0)
		elseif i == -14 then
			naveJogador:setLinearVelocity(100,-100)
		elseif i == 2 then
			naveJogador:setLinearVelocity(100,-100)
		elseif i == 4 then
			naveJogador:setLinearVelocity(100,0)
		elseif i == 6 then
			naveJogador:setLinearVelocity(100,100)
		elseif i == 8 then
			naveJogador:setLinearVelocity(0,100)
		elseif i == 10 then
			naveJogador:setLinearVelocity(-100,100)
		elseif i == 12 then
			naveJogador:setLinearVelocity(-100,0)
		elseif i == 14 then
			naveJogador:setLinearVelocity(-100,-100)
		else
			i=0
			naveJogador:setLinearVelocity(0,-100)
		end
	end
end

function Nave:PararNave()
	if naveJogador.id ~= nil then
		naveJogador:setLinearVelocity(0,0)
	end
end
destuir = 0
function destruirAsteroid(event)

	display.remove(event.target)
	tiro[contTiro].id = nil
	display.remove(event.other)
	tiro[event.other] = nil
	destuir = 1
	jogo.CalcularPontuacao()
end

----------------------------------------------------------------------------------------

jogo={}

local pontos = 0
Asteroid.CriarAsteroid()

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
			Nave.atirar()
		end
	end

	function jogo:rotacionarParaDireita(event)
		Nave.RotacionasrNaveParaDireita()
	end

	function jogo:rotacioParaEsquerda(event)
		Nave.RotacionasrNaveParaEsquerda()
	end

	function moverNave(event)
		if event.phase == "began" then
			Nave.MoverNaveJogador()
		elseif event.phase == "ended" then
			Nave.PararNave()
		end
	end

	butaoMover:addEventListener("touch", moverNave)
	butaoAtirar:addEventListener("touch", criarTiro)
	butaoDireito:addEventListener("touch", jogo.rotacionarParaDireita)
	butaoEsquerdo:addEventListener("touch", jogo.rotacioParaEsquerda)
end

function jogo:gameOver()
	timer.pause(tempoNave)
	timer.pause(asteroidTimer)
	jogo.MostrarPlacar()
	fimDeJogo = display.newText("GAME OVER!",240,100)
	jogo.ReiniciarPartida()
end

function jogo:CalcularPontuacao()
	pontos = pontos + 15
end

function jogo:MostrarPlacar()
	placar = display.newRoundedRect( 240, 150, 200, 150, 12 )
	recordes = display.newText("Pontos: "..pontos,235,140)
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
	confim:addEventListener("touch", jogo.Reiniciar)
	quit:addEventListener("touch",jogo.SairJogo)
end

function jogo:SairJogo(event)
	os.exit()
end

function jogo:Reiniciar(event)
	display.remove(placar)
	display.remove(recordes)
	display.remove(fimDeJogo)
	display.remove(confim)
	display.remove(quit)
	--Nave.criarNave()
	timer.resume(tempoNave)
	timer.resume(asteroidTimer)
end

function jogo:comecar(event)
	display.remove(contorles)
	display.remove(novoJogo)
	display.remove(sair)
	jogo.iniciarJogo()
end

function jogo:iniciarJogo()
	Nave.criarNave()
	jogo.acoes()
end

--print(jogo.iniciarPartida())
return jogo.iniciarPartida()