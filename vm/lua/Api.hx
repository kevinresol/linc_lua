package vm.lua;

import vm.lua.State;
import cpp.Int64;

@:keep
@:include('linc_lua.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('lua', '../../'))
#end
extern class Api {
    
    @:native('::String(LUA_VERSION)') // it is const char[8], null-terminated
    static var VERSION:String;
    
    @:native('LUA_OK')
    static var OK:Int;
    @:native('LUA_REGISTRYINDEX')
    static var REGISTRYINDEX:Int;
    
    @:native('LUA_TNIL')
    static var TNIL:Int;
    @:native('LUA_TNUMBER')
    static var TNUMBER:Int;
    @:native('LUA_TTABLE')
    static var TTABLE:Int;
    @:native('LUA_TSTRING')
    static var TSTRING:Int;
    @:native('LUA_TBOOLEAN')
    static var TBOOLEAN:Int;
    @:native('LUA_TFUNCTION')
    static var TFUNCTION:Int;
    @:native('LUA_TUSERDATA')
    static var TUSERDATA:Int;
    @:native('LUA_TTHREAD')
    static var TTHREAD:Int;
    @:native('LUA_TLIGHTUSERDATA')
    static var TLIGHTUSERDATA:Int;
    
    @:native('luaopen_base')
    static var luaopen_base:Dynamic;
    @:native('luaopen_debug')
    static var luaopen_debug:Dynamic;
    @:native('luaopen_io')
    static var luaopen_io:Dynamic;
    @:native('luaopen_math')
    static var luaopen_math:Dynamic;
    @:native('luaopen_os')
    static var luaopen_os:Dynamic;
    @:native('luaopen_package')
    static var luaopen_package:Dynamic;
    @:native('luaopen_string')
    static var luaopen_string:Dynamic;
    @:native('luaopen_table')
    static var luaopen_table:Dynamic;
    @:native('luaopen_coroutine')
    static var luaopen_coroutine:Dynamic;
    
    
    @:native('luaL_newstate')
    static function luaL_newstate():State;
    @:native('lua_close')
    static function lua_close(l:State):Void;
    
    @:native('luaL_ref')
    static function luaL_ref(l:State, i:Int):Int;
    @:native('lua_rawgeti')
    static function lua_rawgeti(l:State, i:Int, n:Int):Int;
    
    
    @:native('luaL_openlibs')
    static function luaL_openlibs(l:State):Void;
    @:native('linc::luaL::requiref')
    static function luaL_requiref(l:State, name:String, openf:cpp.Callable<State->Int>, global:Bool):Int;
    @:native('luaL_dostring')
    static function luaL_dostring(l:State, s:String):Int;
    
    @:native('lua_pcall')
    static function lua_pcall(l:State, nargs:Int, nresult:Int, errfunc:Int):Int;
    
    
    @:native('lua_gettop')
    static function lua_gettop(l:State):Int;
    @:native('lua_settop')
    static function lua_settop(l:State, i:Int):Int;
    @:native('lua_next')
    static function lua_next(l:State, i:Int):Int;
    @:native('lua_pop')
    static function lua_pop(l:State, i:Int):Void;
    @:native('lua_upvalueindex')
    static function lua_upvalueindex(i:Int):Int;
    @:native('lua_xmove')
    static function lua_xmove(from:State, to:State, n:Int):Void;
    
    
    @:native('lua_getglobal')
    static function lua_getglobal(l:State, name:String):Void;
    @:native('lua_setglobal')
    static function lua_setglobal(l:State, name:String):Void;
    @:native('lua_newtable')
    static function lua_newtable(l:State):Void;
    @:native('lua_createtable')
    static function lua_createtable(l:State, seqSize:Int, otherSize:Int):Void;
    @:native('lua_settable')
    static function lua_settable(l:State, i:Int):Void;
    
    @:native('lua_pushvalue')
    static function lua_pushvalue(from:State, i:Int):Void;
    @:native('lua_pushnil')
    static function lua_pushnil(l:State):Void;
    @:native('lua_pushnumber')
    static function lua_pushnumber(l:State, v:Float):Void;
    @:native('lua_pushinteger')
    static function lua_pushinteger(l:State, v:Int64):Void;
    @:native('lua_pushboolean')
    static function lua_pushboolean(l:State, v:Bool):Void;
    @:native('lua_pushstring')
    static function lua_pushstring(l:State, v:String):Void;
    @:native('lua_pushlightuserdata')
    static function lua_pushlightuserdata(l:State, v:cpp.Pointer<Void>):Void;
    @:native('linc::lua::pushcclosure')
    static function lua_pushcclosure(l:State, v:cpp.Callable<StateStar->Int>, n:Int):Void;
    @:native('lua_pushthread')
    static function lua_pushthread(l:State):Int;
    
    
    @:native('linc::lua::_typename')
    static function lua_typename(l:State, i:Int):String;
    @:native('lua_type')
    static function lua_type(l:State, i:Int):Int;
    
    @:native('lua_topointer')
    static function lua_topointer(l:State, i:Int):cpp.Pointer<Void>;
    @:native('lua_tonumber')
    static function lua_tonumber(l:State, i:Int):Float;
    @:native('lua_tointeger')
    static function lua_tointeger(l:State, i:Int):Int;
    @:native('linc::lua::toboolean')
    static function lua_toboolean(l:State, i:Int):Bool;
    @:native('linc::lua::tostring')
    static function lua_tostring(l:State, i:Int):String;
    @:native('linc::lua::tocfunction')
    static function lua_tocfunction(l:State, i:Int):cpp.Callable<StateStar->Int>;
    @:native('lua_tothread')
    static function lua_tothread(l:State, i:Int):State;
	
	@:native('lua_isinteger')
    static function lua_isinteger(l:State, i:Int):Bool;
    
} //Lua
