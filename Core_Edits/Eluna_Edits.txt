This teleporter requires a custom method for Eluna.
I sent a pull request to make it a perm method for future.
But until then it will need to be added manually to your core Eluna Module.


Eluna/GlobalMethods.h  -  around line 80

  #if defined(MANGOS) || (CMANGOS)
      /**
       * Returns emulator mangosd.conf RealmID
       *
       * - For cMaNGOS returns the realmID as it is in the conf file.
       * - for MaNGOS returns the realmID as it is in the conf file.
       *
       * @return string version
       */
      int GetRealmID(lua_State* L)
      {
          Eluna::Push(L, eWorld->GetRealmID());
          return 1;
      }
  #endif


Eluna/LuaFunctions.cpp  -  around line 78

    { "GetRealmID", &LuaGlobalFunctions::GetRealmID },
