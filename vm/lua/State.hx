package vm.lua;

@:native('lua_State')
extern private class LuaState {}

typedef State = cpp.Star<LuaState>;