--
-- Name:        android/_preload.lua
-- Purpose:     Define the Android API's.
-- Author:      Manu Evans
-- Copyright:   (c) 2013-2015 Manu Evans and the Premake project
--

	local p = premake
	local api = p.api

--
-- Register the Android extension
--

	p.ANDROID = "android"

	api.addAllowed("system", p.ANDROID)
	api.addAllowed("architecture", { "armv5", "armv7", "aarach64", "mips", "mips64", "x86" })
	api.addAllowed("vectorextensions", { "NEON", "MXU" })
	api.addAllowed("flags", { "Thumb" })

	-- TODO: can I api.addAllowed() a key-value pair?
	local os = p.fields["os"];
	if os ~= nil then
		table.insert(sys.allowed, { "android",  "Android" })
	end

--
-- Register Android properties
--

	api.register {
		name = "toolchainversion",
		scope = "config",
		kind = "string",
		allowed = {
			"gcc 4.6", -- NDK GCC versions
			"gcc 4.8",
			"gcc 4.9",
			"clang 3.4", -- NDK clang versions
			"clang 3.5",
			"clang 3.6"
		},
	}

	api.register {
		name = "androidapilevel",
		scope = "config",
		kind = "integer",
	}

	api.register {
		name = "stl",
		scope = "config",
		kind = "string",
		allowed = {
			"minimal c++ (system)",
			"c++ static",
			"c++ shared",
			"stlport static",
			"stlport shared",
			"gnu stl static",
			"gnu stl shared",
			"llvm libc++ static",
			"llvm libc++ shared"
		},
	}

	api.register {
		name = "thumbmode",
		scope = "config",
		kind = "string",
		allowed = {
			"thumb",
			"arm",
			"disabled"
		}
	}

	api.register {
		name = "floatabi",
		scope = "config",
		kind = "string",
		allowed = {
			"soft",
			"softfp",
			"hard",
		},
	}
