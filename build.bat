@echo off
SET VENV_DIR=venv
SET SCRIPT_NAME=build.py

:: Space separated
SET PACKAGES=freetype-py

if not exist %VENV_DIR% (
    echo Creating virtual environment
    call python.exe -m venv %VENV_DIR%
)

call %VENV_DIR%\Scripts\activate.bat

call python.exe -m pip install --upgrade pip
for %%p in (%PACKAGES%) do (
    call pip.exe install %%p
)

call python.exe %SCRIPT_NAME%

call deactivate.bat

pause
