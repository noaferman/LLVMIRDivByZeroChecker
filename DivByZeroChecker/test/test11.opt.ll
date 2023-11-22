; ModuleID = 'test11.ll'
source_filename = "test11.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @f() #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !10, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 0, metadata !13, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !15

for.cond:                                         ; preds = %for.inc, %entry
  %sum.0 = phi i32 [ 0, %entry ], [ %add, %for.inc ], !dbg !17
  %i.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ], !dbg !18
  call void @llvm.dbg.value(metadata i32 %i.0, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %sum.0, metadata !10, metadata !DIExpression()), !dbg !12
  %cmp = icmp slt i32 %i.0, 10, !dbg !19
  br i1 %cmp, label %for.body, label %for.end, !dbg !21

for.body:                                         ; preds = %for.cond
  %add = add nsw i32 %sum.0, 1, !dbg !22
  call void @llvm.dbg.value(metadata i32 %add, metadata !10, metadata !DIExpression()), !dbg !12
  br label %for.inc, !dbg !24

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1, !dbg !25
  call void @llvm.dbg.value(metadata i32 %inc, metadata !13, metadata !DIExpression()), !dbg !14
  br label %for.cond, !dbg !26, !llvm.loop !27

for.end:                                          ; preds = %for.cond
  %div = sdiv i32 %i.0, %sum.0, !dbg !29
  call void @llvm.dbg.value(metadata i32 %div, metadata !30, metadata !DIExpression()), !dbg !31
  ret void, !dbg !32
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
!1 = !DIFile(filename: "test11.c", directory: "/DivByZeroChecker/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1- (branches/release_80)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocalVariable(name: "sum", scope: !7, file: !1, line: 3, type: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocation(line: 3, column: 7, scope: !7)
!13 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 2, type: !11)
!14 = !DILocation(line: 2, column: 7, scope: !7)
!15 = !DILocation(line: 4, column: 8, scope: !16)
!16 = distinct !DILexicalBlock(scope: !7, file: !1, line: 4, column: 3)
!17 = !DILocation(line: 0, scope: !7)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocation(line: 4, column: 17, scope: !20)
!20 = distinct !DILexicalBlock(scope: !16, file: !1, line: 4, column: 3)
!21 = !DILocation(line: 4, column: 3, scope: !16)
!22 = !DILocation(line: 5, column: 9, scope: !23)
!23 = distinct !DILexicalBlock(scope: !20, file: !1, line: 4, column: 28)
!24 = !DILocation(line: 6, column: 3, scope: !23)
!25 = !DILocation(line: 4, column: 24, scope: !20)
!26 = !DILocation(line: 4, column: 3, scope: !20)
!27 = distinct !{!27, !21, !28}
!28 = !DILocation(line: 6, column: 3, scope: !16)
!29 = !DILocation(line: 7, column: 13, scope: !7)
!30 = !DILocalVariable(name: "z", scope: !7, file: !1, line: 7, type: !11)
!31 = !DILocation(line: 7, column: 7, scope: !7)
!32 = !DILocation(line: 8, column: 1, scope: !7)
