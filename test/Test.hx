import vm.lua.Api.*;

class Test {
        
    static function main() {
        
        trace(VERSION);

        var l = luaL_newstate();
        
        var v:Dynamic = null;
        if(luaL_dostring(l, 'error("wrong")') == OK) {
            var lua_v:Int;
            while((lua_v = lua_gettop(l)) != 0) {
                v = lua_tonumber(l, lua_v);
                lua_pop(l, 1);
            }
            
        } else {
            v = lua_tostring(l, -1);
            lua_pop(l, 1);
        }
        
        
        trace(v);

    }

}