local addonName, addon = ...
addon = JumpMaster9000

local ui = CreateFrame("Frame", addonName .. "UI", UIParent, "BasicFrameTemplate")
ui:SetSize(320, 220)
ui:SetPoint("CENTER")
ui:SetMovable(true)
ui:EnableMouse(true)
ui:RegisterForDrag("LeftButton")
ui:SetScript("OnDragStart", ui.StartMoving)
ui:SetScript("OnDragStop", ui.StopMovingOrSizing)
ui:Hide()

ui.TitleText:SetText(addonName)

local content = ui:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
content:SetPoint("CENTER")
content:SetText("Jump tracking UI")

function ui:Toggle()
    if self:IsShown() then
        self:Hide()
    else
        self:Show()
    end
end

addon.UI = ui
