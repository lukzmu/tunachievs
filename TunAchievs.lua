local TunAchievs = CreateFrame("Frame")

function TunAchievs:OnEvent(event, ...)
    self[event](self, event, ...)
end

function TunAchievs:ADDON_LOADED(event, addOnName)
    if addOnName == "tunachievs" then        
        TunAchievs:CreateTab()
        TunAchievs:SetTabs()
        TunAchievs:SetComparisonTabs()
        TunAchievs:UnregisterEvent("ADDON_LOADED")
    end
end

function TunAchievs:CreateTab()
    self.tab = CreateFrame("Button", "AchievementFrameTab4", AchievementFrame, "AchievementFrameTabButtonTemplate")
    self.tab:SetText("TunAchievs")
    self.tab:SetSize(100, 40)
    self.tab:SetPoint("LEFT", AchievementFrameTab3, "RIGHT", -5, 0)
    self.tab:SetScript("OnClick", self.ClickTab)
    PanelTemplates_SetNumTabs(AchievementFrame, 4)
end

function TunAchievs:CreateContentView()
    -- TODO: Add content achievements view
end

function TunAchievs:UpdateContent()
    -- TODO: Add refresh of achievements on events
end

function TunAchievs:ClickTab()
    PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
    -- TODO: Add opening of achievements view
end

function TunAchievs:SetTabs()
    if not AchievementFrame_SetTabs_Original then
        AchievementFrame_SetTabs_Original = AchievementFrame_SetTabs
        AchievementFrame_SetTabs = function(...)
            AchievementFrame_SetTabs_Original(...)
            PanelTemplates_ShowTab(AchievementFrame, 4)
        end
    end
end

function TunAchievs:SetComparisonTabs()
    if self.tab and not AchievementFrame_SetComparisonTabs_Original then
        AchievementFrame_SetComparisonTabs_Original = AchievementFrame_SetComparisonTabs
        AchievementFrame_SetComparisonTabs = function(...)
            AchievementFrame_SetComparisonTabs_Original(...)
            PanelTemplates_HideTab(AchievementFrame, 4)
        end
    end
end

TunAchievs:RegisterEvent("ADDON_LOADED")
TunAchievs:SetScript("OnEvent", TunAchievs.OnEvent)
