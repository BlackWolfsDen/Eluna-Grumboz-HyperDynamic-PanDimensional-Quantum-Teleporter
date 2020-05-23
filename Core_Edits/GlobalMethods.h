  #if defined(MANGOS) || (CMANGOS)
      /**
       * Returns emulator mangosd.conf RealmID
       *
       * - For cMaNGOS returns the realmID as it is in the conf file.
       * - for MaNGOS returns the realmID as it is in the conf file.
       * - Grumbo Was HERE !!
       * @return string version
       */
      int GetRealmID(lua_State* L)
      {
          Eluna::Push(L, eWorld->GetRealmID());
          return 1;
      }
  #endif
