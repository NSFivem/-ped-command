RegisterCommand('ped', function()


    DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP8", "", "", "", "", "", 64 + 1)
    
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end
    
    local modelhash = GetOnscreenKeyboardResult()
	
	if modelhash == nil then 
		modelhash = ""
	end

	if modelhash == "" then 
		return
	end

	local model = GetHashKey(modelhash)

	if IsModelValid(model) and IsModelAPed(model) then
    	RequestModel(model)
    	while not HasModelLoaded(model) do
        	Wait(100)
		end
	else
		print("Invalid model")
	end

    SetPlayerModel(PlayerId(), model)
	SetModelAsNoLongerNeeded(model)
end)
