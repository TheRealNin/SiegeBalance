
local function upvalues( func )
	local i = 0;
	if not func then
		return function() end
	else
		return function()
			i = i + 1
			local name, val = debug.getupvalue (func, i)
			if name then
				return i,name,val
			end
		end
	end
end
local function LocateUpValue( func, upname, recurse )
    for i,name,val in upvalues( func ) do
        if name == upname then
            return func,i,val
        end
    end
 
    if recurse then
        for i,name,innerfunc in upvalues( func ) do
            if type( innerfunc ) == "function" then
                local r = { LocateUpValue( innerfunc, upname, recurse ) }
                if #r > 0 then
                    return unpack( r )
                end
            end
        end
    end
end
local function ReplaceUpValue( func, localname, newval, options )
    local i,val;
 
    options = options or {}
 
    func, i, val = LocateUpValue( func, localname, options.LocateRecurse );
 
    if options.CopyUpValues then
        CopyUpValues( newval, val )
    end
 
    debug.setupvalue( func, i, newval )
end

if Server then
  local newDamagedPercentage = 0.8
  ReplaceUpValue(PowerPoint.OnWeldOverride, "kDamagedPercentage", newDamagedPercentage)  
  
end

