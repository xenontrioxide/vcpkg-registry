vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO xenontrioxide/simple_error
    REF v1.0.0  # The tag or commit you want to download
    SHA512 06D03FDC455B189E81480F40BADF1B7E89B6CDEA2E7162C1551AFF7BCD90BE1EAB0FDFC1737B665FB2A13B4CE531C35FF398ADF1E6D7CFFB9EE32141DAB696ED  # The SHA512 hash of the tar.gz file from GitHub release
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_fixup_cmake_targets(CONFIG_PATH lib/cmake/${PORT})
vcpkg_copy_pdbs()
