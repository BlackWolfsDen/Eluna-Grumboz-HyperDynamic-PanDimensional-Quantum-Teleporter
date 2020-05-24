     int GetRealmID(lua_State* L)
      {
          Eluna::Push(L, eWorld->GetRealmID());
          return 1;
      }
