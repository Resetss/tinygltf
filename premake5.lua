project "TinyGLTF"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    staticruntime "off"
    
    -- Enable multi-core compilation
    flags { "MultiProcessorCompile" }
    
    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    files
    {
        "tiny_gltf.h",
        "tiny_gltf.cc",
        "stb_image.h",
        "stb_image_write.h"
    }
    
    -- Platform-specific settings
    filter "system:windows"
        systemversion "latest"
        
    filter "system:linux"
        pic "On"
        systemversion "latest"
        
    filter "system:macosx"
        systemversion "latest"
        
    -- Configuration-specific settings
    filter "configurations:Debug"
        runtime "Debug"
        symbols "On"
        defines { "DEBUG" }
        
    filter "configurations:Release"
        runtime "Release"
        optimize "On"
        defines { "NDEBUG" }
        
    filter "configurations:Dist"
        runtime "Release"
        optimize "On"
        symbols "Off"
        defines { "NDEBUG", "DIST_BUILD" }
        
    -- Clear filters
    filter {}