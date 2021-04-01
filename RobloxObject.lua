local cache = {}

objType = function(obj)
    return cache[obj] or typeof(obj)
end

newobject = function(tble, objMT, name)
    local obj = newproxy(true)
    
    objMT = objMT or {}
    
    local mt = getmetatable(obj)
    
    local providedIndex = {}
    
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
    
    mt.__newindex = function()
        error("Attempted to edit "..name.." object.")
    end
    
    cache[obj] = name
    
    return obj
end

return {
    newobject = newobject;
    objType = objType;
}
