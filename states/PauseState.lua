PauseState = Class{__includes = BaseState}

function PauseState:enter(params)
  sounds['music']:pause()
  sounds['pause']:play()
  self.playState = params.playState
end

function PauseState:exit(params)
  sounds['music']:play()
end

function PauseState:update(dt)
  -- to resume play state, hit 'p'
  if love.keyboard.wasPressed('p') then
    gStateMachine:change('play', { playState =  self.playState } )
  end
  
end

function PauseState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(hugeFont)
    love.graphics.printf('||', 0, 100, VIRTUAL_WIDTH, 'center')
    
end