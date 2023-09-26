:: Stop on error
@echo off
setlocal EnableDelayedExpansion

:: Install Anaconda
curl https://repo.anaconda.com/archive/Anaconda3-2023.07-2-Windows-x86_64.exe -o %USERPROFILE%\anaconda3_installer.exe
start /wait "" %USERPROFILE%\anaconda3_installer.exe /InstallationType=JustMe /AddToPath=0 /S /D=%USERPROFILE%\anaconda3
set PATH=%USERPROFILE%\anaconda3\Scripts;%PATH%

:: Update Anaconda
conda update -n base -c conda-forge conda

:: Verify Anaconda Installation
conda --version
python --version

:: Download conda-3-10-env.yaml from URL
curl https://raw.githubusercontent.com/jasonstrimpel/quant-stack/main/quant-stack-3-10-env.yaml -o quant-stack-3-10-env.yaml

:: Create my_quant_lab Virtual Environment
conda env create -n quant_lab --file quant-stack-3-10-env.yaml

:: Activate my_quant_lab Virtual Environment
call conda activate quant_lab

:: Install Additional Stack Packages
pip install pyfolio-reloaded==0.9.5 alphalens-reloaded==0.4.3 quantstats==0.0.62 --no-deps
pip install zipline-reloaded==3.0.3
pip uninstall bottleneck -y

:: End of Script