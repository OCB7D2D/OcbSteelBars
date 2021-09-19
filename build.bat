xcopy mods\Resources build\A19_ocbSteelBars\Resources\ /E/H
xcopy mods\UIAtlases build\A19_ocbSteelBars\UIAtlases\ /E/H
xcopy mods\ConfigA19 build\A19_ocbSteelBars\Config\ /E/H
copy mods\ModInfo.xml build\A19_ocbSteelBars\ModInfo.xml
copy README.md build\A19_ocbSteelBars\README.md

xcopy mods\Resources build\UndeadLegacy_Y_ocbSteelBars\Resources\ /E/H
xcopy mods\UIAtlases build\UndeadLegacy_Y_ocbSteelBars\UIAtlases\ /E/H
xcopy mods\ConfigUlm build\UndeadLegacy_Y_ocbSteelBars\Config\ /E/H
copy mods\ModInfo.xml build\UndeadLegacy_Y_ocbSteelBars\ModInfo.xml
copy README.md build\UndeadLegacy_Y_ocbSteelBars\README.md

cd build

tar.exe -a -c -f ocbSteelBarsA19.zip A19_ocbSteelBars
tar.exe -a -c -f ocbSteelBarsULM.zip UndeadLegacy_Y_ocbSteelBars

cd ..

rmdir build\A19_ocbSteelBars /s /q
rmdir build\UndeadLegacy_Y_ocbSteelBars /s /q

pause