-----------------------------------
-- xi.effect.ENBLIZZARD
-----------------------------------
require("scripts/globals/status")
-----------------------------------
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ENSPELL, xi.magic.element.ICE)
    target:addMod(xi.mod.ENSPELL_DMG, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(xi.mod.ENSPELL_DMG, 0)
    target:setMod(xi.mod.ENSPELL, 0)
end

return effectObject