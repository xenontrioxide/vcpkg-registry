vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO xenontrioxide/simple_error
    REF v1.1.0  # The tag or commit you want to download
    SHA512 7721AF31D839BAA804374E89CCF70F6C0224ADB04ADC1C9E6244ABB2E1C656AC14EEF7E68FA729D34DD93FF32A0D3B2D971B2E4168FAF3B0CB4C3BCED8FC4E82  # The SHA512 hash of the tar.gz file from GitHub release
    HEAD_REF main
)

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
)

file(GLOB MODULE_INTERFACE_FILES "${SOURCE_PATH}/*.ixx")
file(COPY ${MODULE_INTERFACE_FILES} DESTINATION ${CURRENT_PACKAGES_DIR}/include/${PORT})

if(EXISTS "${CURRENT_PACKAGES_DIR}/include/${PORT}/error.ixx")
    message(STATUS "Module interface file installed successfully.")
else()
    message(FATAL_ERROR "Module interface file missing from the install directory.")
endif()

message(STATUS "Installation of ${PORT} complete.")