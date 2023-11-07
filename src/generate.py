import os
import sys
CLANG_COMPILE_PREFIX = "clang -emit-llvm -S "
if len(sys.argv) > 1 and sys.argv[1] == "--llvm":
    # init
    os.system("cat ./testfile.txt > ./generation/testfile.c")
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/libsysy/libsysy.c -o ./out/llvm/lib.ll -O0 2> ./out/llvm/answer.err")
    # for answer
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/testfile.c -o ./out/llvm/origin.ll -O0 2>> ./out/llvm/answer.err")
    os.system("llvm-link ./out/llvm/lib.ll ./out/llvm/origin.ll -S -o ./out/llvm/answer.ll 2>> ./out/llvm/answer.err")
    os.system("lli ./out/llvm/answer.ll < ./input.txt > ./out/llvm/answer.out ; echo $? > ./out/llvm/answer_return.out")
    # for testfile
    os.system("rm ./out/llvm/testfile.ll ./out/llvm/testfile.out ./out/llvm/testfile_return.out 2> ./out/llvm/testfile.err")
    os.system("java -jar ./generation/compiler_project.jar ")
    os.system("cat ./llvm_ir.txt > ./out/llvm/llvm_ir.txt")
    os.system("cat ./debug_detail.txt > ./out/llvm/debug_detail.txt")
    os.system("cat ./llvm_ir.txt > ./out/llvm/testfile_origin.ll")
    os.system("llvm-link ./out/llvm/lib.ll ./out/llvm/testfile_origin.ll -S -o ./out/llvm/testfile.ll 2>> ./out/llvm/testfile.err")
    os.system("lli ./out/llvm/testfile.ll < ./input.txt > ./out/llvm/testfile.out ; echo $? > ./out/llvm/testfile_return.out")
    # clean
    os.system(
        "rm ./out/llvm/lib.ll ./out/llvm/origin.ll ./out/llvm/testfile_origin.ll ./llvm_ir.txt ./mips.txt ./debug_detail.txt")
elif len(sys.argv) > 1 and sys.argv[1] == "--mips":
    # init
    os.system("cat ./testfile.txt > ./generation/testfile.c")
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/libsysy/libsysy.c -o ./out/mips/lib.ll -O0 2> ./out/mips/answer.err")
    # for answer
    os.system(CLANG_COMPILE_PREFIX +
              "./generation/testfile.c -o ./out/mips/origin.ll -O0 2>> ./out/mips/answer.err")
    os.system("llvm-link ./out/mips/lib.ll ./out/mips/origin.ll -S -o ./out/mips/linked.ll 2>> ./out/mips/answer.err")
    os.system("opt -O2 -mem2reg -inline -adce -gvn ./out/mips/linked.ll -S -o ./out/mips/answer.ll 2>> ./out/mips/answer.err")
    os.system("lli ./out/mips/answer.ll < ./input.txt > ./out/mips/answer.out ; echo $? > ./out/mips/answer_return.out")
    # for testfile
    os.system("rm ./out/mips/testfile.out ./out/mips/testfile_return.out ")
    os.system("java -jar ./generation/compiler_project.jar ")
    os.system("cat ./mips.txt > ./out/mips/mips.txt")
    os.system("cat ./debug_detail.txt > ./out/mips/testfile_details.txt")
    os.system("java -jar generation/mars.jar out/mips/mips.txt nc < input.txt 1> ./out/mips/testfile.out 2> ./out/mips/testfile.err; echo $? > ./out/mips/testfile_return.out")
    os.system(
        "cat ./InstructionStatistics.txt > ./out/mips/testfile_statistics.txt")
    # clean
    os.system(
        "rm ./mips.txt ./debug_detail.txt ./llvm_ir.txt ./out/mips/lib.ll ./out/mips/linked.ll ./out/mips/origin.ll ./InstructionStatistics.txt")
else:
    print("Invalid argument."+sys.argv[1])
