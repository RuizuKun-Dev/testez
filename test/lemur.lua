local LOAD_MODULES = {
    {
        'src',
        'TestEZ',
    },
    {
        'tests',
        'TestEZTests',
    },
}

package.path = package.path .. ';?/init.lua'

local lemur = require('modules.lemur')
local habitat = lemur.Habitat.new()
local ReplicatedStorage = habitat.game:GetService('ReplicatedStorage')

for _, module in ipairs(LOAD_MODULES)do
    local container = habitat:loadFromFs(module[1])

    container.Name = module[2]
    container.Parent = ReplicatedStorage
end

local runTests = habitat:loadFromFs('test/runner.server.lua')

habitat:require(runTests)
