-- SERVICES

-- PLUGIN DEFINITION

local toolbar = plugin:CreateToolbar("VR Motion Capture")
local openConfigMenuButton = toolbar:CreateButton("Open Config Menu", "Open the VR Motion Capture config menu", "rbxassetid://445890116", "Open Config Menu")
local buildButton = toolbar:CreateButton("Save", "Builds the animation", "rbxassetid://445890116", "Save")
local insertVRControllerButton = toolbar:CreateButton("Insert VR Controller", "Inserts a VR Controller into the workspace", "rbxassetid://445890116", "Insert VR Controller")
openConfigMenuButton.ClickableWhenViewportHidden = true
buildButton.ClickableWhenViewportHidden = true
insertVRControllerButton.ClickableWhenViewportHidden = true

-- VARIABLES

local modelTypes = {
    "Ball",
    "Oculus",
    "Valve",
    "None"
}

local settings = {
    ["animation"] = {
        ["name"] = "VR Motion Capture",
        ["loop"] = false
    },
    ["recorder"] = {
        ["sampleRate"] = 60
    },
    ["appearance"] = {
        ["controller"] = {
            ["modelType"] = modelTypes[1],
            ["size"] = 0.1,
            ["material"] = Enum.Material.ForceField,
            ["transparency"] = 0
        },
        ["character"] = {
            ["transparency"] = 0.5
        },
        ["onionSkin"] = {
            ["enabled"] = false,
            ["frames"] = 5
        }
    },
    ["other"] = {
        ["debug"] = false
    }
}
local configIsOpen = false
local isRecording = false

-- CONFIG UI

local configScreenGUI = Instance.new("ScreenGui")
configScreenGUI.Name = "VRMotionCaptureConfig"
configScreenGUI.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local configFrame = Instance.new("Frame")
configFrame.Name = "ConfigFrame"
configFrame.Size = UDim2.new(0, 200, 0, 300)
configFrame.Position = UDim2.new(0, 15, 0.5)
configFrame.AnchorPoint = Vector2.new(0, 0.5)
configFrame.BackgroundColor3 = Color3.fromRGB(50, 42, 32)
configFrame.BorderSizePixel = 0
configFrame.Parent = configScreenGUI

local configFrameBorder = Instance.new("UIStroke")
configFrameBorder.Thickness = 2
configFrameBorder.Color = Color3.fromRGB(255, 163, 88)
configFrameBorder.Parent = configFrame

local configFrameListLayout = Instance.new("UIListLayout")
configFrameListLayout.Parent = configFrame

local configFrameTitle = Instance.new("TextLabel")
configFrameTitle.Text = "VR Capture Config"

local animationSettingsFrame = Instance.new("Frame")
animationSettingsFrame.Name = "AnimationSettings"
animationSettingsFrame.Size = UDim2.new(1, 0, 0, 50)
animationSettingsFrame.BorderSizePixel = 0
animationSettingsFrame.BackgroundTransparency = 1
animationSettingsFrame.Parent = configFrame

local recorderSettingsFrame = Instance.new("Frame")
recorderSettingsFrame.Name = "RecorderSettings"
recorderSettingsFrame.Size = UDim2.new(1, 0, 0, 50)
recorderSettingsFrame.BorderSizePixel = 0
recorderSettingsFrame.BackgroundTransparency = 1
recorderSettingsFrame.Parent = configFrame

local appearanceSettingsFrame = Instance.new("Frame")
appearanceSettingsFrame.Name = "AppearanceSettings"
appearanceSettingsFrame.Size = UDim2.new(1, 0, 0, 50)
appearanceSettingsFrame.BorderSizePixel = 0
appearanceSettingsFrame.BackgroundTransparency = 1
appearanceSettingsFrame.Parent = configFrame

local otherSettingsFrame = Instance.new("Frame")
otherSettingsFrame.Name = "OtherSettings"
otherSettingsFrame.Size = UDim2.new(1, 0, 0, 50)
otherSettingsFrame.BorderSizePixel = 0
otherSettingsFrame.BackgroundTransparency = 1
otherSettingsFrame.Parent = configFrame

local animationSettingsTitle = Instance.new("TextLabel")
animationSettingsTitle.Text = "animation"
animationSettingsTitle.Parent = animationSettingsFrame

local recorderSettingsTitle = Instance.new("TextLabel")
recorderSettingsTitle.Text = "recorder"
recorderSettingsTitle.Parent = recorderSettingsFrame

local appearanceSettingsTitle = Instance.new("TextLabel")
appearanceSettingsTitle.Text = "appearance"
appearanceSettingsTitle.Parent = appearanceSettingsFrame

local otherSettingsTitle = Instance.new("TextLabel")
otherSettingsTitle.Text = "other"
otherSettingsTitle.Parent = otherSettingsFrame

local animationSettingsListLayout = Instance.new("UIListLayout")
animationSettingsListLayout.Parent = animationSettingsFrame

local recorderSettingsListLayout = Instance.new("UIListLayout")
recorderSettingsListLayout.Parent = recorderSettingsFrame

local appearanceSettingsListLayout = Instance.new("UIListLayout")
appearanceSettingsListLayout.Parent = appearanceSettingsFrame

local otherSettingsListLayout = Instance.new("UIListLayout")
otherSettingsListLayout.Parent = otherSettingsFrame

-- REGULAR FUNCTIONS

while isRecording do
    local frame = {}
    task.wait(1 / settings.recorder.sampleRate)
end

-- BUTTON FUNCTIONS

function toggleConfigMenu()
    configIsOpen = not configIsOpen
    configScreenGUI.Enabled = configIsOpen
end
function buildAnimation()

end
function insertVRController()

end

-- CONNECTIONS

openConfigMenuButton.Click:Connect(toggleConfigMenu)
buildButton.Click:Connect(buildAnimation)
insertVRControllerButton.Click:Connect(insertVRController)