#pragma once

//hxcpp include should always be first    
#include <hxcpp.h>
#include <hx/CFFI.h>

//include other library includes as needed
#include "../lib/lua-5.3.4/src/lua.hpp"

namespace linc {

    namespace luaL {
        
        void requiref(lua_State* l, const char* name, ::cpp::Function<int(lua_State*)> openf, bool global);
        
    } //lua namespace
    
    namespace lua {
        
        extern bool toboolean(lua_State* l, int i);
        extern ::String tostring(lua_State* l, int i);
        extern ::String _typename(lua_State* l, int i);
        extern ::cpp::Function<int(::cpp::Pointer<lua_State>)> tocfunction(lua_State* l, int i);
        extern void pushcclosure(lua_State* l, ::cpp::Function<int(lua_State*)> fn, int n);

    } //lua namespace

} //linc