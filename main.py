import os
import sys
from src.colorfulPrint import ColorfulPrint
Data_path_prefix = "./data/"
if len(sys.argv) > 1:  
    if sys.argv[1] == "--llvm":   
        ColorfulPrint.colorfulPrint("===== Test ./testfile.txt =====", ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_PINK)
        os.system("python3 ./src/generate.py --llvm")  
        os.system("python3 ./src/check.py --llvm") 
    elif sys.argv[1] == "--mips":
        ColorfulPrint.colorfulPrint("===== Test ./testfile.txt =====", ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_PINK)
        os.system("python3 ./src/generate.py --mips")  
        os.system("python3 ./src/check.py --mips") 
    elif sys.argv[1] == "--test":
        if len(sys.argv) > 3:
            testfile = sys.argv[3]
            if os.path.exists(testfile):
                inputfile = testfile.replace("testfile", "input")
                if os.path.exists(inputfile):
                    os.system("cat "+inputfile+" > ./input.txt")
                ColorfulPrint.colorfulPrint("===== Test "+testfile+" =====", ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_PINK)
                os.system("cat "+testfile+" > ./testfile.txt")
                os.system("python3 ./src/generate.py "+ sys.argv[2])  
                os.system("python3 ./src/check.py "+ sys.argv[2])
            else:
                print("File not found.")
        else:
            path_dir = "./data"
            for root, dirs, files in os.walk(path_dir):
                for file in files:
                    if file.startswith("testfile") and file.endswith(".txt"):
                        inputfile = file.replace("testfile", "input")
                        path = os.path.join(root, file)
                        if inputfile in files:
                            os.system("cat ./data/"+inputfile+" > ./input.txt")
                        ColorfulPrint.colorfulPrint("===== Test "+path+" =====", ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_PINK)
                        os.system("cat "+path+" > ./testfile.txt")
                        os.system("python3 ./src/generate.py "+sys.argv[2])  
                        os.system("python3 ./src/check.py "+sys.argv[2])
    elif sys.argv[1] == "--version":
        print("Version: 1.0.0")
    elif sys.argv[1] == "--help":
        print("Usage: python3 main.py [option]")
        print("Options:")
        print("  --llvm: auto test testfile.txt by llvm")
        print("  --mips: auto test testfile.txt by mips")
        print("  --test [type] [testfile]: test testfile, default test all testfile.txt in ./data")
        print("  --version: show version")
        print("  --help: show help")
    else :  
        print("Invalid argument."+sys.argv[1])
# argv[1] == "--llvm"
else:  
    ColorfulPrint.colorfulPrint("===== Test ./testfile.txt =====", ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_PINK)
    os.system("python3 ./src/generate.py --llvm")  
    os.system("python3 ./src/check.py --llvm")  
