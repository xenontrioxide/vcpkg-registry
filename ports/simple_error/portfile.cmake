vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO xenontrioxide/simple_error
    REF v1.0.0  # The tag or commit you want to download
    SHA512 12ab34cd56...  # The SHA512 hash of the tar.gz file from GitHub release
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})
vcpkg_copy_pdbs()
