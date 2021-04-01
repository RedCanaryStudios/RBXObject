This is a dependency for Canary Studios modules.

It doesn't have much use, but if you desire to use it, keep reading.

# RBXObject

Usage:

```lua
local RBXObject = require(dir)

local newobject = RBXObject.newObject -- newproxy on steroids
local objtype = RBXObject.objType -- basically typeof() but compatible with RBXObjects

local tbl = {
  Attribute1 = "Test";
  Attribute2 = "Test2";
}

local myObj = newobject(tbl, nil, "Test") -- table, metatable, object name

print(objtype(myObj)) -- Test

myObj.Attribute3 = "LOL I'm editting" -- error: Attempted to edit Test object.
```
