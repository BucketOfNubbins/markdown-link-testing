-- premake5.lua
-- Minimal premake configuration for a C++ console app.
-- Generate a Visual Studio solution with:  premake5 vs2022

workspace "MarkdownLinkTesting"
    configurations { "Debug", "Release" }
    location "build"            -- put generated .sln / .vcxproj here
    startproject "MarkdownLinkTesting"

project "MarkdownLinkTesting"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    targetdir "bin/%{cfg.buildcfg}"
    objdir "bin-int/%{cfg.buildcfg}"

    files {
        "src/**.h",
        "src/**.cpp",
        "docs/**.md"            -- include the markdown files in the solution
    }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
