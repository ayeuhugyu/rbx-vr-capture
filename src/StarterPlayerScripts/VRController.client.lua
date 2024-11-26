local VRService = game:GetService("VRService")
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local isNotR6 = character:FindFirstChild("Humanoid") and character.Humanoid.RigType ~= Enum.HumanoidRigType.R6
if isNotR6 then
    error("only R6 characters are currently supported by this VR controller")
    return
end

local leftHand: Part
local rightHand: Part
local head: Part
local leftControllerPart: Part
local rightControllerPart: Part

function onCharacterAdded(char)
    character = char
    leftHand = character:WaitForChild("LeftArm")
    rightHand = character:WaitForChild("RightArm")
    head = character:WaitForChild("Head")

    leftControllerPart = Instance.new("Part")
    leftControllerPart.Name = "LeftController"
    leftControllerPart.Shape = Enum.PartType.Ball
    leftControllerPart.Size = Vector3.new(0.1, 0.1, 0.1)
    leftControllerPart.Anchored = true
    leftControllerPart.CanCollide = false
    leftControllerPart.Material = Enum.Material.ForceField
    leftControllerPart.Parent = character

    rightControllerPart = Instance.new("Part")
    rightControllerPart.Name = "RightController"
    rightControllerPart.Shape = Enum.PartType.Ball
    rightControllerPart.Size = Vector3.new(0.1, 0.1, 0.1)
    rightControllerPart.Anchored = true
    rightControllerPart.CanCollide = false
    rightControllerPart.Material = Enum.Material.ForceField
    rightControllerPart.Parent = character

    leftHand.Transparency = 0.5
    rightHand.Transparency = 0.5
end
player.CharacterAdded:Wait()
onCharacterAdded(player.Character)
player.CharacterAdded:Connect(onCharacterAdded)

local UserControllerIndex = {
    [Enum.UserCFrame.LeftHand] = {leftControllerPart, leftHand},
    [Enum.UserCFrame.RightHand] = {rightControllerPart, rightHand},
    [Enum.UserCFrame.Head] = {head, nil}
}

VRService.UserCFrameChanged:Connect(function(CFrameType, cf)
	local controller = UserControllerIndex[CFrameType]
    if controller then
        local controllerPart = controller[1]
        local characterPart = controller[2]
        if controllerPart then
            if CFrameType ~= Enum.UserCFrame.Head then
                controllerPart.CFrame = cf * UserControllerIndex[Enum.UserCFrame.Head][1].CFrame:Inverse()
            else
                controllerPart.CFrame = cf
            end
        end
        if characterPart then
            if CFrameType ~= Enum.UserCFrame.Head then
                characterPart.CFrame = cf * UserControllerIndex[Enum.UserCFrame.Head][1].CFrame:Inverse()
            else
                characterPart.CFrame = cf
            end
        end
    end
end)