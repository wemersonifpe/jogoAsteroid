Nave = {}

local physics = require("physics")
local asteroid = require("Asteroid")

physics.start()
physics.setGravity(0,0)

local reverse = 1
local i=0
local j=0
local vidas = 3
tiro={}

local contTiro
--,"static"
function Nave:criarNave()
	vertices = {25,-10, 35,10, 15,10}
	naveJogador = display.newPolygon( 220, 170, vertices )
	naveJogador.id=1
	naveJogador.strokeWidth = 1
	naveJogador:setFillColor(0)
	physics.addBody(naveJogador)
	naveJogador:addEventListener("collision", destruirNave)
end

function Nave:verificarVidas()
	vidas = vidas - 1
	if viadas == 0 then
		fimDeJogo = display.newText("GAME OVER!",250,150)
	else
		return false
	end
end

function destruirNave(event)
	i=0
	display.remove(event.target)
	naveJogador.id = nil
	display.remove(event.other)
	tempoNave=timer.performWithDelay(4000, Nave.criarNave)
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
    if ( reverse == 1 ) then
        naveJogador.rotation=naveJogador.rotation-22.5
        i=i-1
    else
        naveJogador.rotation=naveJogador.rotation+22.5
        i=i+1
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
end

return Nave