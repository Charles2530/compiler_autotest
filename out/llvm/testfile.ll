; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"%d:\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c" %d\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@s_0 = constant [2 x i8] c" \00"
@s_1 = constant [2 x i8] c"\0A\00"
@g_a = dso_local global [510 x i32] zeroinitializer
@g_prime = dso_local global [510 x i32] zeroinitializer
@g_reflect1 = dso_local global [16 x i32] [i32 -711942876, i32 -1060809599, i32 1758839997, i32 423174272, i32 1412407466, i32 375872692, i32 1543568839, i32 915987033, i32 698198080, i32 -2143283456, i32 2059223660, i32 -34179219, i32 378910912, i32 1498631475, i32 -1853883889, i32 1640319187]
@g_reflect2 = dso_local global [5 x [5 x i32]] [[5 x i32] [i32 -1152785601, i32 1891446969, i32 938484211, i32 -1596516698, i32 1681072330], [5 x i32] [i32 128222498, i32 1090169129, i32 -347746822, i32 -326257601, i32 -1366930863], [5 x i32] [i32 -823961496, i32 2103453081, i32 -402114823, i32 2139806715, i32 -732814375], [5 x i32] [i32 1302967469, i32 1623817872, i32 898372270, i32 -812618050, i32 -1403178881], [5 x i32] [i32 -1776328495, i32 958769364, i32 47496017, i32 -1384738865, i32 1751940200]]

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getint() #0 {
  %1 = alloca i32, align 4
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %1)
  %3 = load i32, i32* %1, align 4
  ret i32 %3
}

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getch() #0 {
  %1 = alloca i8, align 1
  %2 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i8* noundef %1)
  %3 = load i8, i8* %1, align 1
  %4 = sext i8 %3 to i32
  ret i32 %4
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getarray(i32* noundef %0) #0 {
  %2 = alloca i32*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32* %0, i32** %2, align 8
  %5 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %3)
  store i32 0, i32* %4, align 4
  br label %6

6:                                                ; preds = %16, %1
  %7 = load i32, i32* %4, align 4
  %8 = load i32, i32* %3, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %19

10:                                               ; preds = %6
  %11 = load i32*, i32** %2, align 8
  %12 = load i32, i32* %4, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds i32, i32* %11, i64 %13
  %15 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32* noundef %14)
  br label %16

16:                                               ; preds = %10
  %17 = load i32, i32* %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, i32* %4, align 4
  br label %6, !llvm.loop !6

19:                                               ; preds = %6
  %20 = load i32, i32* %3, align 4
  ret i32 %20
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putint(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 noundef %3)
  ret void
}

declare i32 @printf(i8* noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putch(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i64 0, i64 0), i32 noundef %3)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putarray(i32 noundef %0, i32* noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i32* %1, i32** %4, align 8
  %6 = load i32, i32* %3, align 4
  %7 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i64 0, i64 0), i32 noundef %6)
  store i32 0, i32* %5, align 4
  br label %8

8:                                                ; preds = %19, %2
  %9 = load i32, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %9, %10
  br i1 %11, label %12, label %22

12:                                               ; preds = %8
  %13 = load i32*, i32** %4, align 8
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds i32, i32* %13, i64 %15
  %17 = load i32, i32* %16, align 4
  %18 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0), i32 noundef %17)
  br label %19

19:                                               ; preds = %12
  %20 = load i32, i32* %5, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, i32* %5, align 4
  br label %8, !llvm.loop !8

22:                                               ; preds = %8
  %23 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0))
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @putstr(i8* noundef %0) #0 {
  %2 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %3 = load i8*, i8** %2, align 8
  %4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i8* noundef %3)
  ret void
}

