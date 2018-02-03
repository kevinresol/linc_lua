//hxcpp include should be first
#include <hxcpp.h>
#include <hx/CFFI.h>
#include "./linc_lua.h"

namespace linc {

    namespace luaL {
        void requiref(lua_State* l, const char* name, ::cpp::Function<int(lua_State*)> openf, bool global) {
            luaL_requiref(l, name, (lua_CFunction)openf, global ? 1 : 0);
        }
    }
    
    namespace lua {
        
        bool toboolean(lua_State* l, int i) {
            return lua_toboolean(l, i) != 0;
        }
        
        ::String tostring(lua_State* l, int i) {
            return ::String(lua_tostring(l, i));
        }
        
        ::String _typename(lua_State* l, int i) {
            return ::String(lua_typename(l, i));
        }
        
        void pushcclosure(lua_State* l, ::cpp::Function<int(lua_State*)> fn, int n) {
            lua_pushcclosure(l, (lua_CFunction)fn, n);
        }
        

    } //lua namespace

} //linc