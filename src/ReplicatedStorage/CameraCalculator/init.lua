--Services||
local Workspace = game:GetService("Workspace")

--Variables
local module = {}

--Methods

--[[
    Gives you the distance gap between the middle point of your screen
    up to the borders of the camera on both X and Y
]]
function module.GetCameraLimits(distance)

    local camera = Workspace.CurrentCamera

    local cameraAngle = math.tan(math.rad(camera.FieldOfView/2))

    --Offset positions
    local distanceY = math.abs(distance * cameraAngle)
    local distanceX = math.abs(camera.ViewportSize.X/camera.ViewportSize.Y) * distanceY

    return distanceX, distanceY

end

function module.DistanceToReachLimitY(sizeY)
    
    local camera = Workspace.CurrentCamera
    local cameraAngle = math.rad(camera.FieldOfView/2)
    local distance = (sizeY/2)/math.tan(cameraAngle)

    return distance

end

return module