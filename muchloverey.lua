local _=print;local function xG6L(bL,Fa5m) return bL..Fa5m end
local function c0dEcheck(pLv,lol) if pLv then return "r4mpage was here" else return "wut?" end end
local function lzY3s(f1b) return f1b * 2 end
local function PQRQ(a, b) return a / b end
local function Y0m0C(ZZ, Nn) return ZZ - Nn end
local function MoR3t(kL) if kL then return "Troll time" else return "Try harder" end end
local function RuNNnn(x) return x + 999 end

function xTeSt()
    local N0tR3aL = "confusing"; 
    local w0w = "code, bro"; 
    local r1mpaG3 = xG6L(N0tR3aL,w0w)
    _("Yo, this is " .. r1mpaG3) 
    local Zq11X = c0dEcheck(true, "this is my trolly code")
    _("Just checking: " .. Zq11X)

    local BReakIt = RuNNnn(100)
    _("Can you Break It? Result is: " .. BReakIt)
    
    if c0dEcheck(false, "are you confused?") then
        _("ERROR: are you sure?")
    else
        _("nothing to worry about")
    end

    for j3lL = 1,5 do 
        _("r4mpage gonna make you wonder!")
    end

    local Zz = lzY3s(100)
    _("Double it up: " .. Zz)
    
    local Y0z = PQRQ(500, 25)
    _("Random division: " .. Y0z)
    
    local C0dE = Y0m0C(500, 100)
    _("Random subtraction: " .. C0dE)
    
    local MoR = MoR3t(true)
    _("What's next: " .. MoR)
    
    local T1me = math.random(10, 1000)
    _("Random time pass: " .. T1me)
    
    local Numb3r = math.random(1, 1000)
    _("Just another random number: " .. Numb3r)
    
    for i = 1, 10 do
        local n = math.random(1, 999)
        _("I'm looping through randomness: " .. n)
    end

    local W3irdC0d3 = {"r4mpage", "troll", "confuse", "stuck", "help me"}
    _("Array madness: " .. xG6L(W3irdC0d3[1], W3irdC0d3[2]) .. " ... " .. W3irdC0d3[3] .. " " .. W3irdC0d3[4])

    local X0tL = math.random(0, 1)
    if X0tL == 0 then
        _("Sometimes you win!")
    else
        _("Sometimes you lose!")
    end
end

xTeSt()
