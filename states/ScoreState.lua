--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

local MEDAL_X = 224
local MEDAL_Y = 110

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
    self.bronzeImage = love.graphics.newImage('small_bronze.png')
    self.silverImage = love.graphics.newImage('small_silver.png')
    self.goldImage = love.graphics.newImage('small_gold.png')
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')
    self:renderMedal()
    love.graphics.printf('Press Enter to Play Again!', 0, 160, VIRTUAL_WIDTH, 'center')
end

function ScoreState:renderMedal()
  if self.score >= 5  and self.score < 10 then
    love.graphics.draw(self.bronzeImage, MEDAL_X, MEDAL_Y)
  elseif self.score >= 10 and self.score < 15 then
    love.graphics.draw(self.silverImage, MEDAL_X, MEDAL_Y)
  elseif self.score >= 15 then
    love.graphics.draw(self.goldImage, MEDAL_X, MEDAL_Y)
  end
end