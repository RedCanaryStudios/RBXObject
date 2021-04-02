local cache = {}

objType = function(obj)
    return cache[obj] or typeof(obj)
end

newobject = function(tble, objMT, name, lockedProperties)
    local obj = newproxy(true)
    
    objMT = objMT or {}
    
    local mt = getmetatable(obj)
    
    local providedIndex = {}
    
    mt.__newindex = function(t, k, v)
        if lockedProperties then
            error("Attempted to edit "..name.." object.")
        else
            if tble[k] then
                tble[k] = v
            else
                error("Attempted to edit "..name.." object.")
            end
        end
    end
    
    for k, v in pairs(objMT) do
        if k == "__index" then
            providedIndex = v
            continue
        end
        mt[k] = v
    end
    
    mt.__index = function(t, k)
        return tble[k] or (type(providedIndex) == "table" and providedIndex[k] or providedIndex(t, k))
    end
    
    mt.__metatable = {}
    
    cache[obj] = name
    
    return obj
end

return {
    newobject = newobject;
    objType = objType;
}
