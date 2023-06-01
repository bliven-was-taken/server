-----------------------------------
-- xi.effect.FENRIRS_FAVOR
-----------------------------------
require("scripts/globals/status")
---------------------------------------------

local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MEVA, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MEVA, effect:getPower())
end

return effectObject