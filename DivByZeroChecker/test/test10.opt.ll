; ModuleID = 'test10.ll'
source_filename = "test10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @f() #0 !dbg !7 {
entry:
  %call = call i32 @getchar(), !dbg !10
  call void @llvm.dbg.value(metadata i32 %call, metadata !11, metadata !DIExpression()), !dbg !13
  call void @llvm.dbg.value(metadata i32 10, metadata !14, metadata !DIExpression()), !dbg !15
  call void @llvm.dbg.value(metadata i32 2, metadata !16, metadata !DIExpression()), !dbg !17
  %cmp = icmp sgt i32 %call, 0, !dbg !18
  br i1 %cmp, label %if.then, label %if.else, !dbg !20

if.then:                                          ; preds = %entry
  %add = add nsw i32 100, 2, !dbg !21
  call void @llvm.dbg.value(metadata i32 %add, metadata !16, metadata !DIExpression()), !dbg !17
  br label %if.end5, !dbg !23

if.else:                                          ; preds = %entry
  %cmp1 = icmp eq i32 %call, 0, !dbg !24
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !26

if.then2:                                         ; preds = %if.else
  call void @llvm.dbg.value(metadata i32 1, metadata !16, metadata !DIExpression()), !dbg !17
  br label %if.end, !dbg !27

if.else3:                                         ; preds = %if.else
  %add4 = add nsw i32 10, 2, !dbg !29
  call void @llvm.dbg.value(metadata i32 %add4, metadata !16, metadata !DIExpression()), !dbg !17
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  %b.0 = phi i32 [ 1, %if.then2 ], [ %add4, %if.else3 ], !dbg !31
  call void @llvm.dbg.value(metadata i32 %b.0, metadata !16, metadata !DIExpression()), !dbg !17
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  %b.1 = phi i32 [ %add, %if.then ], [ %b.0, %if.end ], !dbg !32
  call void @llvm.dbg.value(metadata i32 %b.1, metadata !16, metadata !DIExpression()), !dbg !17
  %div = sdiv i32 10, %b.1, !dbg !33
  call void @llvm.dbg.value(metadata i32 %div, metadata !34, metadata !DIExpression()), !dbg !35
  ret void, !dbg !36
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
!1 = !DIFile(filename: "test10.c", directory: "/DivByZeroChecker/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1- (branches/release_80)"}
!7 = distinct !DISubprogram(name: "f", scope: !1, file: !1, line: 3, type: !8, scopeLine: 3, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{null}
!10 = !DILocation(line: 4, column: 12, scope: !7)
!11 = !DILocalVariable(name: "in", scope: !7, file: !1, line: 4, type: !12)
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocation(line: 4, column: 7, scope: !7)
!14 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 5, type: !12)
!15 = !DILocation(line: 5, column: 7, scope: !7)
!16 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 6, type: !12)
!17 = !DILocation(line: 6, column: 7, scope: !7)
!18 = !DILocation(line: 8, column: 10, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 7)
!20 = !DILocation(line: 8, column: 7, scope: !7)
!21 = !DILocation(line: 9, column: 13, scope: !22)
!22 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 15)
!23 = !DILocation(line: 10, column: 3, scope: !22)
!24 = !DILocation(line: 10, column: 17, scope: !25)
!25 = distinct !DILexicalBlock(scope: !19, file: !1, line: 10, column: 14)
!26 = !DILocation(line: 10, column: 14, scope: !19)
!27 = !DILocation(line: 12, column: 3, scope: !28)
!28 = distinct !DILexicalBlock(scope: !25, file: !1, line: 10, column: 23)
!29 = !DILocation(line: 13, column: 11, scope: !30)
!30 = distinct !DILexicalBlock(scope: !25, file: !1, line: 12, column: 10)
!31 = !DILocation(line: 0, scope: !25)
!32 = !DILocation(line: 0, scope: !19)
!33 = !DILocation(line: 16, column: 15, scope: !7)
!34 = !DILocalVariable(name: "out", scope: !7, file: !1, line: 16, type: !12)
!35 = !DILocation(line: 16, column: 7, scope: !7)
!36 = !DILocation(line: 17, column: 1, scope: !7)
