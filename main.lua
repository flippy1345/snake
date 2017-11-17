function love.load(arg)
  width = love.graphics.getWidth()
  height = love.graphics.getHeight()
  print(height)

  gridDimensions = {['square'] = 20, ['padding'] = 10}
  gridDimensions = {
    ['horiRuns'] = ((gridDimensions.padding + gridDimensions.square) / width) * gridDimensions.padding,
    ['vertRuns'] = ((gridDimensions.padding + gridDimensions.square) / height) * gridDimensions.padding,
    ['square'] = gridDimensions.square,
    ['padding'] = gridDimensions.padding,
  }
  gridDimensions.horiBorder = width - ((gridDimensions.horiRuns * gridDimensions.square) + (gridDimensions.padding * (gridDimensions.horiRuns - 1))) / 2
  gridDimensions.vertBorder = height - ((gridDimensions.vertRuns * gridDimensions.square) + (gridDimensions.padding * (gridDimensions.vertRuns - 1))) / 2

  grid = {}
  snake = {} -- snake
  energyOrb = {} -- food
  for v = 0, gridDimensions.vertRuns do
    offsetX = gridDimensions.horiBorder
    offsetY = gridDimensions.vertBorder
    for i = 0, gridDimensions.horiRuns do
      table.insert(grid, {
        ['x'] = i * gridDimensions.square + offsetX,
        ['y'] = v * gridDimensions.square + offsetY,
        ['width'] = gridDimensions.square,
        ['height'] = gridDimensions.square
      })
      offsetX = gridDimensions.padding
      offsetY = gridDimensions.padding
    end
  end
  for k, v in pairs(gridDimensions) do
    print(k.." : "..v)
  end
end

function love.update(dt)
  love.window.setTitle(love.timer.getFPS())
end

function love.draw()
  for _, v in ipairs(grid) do
    love.graphics.rectangle("fill", v.x, v.y, v.width, v.height)
  end
end
