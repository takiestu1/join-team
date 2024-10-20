pcall(function()
    if game:GetService("Players").LocalPlayer.PlayerGui.Main:FindFirstChild("ChooseTeam") then
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Visible == true then
                for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container.Pirates.Frame.ViewportFrame.TextButton.MouseButton1Click)) do
                    v.Function()
                end
        end
    end
end)

function EquipWeapon(ToolSe)
    if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
        local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
        wait(.4)
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
    end
end

function Tween2(P1)
    local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
    if Distance >= 1 then
    Speed = 300
    end
    game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character.HumanoidRootPart,TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear), {
      CFrame = P1
    }):Play()
    _G.Clip2 = true
    wait(Distance/Speed)
    _G.Clip2 = false
    end
game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualUser"):Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualUser"):Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
if game.PlaceId == 4442272183 then
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-281.93707275390625, 306.130615234375, 609.280029296875))
    wait(0.5)
    Tween2(CFrame.new(-380.47927856445, 77.220390319824, 255.82550048828))
    wait(1)
    pcall(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy"))
    wait(1)
    pcall(function()
        for _,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if string.find(v.Name, "Fruit") then
                EquipWeapon(v.Name)
                wait(.5)
                game:GetService("Players").LocalPlayer.Character:FindFirstChild(v.Name).EatRemote:InvokeServer("Drop")
            end
        end

    end)
else
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
end
setclipboard(tostring(game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame))