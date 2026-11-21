local addonName, addon = ...

JumpMaster9000 = JumpMaster9000 or {}
addon = JumpMaster9000

addon.name = addonName
if C_AddOns and C_AddOns.GetAddOnMetadata then
    addon.version = C_AddOns.GetAddOnMetadata(addonName, "Version")
elseif GetAddOnMetadata then
    addon.version = GetAddOnMetadata(addonName, "Version")
else
    addon.version = "0.1.0"
end

addon.eventFrame = CreateFrame("Frame", addonName .. "EventFrame")
addon.eventFrame:RegisterEvent("ADDON_LOADED")

addon.eventFrame:SetScript("OnEvent", function(self, event, loadedAddonName)
    if event == "ADDON_LOADED" and loadedAddonName == addonName then
        JumpMaster9000DB = JumpMaster9000DB or {}
        addon.db = JumpMaster9000DB

        self:UnregisterEvent("ADDON_LOADED")
    end
end)

SLASH_JUMPMASTER90001 = "/jumpmaster"
SLASH_JUMPMASTER90002 = "/jm9000"

SlashCmdList.JUMPMASTER9000 = function()
    if addon.UI and addon.UI.Toggle then
        addon.UI:Toggle()
    end
end
