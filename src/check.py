import sys
import os
from colorfulPrint import ColorfulPrint
if len(sys.argv) > 1 and sys.argv[1] == "--llvm":
    with open("./out/llvm/answer.out", "r") as f:
        with open("./out/llvm/testfile.out", "r") as g:
            line = 1
            while True:
                answer = f.readline()
                testfile = g.readline()
                if not answer and not testfile:
                    break
                if answer == testfile:
                    line += 1
                else:
                    ColorfulPrint.colorfulPrint("===== WA in line: "+str(line)+" =====", ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_RED)
                    ColorfulPrint.colorfulPrint("answer:"+str(answer), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                    ColorfulPrint.colorfulPrint("testfile:"+str(testfile), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                    sys.exit(1)
    with open("./out/llvm/answer_return.out", "r") as f:
        with open("./out/llvm/testfile_return.out", "r") as g:
            answer = f.read()
            testfile = g.read()
            if(answer == testfile):
                ColorfulPrint.colorfulPrint('===== Accepted =====', ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_BLUE)
            else:
                ColorfulPrint.colorfulPrint('===== WA in return value =====', ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_RED)
                ColorfulPrint.colorfulPrint("answer:"+str(answer), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                ColorfulPrint.colorfulPrint("testfile:"+str(testfile), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                sys.exit(1)
elif len(sys.argv) > 1 and sys.argv[1] == "--mips":
    with open("./out/mips/answer.out", "r") as f:
        with open("./out/mips/testfile.out", "r") as g:
            line = 1
            while True:
                answer = f.readline()
                testfile = g.readline()
                if not answer and not testfile:
                    break
                if answer == testfile:
                    line += 1
                else:
                    ColorfulPrint.colorfulPrint("===== WA in line: "+str(line)+" =====", ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_RED)
                    ColorfulPrint.colorfulPrint("answer:"+str(answer), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                    ColorfulPrint.colorfulPrint("testfile:"+str(testfile), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                    sys.exit(1)
    with open("./out/mips/answer_return.out", "r") as f:
        with open("./out/mips/testfile_return.out", "r") as g:
            answer = f.read()
            testfile = g.read()
            if(answer == testfile):
                ColorfulPrint.colorfulPrint('===== Accepted =====', ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_BLUE)
            else:
                ColorfulPrint.colorfulPrint('===== WA in return value =====', ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_RED)
                ColorfulPrint.colorfulPrint("answer:"+str(answer), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                ColorfulPrint.colorfulPrint("testfile:"+str(testfile), ColorfulPrint.MODE_BOLD, ColorfulPrint.COLOR_YELLOW)
                sys.exit(1)
else:
    print("Invalid argument."+sys.argv[1])