
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CameraCalculator = require(ReplicatedStorage.CameraCalculator)

local dummy = workspace.Dummy
local camera = workspace.CurrentCamera

local modelSize = dummy:GetExtentsSize()

local distance = CameraCalculator.DistanceToReachLimitY(modelSize.Y)

print(modelSize.Y)

wait(2) --stop errors and I'm too lazy for a proper implementation for a test

local topModel = dummy.Head.Position.Y + dummy.Head.Position.Y/2
local middleY = topModel - modelSize.Y/2
local finalPosition = Vector3.new(dummy.PrimaryPart.Position.X, middleY, dummy.PrimaryPart.Position.Z)

local finalCameraPosition = finalPosition + dummy.PrimaryPart.CFrame.LookVector * distance

local finalCameraCFrame = CFrame.new(finalCameraPosition, dummy.PrimaryPart.Position)



camera.CameraType = Enum.CameraType.Scriptable
camera.CFrame = finalCameraCFrame

--Spawn parts at borders
local limitX, limitY = CameraCalculator.GetCameraLimits(distance)

local part = Instance.new("Part")

part.Anchored = true
part.Position = dummy.PrimaryPart.Position + Vector3.new(0, limitY, 0)

part.Parent = workspace