Asteroid ={
	
	at ={{"",""},
		{"",""}}
}
local physicis = require("physics")
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
	spawnTimer=timer.performWithDelay(9000, Asteroid.CriarAsteroid)
end
--timer.performWithDelay(5000,Asteroid.CriarAsteroid)
function Asteroid:MovimentarAsteroid()
	--physics.addBody(Asteroid.at[1][1])
	--Asteroid.at[1][1]:setLinearVelocity(math.random(-25,25), math.random(-8,10))
	physics.addBody(astroid1)
	astroid1:setLinearVelocity(math.random(-35,35), math.random(-20,20))
end

return Asteroid