# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = org.just-code.ontheline
PRODUCT_VERSION_NAME = 1.0
PRODUCT_VERSION_CODE = 1

delivery {
    message("Building a delivery version.")

    DEFINES += DELIVERY_BUILD

    # for delivery all qml files are included in the resources file
    RESOURCES += resources.qrc

} else {
    message("Building a working version.")

    # in a working wersion qml folder is deploy instead of
    # the resources file for a faster compliation
    qmlFolder.source = qml
    DEPLOYMENTFOLDERS += qmlFolder

    assetsFolder.source = assets
    DEPLOYMENTFOLDERS += assetsFolder
}

SOURCES += main.cpp

# platform related settings
android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml       android/build.gradle
}
win32 {
    CONFIG -= debug_and_release debug_and_release_target
    RC_FILE += win/app_icon.rc
}
