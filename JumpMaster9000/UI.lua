local addonName, addon = ...
addon = JumpMaster9000

local ui = CreateFrame("Frame", addonName .. "UI", UIParent)
ui:SetSize(220, 100)
ui:SetPoint("CENTER")
ui:SetMovable(true)
ui:EnableMouse(true)
ui:RegisterForDrag("LeftButton")
ui:SetScript("OnDragStart", ui.StartMoving)
ui:SetScript("OnDragStop", ui.StopMovingOrSizing)
ui:Hide()

local function createStatRow(parent, relativeTo, labelText, valueText)
    local label = parent:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    label:SetPoint("TOPLEFT", relativeTo or parent, relativeTo and "BOTTOMLEFT" or "TOPLEFT", 0, relativeTo and -4 or 0)
    label:SetJustifyH("LEFT")
    label:SetText(labelText)

    local value = parent:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    value:SetPoint("TOPRIGHT", relativeTo or parent, relativeTo and "BOTTOMRIGHT" or "TOPRIGHT", 0, relativeTo and -4 or 0)
    value:SetJustifyH("RIGHT")
    value:SetText(valueText)

    return label
end

local accountJumps = createStatRow(ui, nil, "Account Jumps", "0")
local characterJumps = createStatRow(ui, accountJumps, "Character Jumps", "0")
local sessionJumps = createStatRow(ui, characterJumps, "Session Jumps", "0")
local jumpsPerHour = createStatRow(ui, sessionJumps, "Jumps Per Hour", "0")
local sinceLastJump = createStatRow(ui, jumpsPerHour, "Since Last Jump", "00:00")

function ui:Toggle()
    if self:IsShown() then
        self:Hide()
    else
        self:Show()
    end
end

addon.UI = ui