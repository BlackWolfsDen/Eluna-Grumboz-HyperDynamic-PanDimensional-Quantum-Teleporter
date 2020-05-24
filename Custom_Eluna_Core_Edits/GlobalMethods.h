      /**
       * Returns emulator .conf RealmID
       *
       * - for MaNGOS returns the realmID as it is in the conf file.
       * - for TrinityCore returns the realmID as it is in the conf file.
       * - Grumbo Was HERE !!
       * @return uint32 realm ID
       */
  #if defined(MANGOS)
      int GetRealmID(lua_State* L)
      {
          Eluna::Push(L, eWorld->GetRealmID());
          return 1;
      }
	#endif

  #if defined(TRINITY)
      int GetRealmID(lua_State* L)
      {
          Eluna::Push(L, sConfigMgr->GetIntDefault("RealmID", 1));
          return 1;
      }
	#endif
