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

local function createStatRow(parent, row, labelText, valueText)
    local yOffset = -(row - 1) * 18

    local label = parent:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    label:SetPoint("TOPLEFT", parent, "TOPLEFT", 0, yOffset)
    label:SetJustifyH("LEFT")
    label:SetText(labelText)

    local value = parent:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    value:SetPoint("TOPRIGHT", parent, "TOPRIGHT", 0, yOffset)
    value:SetJustifyH("RIGHT")
    value:SetText(valueText)
end

createStatRow(ui, 1, "Account Jumps", "1")
createStatRow(ui, 2, "Character Jumps", "0")
createStatRow(ui, 3, "Session Jumps", "0")
createStatRow(ui, 4, "Jumps Per Hour", "0")
createStatRow(ui, 5, "Since Last Jump", "00:00")

function ui:Toggle()
    if self:IsShown() then
        self:Hide()
    else
        self:Show()
    end
end

addon.UI = ui