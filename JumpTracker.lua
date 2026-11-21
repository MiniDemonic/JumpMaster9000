JumpMaster9000 = JumpMaster9000 or {}
local addon = JumpMaster9000

addon.JumpTracker = {}

function addon.JumpTracker:IsJumping()
    return IsFalling()
end

function addon.JumpTracker:OnUpdate()

end