This is a dependency for Canary Studios modules.

It doesn't have much use, but if you desire to use it, keep reading, it's going to be hardly documented.

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

local myObj = newobject(tbl, nil, "Test", true) -- table, metatable, object name, is property locked

print(objtype(myObj)) -- Test

myObj.Attribute3 = "LOL I'm editting" -- error: Attempted to edit Test object.
```
