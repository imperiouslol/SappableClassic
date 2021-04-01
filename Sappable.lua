targetIndicator=CreateFrame("Frame");
targetIndicator:SetParent(TargetFrame);
targetIndicator:SetPoint("Right", TargetFrame, -15);
targetIndicator:SetSize(26, 26);
targetIndicator.t=targetIndicator:CreateTexture(nil,BORDER);
targetIndicator.t:SetAllPoints();
targetIndicator.t:SetTexture("Interface\\Icons\\ABILITY_SAP");
targetIndicator:Hide();

focusIndicator=CreateFrame("Frame");
focusIndicator:SetParent(FocusFrame);
focusIndicator:SetPoint("Right", FocusFrame, -15);
focusIndicator:SetSize(26, 26);
focusIndicator.t=focusIndicator:CreateTexture(nil,BORDER);
focusIndicator.t:SetAllPoints();
focusIndicator.t:SetTexture("Interface\\Icons\\ABILITY_SAP");
focusIndicator:Hide();

local function getSappableCreatureTypes()
	local LOCALE = GetLocale()
	if LOCALE == "deDE" then
		return {"Humanoid"};
	elseif LOCALE == "esES" then
		return {"Humanoide"};
	elseif LOCALE == "esMX" then
		return {"Humanoide"};
	elseif LOCALE == "frFR" then
		return {"d’humanoïde"};
	elseif LOCALE == "itIT" then
		return {"Umanoidi"};
	elseif LOCALE == "koKR" then
		return {"인간형"};
	elseif LOCALE == "ptBR" then
		return {"Humanoide"};
	elseif LOCALE == "zhCN" then
		return {"人型"};
	elseif LOCALE == "zhTW" then
		return {"人形"};
	else
		return {"Humanoid"};
	end;
end;

sappableCreatureTypes = getSappableCreatureTypes();

local function creatureIsSappable(unit)
	creatureType = UnitCreatureType(unit)
	for index, value in ipairs(sappableCreatureTypes) do
		if (value == creatureType) then
                	return true;
		end;
        end;
	
	return false;
end;


local function showIndicator(self, unit)
	if (creatureIsSappable(unit)
                and not UnitIsFriend("player", unit)
		and not UnitAffectingCombat(unit)) then
		self:Show();
        else
                self:Hide();
        end;
end;

local t = CreateFrame("Frame")
t:SetScript("OnUpdate", function(self) showIndicator(targetIndicator, "target") end);
local f = CreateFrame("Frame")
f:SetScript("OnUpdate", function(self) showIndicator(focusIndicator, "focus") end);
