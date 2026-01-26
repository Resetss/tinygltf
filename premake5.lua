-- TinyGLTF Premake5 Build Configuration

project "TinyGLTF"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "Off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files {
        "tiny_gltf.h",
        "tiny_gltf.cc",
        "stb_image.h",
        "stb_image_write.h",
        "json.hpp"
    }

    includedirs {
        "."
    }

    filter "system:windows"
        systemversion "latest"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
