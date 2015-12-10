/*
 * Copyright (c) 2002 Apple Computer, Inc. All rights reserved.
 *
 * @APPLE_LICENSE_HEADER_START@
 *
 * The contents of this file constitute Original Code as defined in and
 * are subject to the Apple Public Source License Version 1.1 (the
 * "License").  You may not use this file except in compliance with the
 * License.  Please obtain a copy of the License at
 * http://www.apple.com/publicsource and read it before using this file.
 *
 * This Original Code and all software distributed under the License are
 * distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, EITHER
 * EXPRESS OR IMPLIED, AND APPLE HEREBY DISCLAIMS ALL SUCH WARRANTIES,
 * INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE OR NON-INFRINGEMENT.  Please see the
 * License for the specific language governing rights and limitations
 * under the License.
 *
 * @APPLE_LICENSE_HEADER_END@
 */

#if __GNUC__ >= 3

;
; This function was generated by disassembling the 'OSObject::free(void)'
; function of the Panther7B7 kernel in gdb.
;
; Then add the 'li r4,3' flag taken fropm the Puma kernel OSObject::free'
;
    .text

    .align  5
    .globl  __ZN8OSObject4freeEv

__ZN8OSObject4freeEv:
    ; function prologue
    stw     r31,-4(r1)
    mflr    r0
    stw     r0,8(r1)
    mr      r31,r3
    stwu    r1,-80(r1)

    ; const OSMetaClass *meta = getMetaClass();
    lwz     r9,0(r3)
    lwz     r12,32(r9)
    mtctr   r12
    bctrl

    ; if (meta)
    ;   meta->instanceDestructed();
    cmpwi   r3,0
    beq     delete_this
    bl      __ZNK11OSMetaClass18instanceDestructedEv

delete_this:
    ; delete this;
    lwz     r9,0(r31)
    mr      r3,r31
    li      r4,0        ; Load up some sort of flags, for 2.95 destructors?
    lwz     r0,88(r1)
    addi    r1,r1,80
    lwz     r12,8(r9)
    mtlr    r0
    lwz     r31,-4(r1)
    mtctr   r12
    bctr

#endif /* __GNUC__ >= 3 */
