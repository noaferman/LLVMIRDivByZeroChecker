; ModuleID = 'test03.ll'
source_filename = "test03.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !7 {
entry:
  call void @llvm.dbg.value(metadata i32 0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 0, metadata !13, metadata !DIExpression()), !dbg !14
  %cmp = icmp eq i32 0, 0, !dbg !15
  %conv = zext i1 %cmp to i32, !dbg !15
  call void @llvm.dbg.value(metadata i32 %conv, metadata !16, metadata !DIExpression()), !dbg !17
  %div = sdiv i32 0, %conv, !dbg !18
  call void @llvm.dbg.value(metadata i32 %div, metadata !19, metadata !DIExpression()), !dbg !20
  %div1 = sdiv i32 %div, %div, !dbg !21
  call void @llvm.dbg.value(metadata i32 %div1, metadata !22, metadata !DIExpression()), !dbg !23
  ret i32 0, !dbg !24
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
!1 = !DIFile(filename: "test03.c", directory: "/DivByZeroChecker/test")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 8.0.1- (branches/release_80)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 2, type: !10)
!12 = !DILocation(line: 2, column: 7, scope: !7)
!13 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 3, type: !10)
!14 = !DILocation(line: 3, column: 7, scope: !7)
!15 = !DILocation(line: 4, column: 13, scope: !7)
!16 = !DILocalVariable(name: "c", scope: !7, file: !1, line: 4, type: !10)
!17 = !DILocation(line: 4, column: 7, scope: !7)
!18 = !DILocation(line: 5, column: 13, scope: !7)
!19 = !DILocalVariable(name: "d", scope: !7, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 5, column: 7, scope: !7)
!21 = !DILocation(line: 6, column: 13, scope: !7)
!22 = !DILocalVariable(name: "e", scope: !7, file: !1, line: 6, type: !10)
!23 = !DILocation(line: 6, column: 7, scope: !7)
!24 = !DILocation(line: 7, column: 3, scope: !7)
