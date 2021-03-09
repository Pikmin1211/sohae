
@echo off

set "base_dir=%~dp0"
set "source_rom=%~dp0SoHaE.gba"
set "main_event=%~dp0ROM Buildfile.event"
set "target_rom=%~dp0SoHaE_EngTrans.gba"
set "target_ups=%~dp0SoHaE_EngTrans.ups"
set "ups=%~dp0Tools\ups\ups"

echo:
echo Copying ROM...
echo:

copy "%source_rom%" "%target_rom%"

echo:
echo Compiling...
echo:

cd "%base_dir%EventAssembler"
ColorzCore A FE7 "-output:%target_rom%" "-input:%main_event%" "--nocash-sym" "--build-times"

echo:
echo Generating patch...
echo:

cd "%base_dir%"
"%ups%" diff -b "%source_rom%" -m "%target_rom%" -o "%target_ups%"

echo Done!
echo:

pause
