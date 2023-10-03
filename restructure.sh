
mkdir output
mkdir output/python_lib
mkdir output/dist_lib
cp -rf kivy_build/dist/xcframework output/
cp -rf kivy_build/dist/lib/* output/dist_lib
cp -rf kivy_build/dist/root/python3/lib/* output/python_lib


cp -rf kivy_build/dist/root/python3/include/python3.10 output/xcframework/libpython3.10.xcframework/ios-arm64/
cp -rf kivy_build/dist/root/python3/include/python3.10 output/xcframework/libpython3.10.xcframework/ios-x86_64-simulator/
cp -f PythonXc_Info.plist output/xcframework/libpython3.10.xcframework/Info.plist

cd output/xcframework

for FILE in *; 
    do 
        filename="$FILE"
        echo $filename
        zip -r "${filename%.*}".zip $FILE
        rm -rf $FILE
    done


