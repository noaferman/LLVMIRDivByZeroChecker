; ModuleID = 'test04.ll'
source_filename = "test04.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @f() #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !10, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 2, metadata !13, metadata !DIExpression()), !dbg !14
  %cmp = icmp slt i32 0, 1, !dbg !15
  br i1 %cmp, label %if.then, label %if.end, !dbg !17

if.then:                                          ; preds = %entry
  %div = sdiv i32 2, 0, !dbg !18
  call void @llvm.dbg.value(metadata i32 %div, metadata !20, metadata !DIExpression()), !dbg !21
  br label %if.end, !dbg !22

if.end:                                           ; preds = %if.then, %entry
  ret void, !dbg !23
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 8.0.1- (branches/release_80)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "test04.c", directory: "/DivByZeroChecker/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1- (branches/release_80)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "x", scope: !7, file: !1, line: 2, type: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocation(line: 2, column: 7, scope: !7)
!13 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 3, type: !11)
!14 = !DILocation(line: 3, column: 7, scope: !7)
!15 = !DILocation(line: 5, column: 9, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 5, column: 7)
!17 = !DILocation(line: 5, column: 7, scope: !7)
!18 = !DILocation(line: 6, column: 11, scope: !19)
!19 = distinct !DILexicalBlock(scope: !16, file: !1, line: 5, column: 14)
!20 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 4, type: !11)
!21 = !DILocation(line: 4, column: 7, scope: !7)
!22 = !DILocation(line: 7, column: 3, scope: !19)
!23 = !DILocation(line: 8, column: 1, scope: !7)
