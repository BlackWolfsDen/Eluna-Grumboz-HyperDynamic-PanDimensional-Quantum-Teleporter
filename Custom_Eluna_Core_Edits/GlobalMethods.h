      /**
       * Returns emulator .conf RealmID
       *
       * - For cMaNGOS returns the realmID as it is in the conf file.
       * - for MaNGOS returns the realmID as it is in the conf file.
       * - for TrinityCore returns the realmID as it is in the conf file.
       * - Grumbo Was HERE !!
       * @return uint32 realm ID
       */
      int GetRealmID(lua_State* L)
      {
          Eluna::Push(L, eWorld->GetRealmID());
          return 1;
      }
