@echo off

cd mods\A20ModApi

call MC7D2D OcbSteelBars.dll ^
  /reference:"%PATH_7D2D_MANAGED%\Assembly-CSharp.dll" *.cs && ^
echo Successfully compiled OcbSteelBars.dll

cd ..\..

pause