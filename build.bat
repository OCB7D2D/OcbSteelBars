xcopy mods\Resources build\OcbSteelBarsA19EAC\Resources\ /E/H
xcopy mods\UIAtlases build\OcbSteelBarsA19EAC\UIAtlases\ /E/H
xcopy mods\ConfigA19 build\OcbSteelBarsA19EAC\Config\ /E/H
copy mods\ModInfo.xml build\OcbSteelBarsA19EAC\ModInfo.xml
sed "s/,bullet//g" mods\ConfigA19\blocks.xml > build\OcbSteelBarsA19EAC\Config\blocks.xml
copy README.md build\OcbSteelBarsA19EAC\README.md

xcopy mods\Resources build\OcbSteelBarsA19NonEAC\Resources\ /E/H
xcopy mods\UIAtlases build\OcbSteelBarsA19NonEAC\UIAtlases\ /E/H
xcopy mods\ConfigA19 build\OcbSteelBarsA19NonEAC\Config\ /E/H
copy mods\ModInfo.xml build\OcbSteelBarsA19NonEAC\ModInfo.xml
mkdir build\OcbSteelBarsA19NonEAC\Harmony
copy mods\Harmony\*.dll build\OcbSteelBarsA19NonEAC\Harmony\
copy README.md build\OcbSteelBarsA19NonEAC\README.md

xcopy mods\Resources build\OcbSteelBarsA20EAC\Resources\ /E/H
xcopy mods\UIAtlases build\OcbSteelBarsA20EAC\UIAtlases\ /E/H
xcopy mods\ConfigA20 build\OcbSteelBarsA20EAC\Config\ /E/H
copy mods\ModInfo.xml build\OcbSteelBarsA20EAC\ModInfo.xml
sed "s/,bullet//g" mods\ConfigA20\blocks.xml > build\OcbSteelBarsA20EAC\Config\blocks.xml
copy README.md build\OcbSteelBarsA20EAC\README.md

xcopy mods\Resources build\OcbSteelBarsA20NonEAC\Resources\ /E/H
xcopy mods\UIAtlases build\OcbSteelBarsA20NonEAC\UIAtlases\ /E/H
xcopy mods\ConfigA20 build\OcbSteelBarsA20NonEAC\Config\ /E/H
copy mods\ModInfo.xml build\OcbSteelBarsA20NonEAC\ModInfo.xml
copy mods\A20ModApi\OcbSteelBars.dll build\OcbSteelBarsA20NonEAC\OcbSteelBars.dll
copy README.md build\OcbSteelBarsA20NonEAC\README.md

xcopy mods\Resources build\UndeadLegacy_Y_OcbSteelBars\Resources\ /E/H
xcopy mods\UIAtlases build\UndeadLegacy_Y_OcbSteelBars\UIAtlases\ /E/H
xcopy mods\ConfigUlm build\UndeadLegacy_Y_OcbSteelBars\Config\ /E/H
copy mods\ModInfo.xml build\UndeadLegacy_Y_OcbSteelBars\ModInfo.xml
copy README.md build\UndeadLegacy_Y_OcbSteelBars\README.md

cd build

tar.exe -a -c -f OcbSteelBarsA19EAC.zip OcbSteelBarsA19EAC
tar.exe -a -c -f OcbSteelBarsA19NonEAC.zip OcbSteelBarsA19NonEAC
tar.exe -a -c -f OcbSteelBarsA20EAC.zip OcbSteelBarsA20EAC
tar.exe -a -c -f OcbSteelBarsA20NonEAC.zip OcbSteelBarsA20NonEAC
tar.exe -a -c -f OcbSteelBarsULM.zip UndeadLegacy_Y_OcbSteelBars

cd ..

rmdir build\OcbSteelBarsA19EAC /s /q
rmdir build\OcbSteelBarsA19NonEAC /s /q
rmdir build\OcbSteelBarsA20EAC /s /q
rmdir build\OcbSteelBarsA20NonEAC /s /q
rmdir build\UndeadLegacy_Y_OcbSteelBars /s /q

pause