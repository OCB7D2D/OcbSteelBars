xcopy mods\Resources build\OcbSteelBarsA21EAC\Resources\ /E/H
xcopy mods\UIAtlases build\OcbSteelBarsA21EAC\UIAtlases\ /E/H
xcopy mods\ConfigA21 build\OcbSteelBarsA21EAC\Config\ /E/H
copy mods\ModInfo.xml build\OcbSteelBarsA21EAC\ModInfo.xml
sed "s/,bullet//g" mods\ConfigA21\blocks.xml > build\OcbSteelBarsA21EAC\Config\blocks.xml
copy README.md build\OcbSteelBarsA21EAC\README.md

xcopy mods\Resources build\OcbSteelBarsA21NonEAC\Resources\ /E/H
xcopy mods\UIAtlases build\OcbSteelBarsA21NonEAC\UIAtlases\ /E/H
xcopy mods\ConfigA21 build\OcbSteelBarsA21NonEAC\Config\ /E/H
copy mods\ModInfo.xml build\OcbSteelBarsA21NonEAC\ModInfo.xml
copy mods\A21ModApi\OcbSteelBars.dll build\OcbSteelBarsA21NonEAC\OcbSteelBars.dll
copy README.md build\OcbSteelBarsA21NonEAC\README.md

REM xcopy mods\Resources build\UndeadLegacy_Y_OcbSteelBarsA21\Resources\ /E/H
REM xcopy mods\UIAtlases build\UndeadLegacy_Y_OcbSteelBarsA21\UIAtlases\ /E/H
REM xcopy mods\ConfigUlm build\UndeadLegacy_Y_OcbSteelBarsA21\Config\ /E/H
REM copy mods\ModInfo.xml build\UndeadLegacy_Y_OcbSteelBarsA21\ModInfo.xml
REM copy mods\A21ModApi\OcbSteelBars.dll build\UndeadLegacy_Y_OcbSteelBarsA21\OcbSteelBars.dll
REM copy README.md build\UndeadLegacy_Y_OcbSteelBarsA21\README.md

cd build

tar.exe -a -c -f OcbSteelBarsA21EAC.zip OcbSteelBarsA21EAC
tar.exe -a -c -f OcbSteelBarsA21NonEAC.zip OcbSteelBarsA21NonEAC
REM tar.exe -a -c -f OcbSteelBarsA21ULM.zip UndeadLegacy_Y_OcbSteelBarsA21

cd ..

rmdir build\OcbSteelBarsA21EAC /s /q
rmdir build\OcbSteelBarsA21NonEAC /s /q
REM rmdir build\UndeadLegacy_Y_OcbSteelBarsA21 /s /q

pause