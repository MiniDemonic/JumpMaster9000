local addonName, addon = ...
addon = JumpMaster9000

local ui = CreateFrame("Frame", addonName .. "UI", UIParent)
ui:SetSize(220, 80)
ui:SetPoint("CENTER")
ui:SetMovable(true)
ui:EnableMouse(true)
ui:RegisterForDrag("LeftButton")
ui:SetScript("OnDragStart", ui.StartMoving)
ui:SetScript("OnDragStop", ui.StopMovingOrSizing)
ui:Hide()

local function createStatLabel(parent, relativeTo, text)
    local label = parent:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    label:SetPoint("TOPLEFT", relativeTo or parent, relativeTo and "BOTTOMLEFT" or "TOPLEFT", 0, relativeTo and -4 or 0)
    label:SetJustifyH("LEFT")
    label:SetText(text)
    return label
end

local characterJumps = createStatLabel(ui, nil, "Character jumps       22")
local sessionJumps = createStatLabel(ui, characterJumps, "Session jumps          37")
local jumpsPerHour = createStatLabel(ui, sessionJumps, "Jumps per hour         27")
local sinceLastJump = createStatLabel(ui, jumpsPerHour, "Since last jump        01:23")

function ui:Toggle()
    if self:IsShown() then
        self:Hide()
    else
        self:Show()
    end
end

addon.UI = ui