-- // Dependencies
local Aiming = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stefanuk12/ROBLOX/master/Universal/Aiming/Load.lua"))()

-- // Services
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- // Vars
local Keybind = Enum.UserInputType.MouseButton2 -- // You can also have Enum.KeyCode.E, etc.

-- //
local function ShouldUseCamera()
    -- //
    return (UserInputService.MouseBehavior == Enum.MouseBehavior.LockCenter)
end

-- // Constantly run
RunService:BindToRenderStep("AimLockAiming", 0, function()
    -- // Vars
    local IsToggled = (Keybind.EnumType == Enum.KeyCode and UserInputService:IsKeyDown(Keybind) or UserInputService:IsMouseButtonPressed(Keybind))

    -- // Make sure key (or mouse button) is down
    if (IsToggled and Aiming.Check()) then
        -- // Aim with camera
        if (ShouldUseCamera()) then
            Aiming.CameraLookAt(Aiming.SelectedPart.Position)
        else
            -- // Aim with mouse
            Aiming.BeizerCurve.AimTo({
                TargetPosition = Aiming.SelectedPosition
            })
        end
    end
end)

-- //
return "AimLockAiming"