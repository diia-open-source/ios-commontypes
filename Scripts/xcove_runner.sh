#!/bin/bash

# Define a constants
OUTPUT_FILE="../../xcove_output"
PACKAGE_PATH="../.swiftpm/xcode/package.xcworkspace"
SCHEME="DiiaCommonTypes"
DERIVED_DATA_PATH="../../DerivedData"
TEST_RESULTS="${DERIVED_DATA_PATH}/Logs/Test"
DESTINATION='platform=iOS Simulator,name=iPhone 14,OS=latest' # verify that your xcodebuild version can use this simulator or set a simulator you need

# color constants
bright_red="\033[1;31;40m"
green="\033[42m"
brown="\033[43m"
none="\033[0m"

# ------------------- Preparating stage ---------------------------
# Ensure that xcov is installed and available in your machine
# Check the presence of xcov
if !command -v xcov &> /dev/null; then
    echo "xcov not found. Please install it before running this script."
    exit 1
fi

# Clean indicated directories if they exist or create if not
for directory in "$TEST_RESULTS" "$OUTPUT_FILE"; do
    rm -rf "$directory"
    mkdir -p "$directory"
done

# ------------------- Performing stage ---------------------------
# Perform build to download and install all package dependencies
xcodebuild build -workspace "$PACKAGE_PATH" -scheme "$SCHEME" -derivedDataPath "$DERIVED_DATA_PATH" -resolvePackageDependencies

# Check the exit status of the build
BUILD_STATUS=$?

# Run tests to get a coverage report
if [ $BUILD_STATUS -eq 0 ]; then
  xcodebuild test -workspace "$PACKAGE_PATH" -scheme "$SCHEME" -destination "$DESTINATION" -derivedDataPath "$DERIVED_DATA_PATH" -quiet # remove -quiet if you need more logs
else
  echo "Build failed. Skipping tests and xcov."
  exit 1
fi

# Check the exit status of the tests
TEST_STATUS=$?

# Run xcov if tests passed
if [ $TEST_STATUS -eq 0 ]; then
    xcov -w "$PACKAGE_PATH" -o "$OUTPUT_FILE" -s "$SCHEME" --derived_data_path "$DERIVED_DATA_PATH"
else
  echo $bright_red"Tests failed. Skipping xcov." $none
fi
