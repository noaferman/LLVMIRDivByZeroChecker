; ModuleID = 'test10.c'
source_filename = "test10.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local void @f() #0 !dbg !7 {
entry:
  %in = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %out = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %in, metadata !10, metadata !DIExpression()), !dbg !12
  %call = call i32 @getchar(), !dbg !13
  store i32 %call, i32* %in, align 4, !dbg !12
  call void @llvm.dbg.declare(metadata i32* %a, metadata !14, metadata !DIExpression()), !dbg !15
  store i32 10, i32* %a, align 4, !dbg !15
  call void @llvm.dbg.declare(metadata i32* %b, metadata !16, metadata !DIExpression()), !dbg !17
  store i32 2, i32* %b, align 4, !dbg !17
  %0 = load i32, i32* %in, align 4, !dbg !18
  %cmp = icmp sgt i32 %0, 0, !dbg !20
  br i1 %cmp, label %if.then, label %if.else, !dbg !21

if.then:                                          ; preds = %entry
  %1 = load i32, i32* %b, align 4, !dbg !22
  %add = add nsw i32 100, %1, !dbg !24
  store i32 %add, i32* %b, align 4, !dbg !25
  br label %if.end5, !dbg !26

if.else:                                          ; preds = %entry
  %2 = load i32, i32* %in, align 4, !dbg !27
  %cmp1 = icmp eq i32 %2, 0, !dbg !29
  br i1 %cmp1, label %if.then2, label %if.else3, !dbg !30

if.then2:                                         ; preds = %if.else
  store i32 1, i32* %b, align 4, !dbg !31
  br label %if.end, !dbg !33

if.else3:                                         ; preds = %if.else
  %3 = load i32, i32* %a, align 4, !dbg !34
  %4 = load i32, i32* %b, align 4, !dbg !36
  %add4 = add nsw i32 %3, %4, !dbg !37
  store i32 %add4, i32* %b, align 4, !dbg !38
  br label %if.end

if.end:                                           ; preds = %if.else3, %if.then2
  br label %if.end5

if.end5:                                          ; preds = %if.end, %if.then
  call void @llvm.dbg.declare(metadata i32* %out, metadata !39, metadata !DIExpression()), !dbg !40
  %5 = load i32, i32* %a, align 4, !dbg !41
  %6 = load i32, i32* %b, align 4, !dbg !42
  %div = sdiv i32 %5, %6, !dbg !43
  store i32 %div, i32* %out, align 4, !dbg !40
  ret void, !dbg !44
}

; Function Attrs: nounwind readnone speculatable
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local i32 @getchar() #2

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
!10 = !DILocalVariable(name: "in", scope: !7, file: !1, line: 4, type: !11)
!11 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!12 = !DILocation(line: 4, column: 7, scope: !7)
!13 = !DILocation(line: 4, column: 12, scope: !7)
!14 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 5, type: !11)
!15 = !DILocation(line: 5, column: 7, scope: !7)
!16 = !DILocalVariable(name: "b", scope: !7, file: !1, line: 6, type: !11)
!17 = !DILocation(line: 6, column: 7, scope: !7)
!18 = !DILocation(line: 8, column: 7, scope: !19)
!19 = distinct !DILexicalBlock(scope: !7, file: !1, line: 8, column: 7)
!20 = !DILocation(line: 8, column: 10, scope: !19)
!21 = !DILocation(line: 8, column: 7, scope: !7)
!22 = !DILocation(line: 9, column: 15, scope: !23)
!23 = distinct !DILexicalBlock(scope: !19, file: !1, line: 8, column: 15)
!24 = !DILocation(line: 9, column: 13, scope: !23)
!25 = !DILocation(line: 9, column: 7, scope: !23)
!26 = !DILocation(line: 10, column: 3, scope: !23)
!27 = !DILocation(line: 10, column: 14, scope: !28)
!28 = distinct !DILexicalBlock(scope: !19, file: !1, line: 10, column: 14)
!29 = !DILocation(line: 10, column: 17, scope: !28)
!30 = !DILocation(line: 10, column: 14, scope: !19)
!31 = !DILocation(line: 11, column: 7, scope: !32)
!32 = distinct !DILexicalBlock(scope: !28, file: !1, line: 10, column: 23)
!33 = !DILocation(line: 12, column: 3, scope: !32)
!34 = !DILocation(line: 13, column: 9, scope: !35)
!35 = distinct !DILexicalBlock(scope: !28, file: !1, line: 12, column: 10)
!36 = !DILocation(line: 13, column: 13, scope: !35)
!37 = !DILocation(line: 13, column: 11, scope: !35)
!38 = !DILocation(line: 13, column: 7, scope: !35)
!39 = !DILocalVariable(name: "out", scope: !7, file: !1, line: 16, type: !11)
!40 = !DILocation(line: 16, column: 7, scope: !7)
!41 = !DILocation(line: 16, column: 13, scope: !7)
!42 = !DILocation(line: 16, column: 17, scope: !7)
!43 = !DILocation(line: 16, column: 15, scope: !7)
!44 = !DILocation(line: 17, column: 1, scope: !7)
