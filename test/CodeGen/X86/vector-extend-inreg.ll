; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+sse2   | FileCheck %s --check-prefix=ALL --check-prefix=X32-SSE
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+sse2 | FileCheck %s --check-prefix=ALL --check-prefix=X64-SSE
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx2   | FileCheck %s --check-prefix=ALL --check-prefix=X32-AVX
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx2 | FileCheck %s --check-prefix=ALL --check-prefix=X64-AVX

define i64 @extract_any_extend_vector_inreg_v16i64(<16 x i64> %a0, i32 %a1) nounwind {
; X32-SSE-LABEL: extract_any_extend_vector_inreg_v16i64:
; X32-SSE:       # %bb.0:
; X32-SSE-NEXT:    pushl %ebp
; X32-SSE-NEXT:    movl %esp, %ebp
; X32-SSE-NEXT:    andl $-128, %esp
; X32-SSE-NEXT:    subl $384, %esp # imm = 0x180
; X32-SSE-NEXT:    movl 88(%ebp), %ecx
; X32-SSE-NEXT:    movdqa 72(%ebp), %xmm0
; X32-SSE-NEXT:    xorps %xmm1, %xmm1
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    psrldq {{.*#+}} xmm0 = xmm0[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
; X32-SSE-NEXT:    movdqa %xmm0, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    movaps %xmm1, (%esp)
; X32-SSE-NEXT:    movdqa %xmm0, {{[0-9]+}}(%esp)
; X32-SSE-NEXT:    leal (%ecx,%ecx), %eax
; X32-SSE-NEXT:    andl $31, %eax
; X32-SSE-NEXT:    movl 128(%esp,%eax,4), %eax
; X32-SSE-NEXT:    leal 1(%ecx,%ecx), %ecx
; X32-SSE-NEXT:    andl $31, %ecx
; X32-SSE-NEXT:    movl (%esp,%ecx,4), %edx
; X32-SSE-NEXT:    movl %ebp, %esp
; X32-SSE-NEXT:    popl %ebp
; X32-SSE-NEXT:    retl
;
; X64-SSE-LABEL: extract_any_extend_vector_inreg_v16i64:
; X64-SSE:       # %bb.0:
; X64-SSE-NEXT:    pushq %rbp
; X64-SSE-NEXT:    movq %rsp, %rbp
; X64-SSE-NEXT:    andq $-128, %rsp
; X64-SSE-NEXT:    subq $256, %rsp # imm = 0x100
; X64-SSE-NEXT:    # kill: def $edi killed $edi def $rdi
; X64-SSE-NEXT:    psrldq {{.*#+}} xmm7 = xmm7[8,9,10,11,12,13,14,15],zero,zero,zero,zero,zero,zero,zero,zero
; X64-SSE-NEXT:    xorps %xmm0, %xmm0
; X64-SSE-NEXT:    movaps %xmm0, {{[0-9]+}}(%rsp)
; X64-SSE-NEXT:    movaps %xmm0, {{[0-9]+}}(%rsp)
; X64-SSE-NEXT:    movaps %xmm0, {{[0-9]+}}(%rsp)
; X64-SSE-NEXT:    movaps %xmm0, {{[0-9]+}}(%rsp)
; X64-SSE-NEXT:    movaps %xmm0, {{[0-9]+}}(%rsp)
; X64-SSE-NEXT:    movaps %xmm0, {{[0-9]+}}(%rsp)
; X64-SSE-NEXT:    movaps %xmm0, (%rsp)
; X64-SSE-NEXT:    movdqa %xmm7, {{[0-9]+}}(%rsp)
; X64-SSE-NEXT:    andl $15, %edi
; X64-SSE-NEXT:    movq (%rsp,%rdi,8), %rax
; X64-SSE-NEXT:    movq %rbp, %rsp
; X64-SSE-NEXT:    popq %rbp
; X64-SSE-NEXT:    retq
;
; X32-AVX-LABEL: extract_any_extend_vector_inreg_v16i64:
; X32-AVX:       # %bb.0:
; X32-AVX-NEXT:    pushl %ebp
; X32-AVX-NEXT:    movl %esp, %ebp
; X32-AVX-NEXT:    andl $-128, %esp
; X32-AVX-NEXT:    subl $384, %esp # imm = 0x180
; X32-AVX-NEXT:    movl 40(%ebp), %ecx
; X32-AVX-NEXT:    vbroadcastsd 32(%ebp), %ymm0
; X32-AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; X32-AVX-NEXT:    vblendps {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,3]
; X32-AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; X32-AVX-NEXT:    vmovaps %ymm1, {{[0-9]+}}(%esp)
; X32-AVX-NEXT:    vmovaps %ymm1, {{[0-9]+}}(%esp)
; X32-AVX-NEXT:    vmovaps %ymm1, {{[0-9]+}}(%esp)
; X32-AVX-NEXT:    vmovaps %ymm0, {{[0-9]+}}(%esp)
; X32-AVX-NEXT:    vmovaps %ymm1, {{[0-9]+}}(%esp)
; X32-AVX-NEXT:    vmovaps %ymm1, {{[0-9]+}}(%esp)
; X32-AVX-NEXT:    vmovaps %ymm1, (%esp)
; X32-AVX-NEXT:    vmovaps %ymm0, {{[0-9]+}}(%esp)
; X32-AVX-NEXT:    leal (%ecx,%ecx), %eax
; X32-AVX-NEXT:    andl $31, %eax
; X32-AVX-NEXT:    movl 128(%esp,%eax,4), %eax
; X32-AVX-NEXT:    leal 1(%ecx,%ecx), %ecx
; X32-AVX-NEXT:    andl $31, %ecx
; X32-AVX-NEXT:    movl (%esp,%ecx,4), %edx
; X32-AVX-NEXT:    movl %ebp, %esp
; X32-AVX-NEXT:    popl %ebp
; X32-AVX-NEXT:    vzeroupper
; X32-AVX-NEXT:    retl
;
; X64-AVX-LABEL: extract_any_extend_vector_inreg_v16i64:
; X64-AVX:       # %bb.0:
; X64-AVX-NEXT:    pushq %rbp
; X64-AVX-NEXT:    movq %rsp, %rbp
; X64-AVX-NEXT:    andq $-128, %rsp
; X64-AVX-NEXT:    subq $256, %rsp # imm = 0x100
; X64-AVX-NEXT:    # kill: def $edi killed $edi def $rdi
; X64-AVX-NEXT:    vpermpd {{.*#+}} ymm0 = ymm3[3,1,2,3]
; X64-AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; X64-AVX-NEXT:    vblendps {{.*#+}} xmm0 = xmm0[0,1],xmm1[2,3]
; X64-AVX-NEXT:    vxorps %xmm1, %xmm1, %xmm1
; X64-AVX-NEXT:    vmovaps %ymm1, {{[0-9]+}}(%rsp)
; X64-AVX-NEXT:    vmovaps %ymm1, {{[0-9]+}}(%rsp)
; X64-AVX-NEXT:    vmovaps %ymm1, (%rsp)
; X64-AVX-NEXT:    vmovaps %ymm0, {{[0-9]+}}(%rsp)
; X64-AVX-NEXT:    andl $15, %edi
; X64-AVX-NEXT:    movq (%rsp,%rdi,8), %rax
; X64-AVX-NEXT:    movq %rbp, %rsp
; X64-AVX-NEXT:    popq %rbp
; X64-AVX-NEXT:    vzeroupper
; X64-AVX-NEXT:    retq
  %1 = extractelement <16 x i64> %a0, i32 15
  %2 = insertelement <16 x i64> zeroinitializer, i64 %1, i32 4
  %3 = extractelement <16 x i64> %2, i32 %a1
  ret i64 %3
}
