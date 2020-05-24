      /**
       * Returns emulator .conf RealmID
       *
       * - For cMaNGOS returns the realmID as it is in the conf file.
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
          Eluna::Push(L, rbac::RBACData::_realmId);
          return 1;
      }
	#endif