define dso_local i32 @main() {
main_block_label_0:
  %v_0 = alloca i32, align 4
  store i32 2, i32* %v_0, align 4
  %v_1 = alloca i32, align 4
  %v_2 = call i32 @getint()
  store i32 %v_2, i32* %v_1, align 4
  br label %main_block_label_1

main_block_label_1:                               ; preds = %main_block_label_2, %main_block_label_0
  %v_3 = load i32, i32* %v_0, align 4
  %v_4 = load i32, i32* %v_1, align 4
  %v_5 = icmp slt i32 %v_3, %v_4
  br i1 %v_5, label %main_block_label_2, label %main_block_label_3

main_block_label_2:                               ; preds = %main_block_label_1
  %v_6 = load i32, i32* %v_0, align 4
  %v_7 = load i32, i32* %v_0, align 4
  %v_8 = getelementptr inbounds [510 x i32], [510 x i32]* @g_a, i32 0, i32 %v_7
  store i32 1, i32* %v_8, align 4
  %v_9 = load i32, i32* %v_0, align 4
  %v_10 = add i32 %v_9, 1
  store i32 %v_10, i32* %v_0, align 4
  br label %main_block_label_1

main_block_label_3:                               ; preds = %main_block_label_1
  store i32 2, i32* %v_0, align 4
  %v_11 = alloca i32, align 4
  store i32 0, i32* %v_11, align 4
  br label %main_block_label_4

main_block_label_4:                               ; preds = %main_block_label_11, %main_block_label_3
  %v_12 = load i32, i32* %v_0, align 4
  %v_13 = load i32, i32* %v_1, align 4
  %v_14 = icmp slt i32 %v_12, %v_13
  br i1 %v_14, label %main_block_label_5, label %main_block_label_6

main_block_label_5:                               ; preds = %main_block_label_4
  %v_15 = load i32, i32* %v_0, align 4
  %v_17 = getelementptr inbounds [510 x i32], [510 x i32]* @g_a, i32 0, i32 %v_15
  %v_16 = load i32, i32* %v_17, align 4
  %v_18 = icmp ne i32 %v_16, 0
  br i1 %v_18, label %main_block_label_7, label %main_block_label_8

main_block_label_6:                               ; preds = %main_block_label_4
  store i32 0, i32* %v_0, align 4
  br label %main_block_label_15

main_block_label_7:                               ; preds = %main_block_label_5
  %v_19 = load i32, i32* %v_11, align 4
  %v_20 = load i32, i32* %v_11, align 4
  %v_21 = getelementptr inbounds [510 x i32], [510 x i32]* @g_prime, i32 0, i32 %v_20
  %v_22 = load i32, i32* %v_0, align 4
  store i32 %v_22, i32* %v_21, align 4
  %v_23 = load i32, i32* %v_11, align 4
  %v_24 = add i32 %v_23, 1
  store i32 %v_24, i32* %v_11, align 4
  br label %main_block_label_8

main_block_label_8:                               ; preds = %main_block_label_7, %main_block_label_5
  %v_25 = alloca i32, align 4
  store i32 0, i32* %v_25, align 4
  br label %main_block_label_9

main_block_label_9:                               ; preds = %main_block_label_14, %main_block_label_8
  %v_26 = load i32, i32* %v_25, align 4
  %v_27 = load i32, i32* %v_11, align 4
  %v_28 = icmp slt i32 %v_26, %v_27
  br i1 %v_28, label %main_block_label_12, label %main_block_label_11

main_block_label_10:                              ; preds = %main_block_label_12
  %v_36 = load i32, i32* %v_0, align 4
  %v_37 = load i32, i32* %v_25, align 4
  %v_39 = getelementptr inbounds [510 x i32], [510 x i32]* @g_prime, i32 0, i32 %v_37
  %v_38 = load i32, i32* %v_39, align 4
  %v_40 = mul i32 %v_36, %v_38
  %v_41 = load i32, i32* %v_0, align 4
  %v_42 = load i32, i32* %v_25, align 4
  %v_44 = getelementptr inbounds [510 x i32], [510 x i32]* @g_prime, i32 0, i32 %v_42
  %v_43 = load i32, i32* %v_44, align 4
  %v_45 = mul i32 %v_41, %v_43
  %v_46 = getelementptr inbounds [510 x i32], [510 x i32]* @g_a, i32 0, i32 %v_45
  store i32 0, i32* %v_46, align 4
  %v_47 = load i32, i32* %v_0, align 4
  %v_48 = load i32, i32* %v_25, align 4
  %v_50 = getelementptr inbounds [510 x i32], [510 x i32]* @g_prime, i32 0, i32 %v_48
  %v_49 = load i32, i32* %v_50, align 4
  %v_51 = srem i32 %v_47, %v_49
  %v_52 = icmp eq i32 %v_51, 0
  br i1 %v_52, label %main_block_label_13, label %main_block_label_14

main_block_label_11:                              ; preds = %main_block_label_13, %main_block_label_12, %main_block_label_9
  %v_55 = load i32, i32* %v_0, align 4
  %v_56 = add i32 %v_55, 1
  store i32 %v_56, i32* %v_0, align 4
  br label %main_block_label_4

main_block_label_12:                              ; preds = %main_block_label_9
  %v_29 = load i32, i32* %v_0, align 4
  %v_30 = load i32, i32* %v_25, align 4
  %v_32 = getelementptr inbounds [510 x i32], [510 x i32]* @g_prime, i32 0, i32 %v_30
  %v_31 = load i32, i32* %v_32, align 4
  %v_33 = mul i32 %v_29, %v_31
  %v_34 = load i32, i32* %v_1, align 4
  %v_35 = icmp sle i32 %v_33, %v_34
  br i1 %v_35, label %main_block_label_10, label %main_block_label_11

main_block_label_13:                              ; preds = %main_block_label_10
  br label %main_block_label_11

0:                                                ; No predecessors!
  br label %main_block_label_14

main_block_label_14:                              ; preds = %0, %main_block_label_10
  %v_53 = load i32, i32* %v_25, align 4
  %v_54 = add i32 %v_53, 1
  store i32 %v_54, i32* %v_25, align 4
  br label %main_block_label_9

main_block_label_15:                              ; preds = %10, %8, %6, %4, %main_block_label_22, %main_block_label_20, %main_block_label_6
  %v_57 = icmp ne i32 114514, 0
  br i1 %v_57, label %main_block_label_16, label %main_block_label_17

main_block_label_16:                              ; preds = %main_block_label_15
  %v_58 = load i32, i32* %v_0, align 4
  %v_60 = getelementptr inbounds [510 x i32], [510 x i32]* @g_a, i32 0, i32 %v_58
  %v_59 = load i32, i32* %v_60, align 4
  %v_61 = icmp ne i32 %v_59, 0
  br i1 %v_61, label %main_block_label_18, label %main_block_label_19

main_block_label_17:                              ; preds = %9, %7, %5, %3, %main_block_label_21, %main_block_label_15
  ret i32 0

main_block_label_18:                              ; preds = %main_block_label_16
  %v_62 = load i32, i32* %v_0, align 4
  %v_63 = load i32, i32* %v_0, align 4
  %v_64 = srem i32 %v_63, 2
  %v_65 = load i32, i32* %v_0, align 4
  %v_66 = srem i32 %v_65, 16
  %v_68 = getelementptr inbounds [16 x i32], [16 x i32]* @g_reflect1, i32 0, i32 %v_66
  %v_67 = load i32, i32* %v_68, align 4
  %v_69 = mul i32 %v_64, %v_67
  %v_70 = load i32, i32* %v_0, align 4
  %v_71 = add i32 %v_70, 1
  %v_72 = srem i32 %v_71, 2
  %v_73 = load i32, i32* %v_0, align 4
  %v_74 = srem i32 %v_73, 5
  %v_75 = load i32, i32* %v_0, align 4
  %v_76 = srem i32 %v_75, 5
  %v_77 = mul i32 5, %v_74
  %v_78 = add i32 %v_77, %v_76
  %v_79 = getelementptr inbounds [5 x [5 x i32]], [5 x [5 x i32]]* @g_reflect2, i32 0, i32 0, i32 %v_78
  %v_80 = load i32, i32* %v_79, align 4
  %v_81 = mul i32 %v_72, %v_80
  %v_82 = add i32 %v_69, %v_81
  call void @putint(i32 %v_62)
  call void @putstr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @s_0, i64 0, i64 0))
  call void @putint(i32 %v_82)
  call void @putstr(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @s_1, i64 0, i64 0))
  br label %main_block_label_19

