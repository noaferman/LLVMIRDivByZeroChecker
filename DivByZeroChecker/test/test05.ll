; ModuleID = 'test05.c'
source_filename = "test05.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @f() #0 !dbg !7 {
entry:
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  %z = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %x, metadata !11, metadata !DIExpression()), !dbg !12
  store i32 0, i32* %x, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %y, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 1, i32* %y, align 4, !dbg !14
  %0 = load i32, i32* %x, align 4, !dbg !15
  %cmp = icmp ne i32 %0, 0, !dbg !17
  br i1 %cmp, label %if.then, label %if.end, !dbg !18

if.then:                                          ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %z, metadata !19, metadata !DIExpression()), !dbg !21
  %1 = load i32, i32* %y, align 4, !dbg !22
  %2 = load i32, i32* %x, align 4, !dbg !23
  %div = sdiv i32 %1, %2, !dbg !24
  store i32 %div, i32* %z, align 4, !dbg !21
  br label %if.end, !dbg !25

if.end:                                           ; preds = %if.then, %entry
  ret i32 0, !dbg !26
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 8.0.1- (branches/release_80)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "test05.c", directory: "/DivByZeroChecker/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1- (branches/release_80)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 2, type: !10)
!12 = !DILocation(line: 2, column: 7, scope: !7)
!13 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 3, column: 7, scope: !7)
!15 = !DILocation(line: 4, column: 7, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 4, column: 7)
!17 = !DILocation(line: 4, column: 9, scope: !16)
!18 = !DILocation(line: 4, column: 7, scope: !7)
!19 = !DILocalVariable(name: "z", scope: !20, file: !1, line: 5, type: !10)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 4, column: 15)
!21 = !DILocation(line: 5, column: 9, scope: !20)
!22 = !DILocation(line: 5, column: 13, scope: !20)
!23 = !DILocation(line: 5, column: 17, scope: !20)
!24 = !DILocation(line: 5, column: 15, scope: !20)
!25 = !DILocation(line: 6, column: 3, scope: !20)
!26 = !DILocation(line: 7, column: 3, scope: !7)
