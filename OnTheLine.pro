# allows to add DEPLOYMENTFOLDERS and links to the Felgo library and QtCreator auto-completion
CONFIG += felgo

# Project identifier and version
# More information: https://felgo.com/doc/felgo-publishing/#project-configuration
PRODUCT_IDENTIFIER = org.just-code.ontheline
PRODUCT_VERSION_NAME = 0.9
PRODUCT_VERSION_CODE = 1

VERSION = $${PRODUCT_VERSION_NAME}.$${PRODUCT_VERSION_CODE}

DEFINES += APP_VERSION='"\\\"$${VERSION}\\\""'

delivery {
    message("Building a delivery version.")

    DEFINES += DELIVERY_BUILD

    # for delivery all qml files are included in the resources file
    RESOURCES += resources.qrc

} else {
    message("Building a working version.")

    # in a working version qml folder is deployed instead of
    # the resources file for a faster compilation
    qmlFolder.source = qml
    DEPLOYMENTFOLDERS += qmlFolder

    assetsFolder.source = assets
    DEPLOYMENTFOLDERS += assetsFolder

    levelsFolder.source = levels
    DEPLOYMENTFOLDERS += levelsFolder
}

SOURCES += main.cpp

# platform related settings
android {
    ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
    OTHER_FILES += android/AndroidManifest.xml \
                   android/build.gradle
}
win32 {
    CONFIG -= debug_and_release debug_and_release_target
    RC_FILE += win/app_icon.rc
}
