package vm.lua;

@:native('lua_State')
extern private class LuaState {}

typedef StateStar = cpp.RawPointer<LuaState>;
typedef State = cpp.Pointer<LuaState>;