main_block_label_19:                              ; preds = %main_block_label_18, %main_block_label_16
  %v_83 = load i32, i32* %v_0, align 4
  %v_84 = add i32 %v_83, 1
  store i32 %v_84, i32* %v_0, align 4
  %v_85 = load i32, i32* %v_0, align 4
  %v_86 = load i32, i32* %v_1, align 4
  %v_87 = icmp slt i32 %v_85, %v_86
  br i1 %v_87, label %main_block_label_20, label %main_block_label_21

main_block_label_20:                              ; preds = %main_block_label_19
  br label %main_block_label_15

1:                                                ; No predecessors!
  br label %main_block_label_22

main_block_label_21:                              ; preds = %main_block_label_19
  br label %main_block_label_17

2:                                                ; No predecessors!
  br label %main_block_label_22

main_block_label_22:                              ; preds = %2, %1
  br label %main_block_label_15

3:                                                ; No predecessors!
  br label %main_block_label_17

4:                                                ; No predecessors!
  br label %main_block_label_15

5:                                                ; No predecessors!
  br label %main_block_label_17

6:                                                ; No predecessors!
  br label %main_block_label_15

7:                                                ; No predecessors!
  br label %main_block_label_17

8:                                                ; No predecessors!
  br label %main_block_label_15

9:                                                ; No predecessors!
  br label %main_block_label_17

10:                                               ; No predecessors!
  br label %main_block_label_15
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.ident = !{!0}
!llvm.module.flags = !{!1, !2, !3, !4, !5}

!0 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{i32 7, !"PIE Level", i32 2}
!4 = !{i32 7, !"uwtable", i32 1}
!5 = !{i32 7, !"frame-pointer", i32 2}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
