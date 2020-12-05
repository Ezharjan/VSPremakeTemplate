-- Change the project name into yours.
workspace "[ProjectName]"
	architecture "x64"
	startproject "[ProjectName]"

	configurations
	{
		"Debug",
		"Release"
	}
	
	flags
	{
		"MultiProcessorCompile"
	}
	
	location "build"

outputdir = "%{cfg.buildcfg}"

project "[ProjectName]"
	location "build"
	kind "ConsoleApp"
	language "C++"
	cppdialect "C++17"

	targetdir (outputdir)
	objdir ("bin-int/" .. outputdir)
	
	includedirs
	{	
		"[ProjectName]/"
	}

	files
	{
		"[ProjectName]/**.h",
		"[ProjectName]/**.cpp"
	}

	defines
	{
		"_CRT_SECURE_NO_WARNINGS"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "off"
	
		includedirs
		{
	
		}
	
		defines
		{
	
		}
	
		links
		{
			-- Change here as your needs
			"gdi32.lib",
			"user32.lib",
			"winmm.lib"
		}
	
	filter "configurations:Debug"
		defines "_DEBUG"
		runtime	"Debug"
		symbols	"on"
	
	filter "configurations:Release"
		defines "_RELEASE"
		runtime	"Release"
		symbols	"on"
		optimize "Speed"