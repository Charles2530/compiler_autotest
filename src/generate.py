import os
import sys
CLANG_COMPILE_PREFIX = "clang -emit-llvm -S "
MARS_JAR = "compiler_project.jar"
# MARS_JAR = "Compiler_Techniques.jar"
LLVM_OUTPUT_PATH = "./out/llvm/"
MIPS_OUTPUT_PATH = "./out/mips/"
# clean all
os.system(" rm ./out/llvm/* ./out/mips/* 2>./out/error.log")
if len(sys.argv) > 1 and sys.argv[1] == "--llvm":
    # init
    os.system("cat ./testfile.txt > ./generation/testfile.c")
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/libsysy/libsysy.c -o " + LLVM_OUTPUT_PATH + "lib.ll -O0 2> " + LLVM_OUTPUT_PATH + "answer.err")
    # for answer
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/testfile.c -o " + LLVM_OUTPUT_PATH + "origin.ll -O0 2>> " + LLVM_OUTPUT_PATH + "answer.err")
    os.system("llvm-link " + LLVM_OUTPUT_PATH + "lib.ll " + LLVM_OUTPUT_PATH +
              "origin.ll -S -o " + LLVM_OUTPUT_PATH + "answer.ll 2>> " + LLVM_OUTPUT_PATH + "answer.err")
    os.system("lli " + LLVM_OUTPUT_PATH + "answer.ll < ./input.txt > " + LLVM_OUTPUT_PATH +
              "answer.out ; echo $? > " + LLVM_OUTPUT_PATH + "answer_return.out")
    # for testfile
    os.system(
        "rm " + LLVM_OUTPUT_PATH + "testfile.ll " + LLVM_OUTPUT_PATH + "testfile.out " + LLVM_OUTPUT_PATH + "testfile_return.out 2>./out/error.log")
    os.system("java -jar ./generation/" + MARS_JAR + " ")
    os.system("cat ./llvm_ir.txt > " + LLVM_OUTPUT_PATH + "llvm_ir.txt")
    os.system("cat ./debug_detail.txt > " +
              LLVM_OUTPUT_PATH + "debug_detail.txt")
    os.system("cat ./error.txt > " + LLVM_OUTPUT_PATH + "error.txt")
    os.system("cat ./llvm_ir.txt > " + LLVM_OUTPUT_PATH + "testfile_origin.ll")
    os.system("llvm-link " + LLVM_OUTPUT_PATH + "lib.ll " + LLVM_OUTPUT_PATH + "testfile_origin.ll -S -o " +
              LLVM_OUTPUT_PATH + "testfile.ll 2>> " + LLVM_OUTPUT_PATH + "testfile.err")
    os.system("lli " + LLVM_OUTPUT_PATH + "testfile.ll < ./input.txt > " + LLVM_OUTPUT_PATH +
              "testfile.out ; echo $? > " + LLVM_OUTPUT_PATH + "testfile_return.out")
    # clean
    os.system(
        "rm " + LLVM_OUTPUT_PATH + "lib.ll " + LLVM_OUTPUT_PATH + "origin.ll " + LLVM_OUTPUT_PATH + "testfile_origin.ll ./llvm_ir.txt ./mips.txt ./error.txt ./debug_detail.txt 2>./out/error.log")
elif len(sys.argv) > 1 and sys.argv[1] == "--mips":
    # init
    os.system("cat ./testfile.txt > ./generation/testfile.c")
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/libsysy/libsysy.c -o " + MIPS_OUTPUT_PATH + "lib.ll -O0 2> " + MIPS_OUTPUT_PATH + "answer.err")
    # for answer
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/testfile.c -o " + MIPS_OUTPUT_PATH + "origin.ll -O0 2>> " + MIPS_OUTPUT_PATH + "answer.err")
    os.system("llvm-link " + MIPS_OUTPUT_PATH + "lib.ll " + MIPS_OUTPUT_PATH +
              "origin.ll -S -o " + MIPS_OUTPUT_PATH + "linked.ll 2>> " + MIPS_OUTPUT_PATH + "answer.err")
    os.system("opt -O2 -mem2reg -inline -adce -gvn " + MIPS_OUTPUT_PATH + "linked.ll -S -o " +
              MIPS_OUTPUT_PATH + "answer.ll 2>> " + MIPS_OUTPUT_PATH + "answer.err")
    os.system("lli " + MIPS_OUTPUT_PATH + "answer.ll < ./input.txt > " + MIPS_OUTPUT_PATH +
              "answer.out ; echo $? > " + MIPS_OUTPUT_PATH + "answer_return.out")
    # for testfile
    os.system(
        "rm " + MIPS_OUTPUT_PATH + "testfile.out " + MIPS_OUTPUT_PATH + "testfile_return.out 2>./out/error.log")
    os.system("java -jar ./generation/" + MARS_JAR + " ")
    os.system("cat ./mips.txt > " + MIPS_OUTPUT_PATH + "mips.txt")
    os.system("cat ./debug_detail.txt > " +
              MIPS_OUTPUT_PATH + "testfile_details.txt")
    os.system("cat ./error.txt > " + MIPS_OUTPUT_PATH + "error.txt")
    os.system("java -jar generation/mars.jar out/mips/mips.txt nc < input.txt 1> " + MIPS_OUTPUT_PATH +
              "testfile.out 2> " + MIPS_OUTPUT_PATH + "testfile.err; echo $? > " + MIPS_OUTPUT_PATH + "testfile_return.out")
    os.system(
        "cat ./InstructionStatistics.txt > " + MIPS_OUTPUT_PATH + "testfile_statistics.txt")
    # clean
    os.system(
        "rm ./mips.txt ./debug_detail.txt ./llvm_ir.txt ./error.txt " + MIPS_OUTPUT_PATH + "lib.ll " + MIPS_OUTPUT_PATH + "linked.ll " + MIPS_OUTPUT_PATH + "origin.ll ./InstructionStatistics.txt 2>./out/error.log")
else:
    print("Invalid argument."+sys.argv[1])
os.system(" rm ./out/error.log")
