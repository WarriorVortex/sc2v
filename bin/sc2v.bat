@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
    echo SystemC 2 Verilog converter
    echo Usage: %~n0 ^<Module name without extension^>
    exit /b 1
)

set "MODULE=%~1"
set "SCRIPT_DIR=%~dp0"

if not exist "%MODULE%.cpp" (
    echo Can't find %MODULE%.cpp
    exit /b 1
)
if not exist "%MODULE%.h" (
    echo Can't find %MODULE%.h
    exit /b 1
)

echo Processing %MODULE%
call "%SCRIPT_DIR%\sc2v_step1.exe" < "%MODULE%.cpp" || exit /b 1

echo Processing %MODULE%.h
call "%SCRIPT_DIR%\sc2v_step2.exe" < "%MODULE%.h" > "%MODULE%.sc2v" || exit /b 1

echo Generating verilog file
call "%SCRIPT_DIR%\sc2v_step3.exe" < "%MODULE%.sc2v" > "%MODULE%.v" || exit /b 1

echo Done

del "%MODULE%.sc2v" 2>nul
del *.sc2v 2>nul
endlocal