; ModuleID = 'test12.ll'
source_filename = "test12.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @f() #0 !dbg !7 {
entry:
  %call = call i32 @getchar(), !dbg !10
  call void @llvm.dbg.value(metadata i32 %call, metadata !11, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 0, metadata !14, metadata !DIExpression()), !dbg !15
  br label %while.cond, !dbg !16

while.cond:                                       ; preds = %while.body, %entry
  %sum.0 = phi i32 [ 0, %entry ], [ %add, %while.body ], !dbg !17
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !14, metadata !DIExpression()), !dbg !15
  %cmp = icmp slt i32 %sum.0, 50, !dbg !18
  br i1 %cmp, label %while.body, label %while.end, !dbg !16

while.body:                                       ; preds = %while.cond
  %add = add nsw i32 %sum.0, %call, !dbg !19
  call void @llvm.dbg.value(metadata i32 %add, metadata !14, metadata !DIExpression()), !dbg !15
  br label %while.cond, !dbg !16, !llvm.loop !21

while.end:                                        ; preds = %while.cond
  %sub = sub nsw i32 %sum.0, 55, !dbg !23
  call void @llvm.dbg.value(metadata i32 %sub, metadata !24, metadata !DIExpression()), !dbg !25
  %div = sdiv i32 %call, %sub, !dbg !26
  call void @llvm.dbg.value(metadata i32 %div, metadata !27, metadata !DIExpression()), !dbg !28
  ret void, !dbg !29
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @getchar() #2

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 8.0.1- (branches/release_80)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, nameTableKind: None)
!1 = !DIFile(filename: "test12.c", directory: "/DivByZeroChecker/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1- (branches/release_80)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 4, column: 11, scope: !7)
!11 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 4, type: !12)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocation(line: 4, column: 7, scope: !7)
!14 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 5, type: !12)
!15 = !DILocation(line: 5, column: 7, scope: !7)
!16 = !DILocation(line: 6, column: 3, scope: !7)
!17 = !DILocation(line: 0, scope: !7)
!18 = !DILocation(line: 6, column: 14, scope: !7)
!19 = !DILocation(line: 7, column: 9, scope: !20)
!20 = distinct !DILexicalBlock(scope: !7, file: !1, line: 6, column: 20)
!21 = distinct !{!21, !16, !22}
!22 = !DILocation(line: 8, column: 3, scope: !7)
!23 = !DILocation(line: 9, column: 15, scope: !7)
!24 = !DILocalVariable(name: "y", scope: !7, file: !1, line: 9, type: !12)
!25 = !DILocation(line: 9, column: 7, scope: !7)
!26 = !DILocation(line: 10, column: 13, scope: !7)
!27 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 10, type: !12)
!28 = !DILocation(line: 10, column: 7, scope: !7)
!29 = !DILocation(line: 11, column: 1, scope: !7)
