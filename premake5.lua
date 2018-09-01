solution "libuv-tutorial"

	filter ('system:not ' .. premake.MACOSX)
	linkgroups 'On'
	filter {}

	location "build"
	targetdir "bin"
	
	configurations { "Debug", "Release" }

	for _, f in ipairs (os.matchfiles ("*.c"))
	do
		local projectName = path.getbasename (f)
	
		project (projectName)
		language "C"
		cdialect "gnu99"
		kind "ConsoleApp"
		if projectName:startswith ("plugin") then kind ("SharedLib") end
		files { f }
		links { "uv" }
		if projectName == "uvwget"
		then
			links { "curl" }
		end
	end
