rem Taken from here: https://stackoverflow.com/questions/4405091/how-do-you-avoid-over-populating-the-path-environment-variable-in-windows

@echo off

SET MyPath=%PATH%
echo "Old PATH:"
echo %MyPath%
echo --------

setlocal EnableDelayedExpansion

SET TempPath="%MyPath:;=";"%"
SET var=
FOR %%a IN (%TempPath%) DO (
    IF exist %%~sa (
        SET "var=!var!;%%~sa"
    ) ELSE (
        echo %%a does not exist
    )
)

echo -------
echo "New PATH:"
echo %var%
setx PATH "%var%" /m
