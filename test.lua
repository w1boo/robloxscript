

getgenv().autoBuyStarter = false;
getgenv().autoBuySnow = false;
getgenv().autoTap = false;
getgenv().thisvalue = "my name";






local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wall%20v3')))()

local w = library:CreateWindow("Click Mining by Khoa") -- Creates the window

local b = w:CreateFolder("Farming") -- Creates the folder(U will put here your buttons,etc)
local c = w:CreateFolder("Pet")
local d = w:CreateFolder("Teleport")


b:Toggle("Auto tap",function(bool)
    getgenv().autoTap = bool
    print("Auto Tap is ",bool)
    if bool then
        doTap();
    end
end)
c:Toggle("Auto Buy Starter Egg",function(bool)
    getgenv().autoBuyStarter = bool
    print("Auto Buy is ",bool)
    if bool then
        BuyStarter();
    end
end)
c:Toggle("Auto Buy Snow Egg",function(bool)
    getgenv().autoBuySnow = bool
    print("Auto Buy is ",bool)
    if bool then
        BuySnowEgg();
    end
end)
d:Button("Teleport",function()
    teleportWorld("Snow")
end)

b:DestroyGui()

--[[
How to refresh a dropdown:
1)Create the dropdown and save it in a variable
local yourvariable = b:Dropdown("Hi",yourtable,function(a)
    print(a)
end)
2)Refresh it using the function
yourvariable:Refresh(yourtable)
How to refresh a label:
1)Create your label and save it in a variable
local yourvariable = b:Label("Pretty Useless NGL",{
    TextSize = 25; -- Self Explaining
    TextColor = Color3.fromRGB(255,255,255);
    BgColor = Color3.fromRGB(69,69,69);
})
2)Refresh it using the function
yourvariable:Refresh("Hello") It will only change the text ofc
]]






















for i,v in ipairs(_G) do
    print(i,v);
end

function doTap()
    local remotePath = game:GetService("ReplicatedStorage").Remotes
    spawn(function ()
        while autoTap == true do
            remotePath.Click:InvokeServer()
            wait()
        end
    end)
end



-- if toogle == true then
--     autoTap == true;
-- doTap()
-- end

function BuyStarter()
spawn(function ()
    while autoBuyStarter == true do
        local args = {
            [1] = "Starter Egg",
            [2] = 1
        }
        
        game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
        
    end
        
    end)
end
function BuySnowEgg()
        spawn(function()
            while autoBuySnow == true do
    local args = {
        [1] = "Snow Egg",
        [2] = 1
    }

    game:GetService("ReplicatedStorage").Remotes.buyEgg:InvokeServer(unpack(args))
        end
        end)
end



function getCurrentPlayerPOS()
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
    return plyr.Character.HumanoidRootPart.Position;
end
    return false;
end

local curretnPosition = getCurrentPlayerPOS();
-- if curretnPosition then
--     -- do sth here
-- end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
         plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
    end
end
function  teleportWorld(world)
    if game:GetService("Workspace").TeleportBricks:FindFirstChild(world) then
        teleportTO(game:GetService("Workspace").TeleportBricks[world].CFrame)
    end
end
