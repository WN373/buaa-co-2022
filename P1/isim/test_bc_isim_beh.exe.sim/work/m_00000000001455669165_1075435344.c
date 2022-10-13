/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ef4fb42 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/MyFileAtD/CO2022/buaa-co-2022/P1/BlockChecker.v";
static int ng1[] = {0, 0};
static int ng2[] = {65, 0};
static int ng3[] = {90, 0};
static int ng4[] = {97, 0};
static int ng5[] = {32, 0};
static int ng6[] = {1, 0};
static int ng7[] = {9, 0};
static int ng8[] = {5, 0};
static int ng9[] = {98, 0};
static int ng10[] = {101, 0};
static int ng11[] = {7, 0};
static int ng12[] = {11, 0};
static int ng13[] = {2, 0};
static int ng14[] = {103, 0};
static int ng15[] = {3, 0};
static int ng16[] = {105, 0};
static int ng17[] = {4, 0};
static int ng18[] = {110, 0};
static int ng19[] = {8, 0};
static int ng20[] = {100, 0};



static void Initial_32_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(32, ng0);

LAB2:    xsi_set_current_line(33, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1288);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(34, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1380);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 32);
    xsi_set_current_line(35, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1564);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 8);
    xsi_set_current_line(36, ng0);
    t1 = ((char*)((ng1)));
    t2 = (t0 + 1472);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Cont_42_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t10[8];
    char t24[8];
    char t28[8];
    char t36[8];
    char t81[8];
    char t83[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    char *t9;
    char *t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t25;
    char *t26;
    char *t27;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    char *t50;
    char *t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    int t60;
    int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;
    char *t80;
    char *t82;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    char *t88;
    char *t89;
    char *t90;
    char *t91;
    char *t92;
    char *t93;
    unsigned int t94;
    unsigned int t95;
    char *t96;
    unsigned int t97;
    unsigned int t98;
    char *t99;
    unsigned int t100;
    unsigned int t101;
    char *t102;

LAB0:    t1 = (t0 + 2232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 784U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    if (*((unsigned int *)t7) != 0)
        goto LAB5;

LAB4:    t8 = (t2 + 4);
    if (*((unsigned int *)t8) != 0)
        goto LAB5;

LAB8:    if (*((unsigned int *)t5) < *((unsigned int *)t2))
        goto LAB7;

LAB6:    *((unsigned int *)t6) = 1;

LAB7:    memset(t10, 0, 8);
    t11 = (t6 + 4);
    t12 = *((unsigned int *)t11);
    t13 = (~(t12));
    t14 = *((unsigned int *)t6);
    t15 = (t14 & t13);
    t16 = (t15 & 1U);
    if (t16 != 0)
        goto LAB9;

LAB10:    if (*((unsigned int *)t11) != 0)
        goto LAB11;

LAB12:    t18 = (t10 + 4);
    t19 = *((unsigned int *)t10);
    t20 = *((unsigned int *)t18);
    t21 = (t19 || t20);
    if (t21 > 0)
        goto LAB13;

LAB14:    memcpy(t36, t10, 8);

LAB15:    memset(t4, 0, 8);
    t68 = (t36 + 4);
    t69 = *((unsigned int *)t68);
    t70 = (~(t69));
    t71 = *((unsigned int *)t36);
    t72 = (t71 & t70);
    t73 = (t72 & 1U);
    if (t73 != 0)
        goto LAB28;

LAB29:    if (*((unsigned int *)t68) != 0)
        goto LAB30;

LAB31:    t75 = (t4 + 4);
    t76 = *((unsigned int *)t4);
    t77 = *((unsigned int *)t75);
    t78 = (t76 || t77);
    if (t78 > 0)
        goto LAB32;

LAB33:    t84 = *((unsigned int *)t4);
    t85 = (~(t84));
    t86 = *((unsigned int *)t75);
    t87 = (t85 || t86);
    if (t87 > 0)
        goto LAB34;

LAB35:    if (*((unsigned int *)t75) > 0)
        goto LAB36;

LAB37:    if (*((unsigned int *)t4) > 0)
        goto LAB38;

LAB39:    memcpy(t3, t89, 8);

LAB40:    t88 = (t0 + 3080);
    t90 = (t88 + 32U);
    t91 = *((char **)t90);
    t92 = (t91 + 40U);
    t93 = *((char **)t92);
    memset(t93, 0, 8);
    t94 = 255U;
    t95 = t94;
    t96 = (t3 + 4);
    t97 = *((unsigned int *)t3);
    t94 = (t94 & t97);
    t98 = *((unsigned int *)t96);
    t95 = (t95 & t98);
    t99 = (t93 + 4);
    t100 = *((unsigned int *)t93);
    *((unsigned int *)t93) = (t100 | t94);
    t101 = *((unsigned int *)t99);
    *((unsigned int *)t99) = (t101 | t95);
    xsi_driver_vfirst_trans(t88, 0, 7);
    t102 = (t0 + 3004);
    *((int *)t102) = 1;

LAB1:    return;
LAB5:    t9 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t9) = 1;
    goto LAB7;

LAB9:    *((unsigned int *)t10) = 1;
    goto LAB12;

LAB11:    t17 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB12;

LAB13:    t22 = (t0 + 784U);
    t23 = *((char **)t22);
    t22 = ((char*)((ng3)));
    memset(t24, 0, 8);
    t25 = (t23 + 4);
    if (*((unsigned int *)t25) != 0)
        goto LAB17;

LAB16:    t26 = (t22 + 4);
    if (*((unsigned int *)t26) != 0)
        goto LAB17;

LAB20:    if (*((unsigned int *)t23) > *((unsigned int *)t22))
        goto LAB19;

LAB18:    *((unsigned int *)t24) = 1;

LAB19:    memset(t28, 0, 8);
    t29 = (t24 + 4);
    t30 = *((unsigned int *)t29);
    t31 = (~(t30));
    t32 = *((unsigned int *)t24);
    t33 = (t32 & t31);
    t34 = (t33 & 1U);
    if (t34 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t29) != 0)
        goto LAB23;

LAB24:    t37 = *((unsigned int *)t10);
    t38 = *((unsigned int *)t28);
    t39 = (t37 & t38);
    *((unsigned int *)t36) = t39;
    t40 = (t10 + 4);
    t41 = (t28 + 4);
    t42 = (t36 + 4);
    t43 = *((unsigned int *)t40);
    t44 = *((unsigned int *)t41);
    t45 = (t43 | t44);
    *((unsigned int *)t42) = t45;
    t46 = *((unsigned int *)t42);
    t47 = (t46 != 0);
    if (t47 == 1)
        goto LAB25;

LAB26:
LAB27:    goto LAB15;

LAB17:    t27 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t27) = 1;
    goto LAB19;

LAB21:    *((unsigned int *)t28) = 1;
    goto LAB24;

LAB23:    t35 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t35) = 1;
    goto LAB24;

LAB25:    t48 = *((unsigned int *)t36);
    t49 = *((unsigned int *)t42);
    *((unsigned int *)t36) = (t48 | t49);
    t50 = (t10 + 4);
    t51 = (t28 + 4);
    t52 = *((unsigned int *)t10);
    t53 = (~(t52));
    t54 = *((unsigned int *)t50);
    t55 = (~(t54));
    t56 = *((unsigned int *)t28);
    t57 = (~(t56));
    t58 = *((unsigned int *)t51);
    t59 = (~(t58));
    t60 = (t53 & t55);
    t61 = (t57 & t59);
    t62 = (~(t60));
    t63 = (~(t61));
    t64 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t64 & t62);
    t65 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t65 & t63);
    t66 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t66 & t62);
    t67 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t67 & t63);
    goto LAB27;

LAB28:    *((unsigned int *)t4) = 1;
    goto LAB31;

LAB30:    t74 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t74) = 1;
    goto LAB31;

LAB32:    t79 = (t0 + 784U);
    t80 = *((char **)t79);
    t79 = ((char*)((ng2)));
    memset(t81, 0, 8);
    xsi_vlog_unsigned_minus(t81, 8, t80, 8, t79, 8);
    t82 = ((char*)((ng4)));
    memset(t83, 0, 8);
    xsi_vlog_unsigned_add(t83, 8, t81, 8, t82, 8);
    goto LAB33;

LAB34:    t88 = (t0 + 784U);
    t89 = *((char **)t88);
    goto LAB35;

LAB36:    xsi_vlog_unsigned_bit_combine(t3, 8, t83, 8, t89, 8);
    goto LAB40;

LAB38:    memcpy(t3, t83, 8);
    goto LAB40;

}

static void Cont_43_2(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    unsigned int t44;
    unsigned int t45;
    char *t46;
    unsigned int t47;
    unsigned int t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;

LAB0:    t1 = (t0 + 2376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 784U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng5)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t34 = *((unsigned int *)t4);
    t35 = (~(t34));
    t36 = *((unsigned int *)t29);
    t37 = (t35 || t36);
    if (t37 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t38, 8);

LAB20:    t39 = (t0 + 3116);
    t40 = (t39 + 32U);
    t41 = *((char **)t40);
    t42 = (t41 + 40U);
    t43 = *((char **)t42);
    memset(t43, 0, 8);
    t44 = 1U;
    t45 = t44;
    t46 = (t3 + 4);
    t47 = *((unsigned int *)t3);
    t44 = (t44 & t47);
    t48 = *((unsigned int *)t46);
    t45 = (t45 & t48);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t50 | t44);
    t51 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t51 | t45);
    xsi_driver_vfirst_trans(t39, 0, 0);
    t52 = (t0 + 3012);
    *((int *)t52) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = ((char*)((ng6)));
    goto LAB13;

LAB14:    t38 = ((char*)((ng1)));
    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t33, 32, t38, 32);
    goto LAB20;

LAB18:    memcpy(t3, t33, 8);
    goto LAB20;

}

static void Cont_44_3(char *t0)
{
    char t3[8];
    char t4[8];
    char t8[8];
    char t24[8];
    char t40[8];
    char t56[8];
    char t64[8];
    char t96[8];
    char t113[8];
    char t129[8];
    char t145[8];
    char t161[8];
    char t169[8];
    char t201[8];
    char t209[8];
    char t237[8];
    char t249[8];
    char t270[8];
    char t278[8];
    char *t1;
    char *t2;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t41;
    char *t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    char *t63;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    unsigned int t76;
    unsigned int t77;
    char *t78;
    char *t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    int t88;
    int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    char *t97;
    unsigned int t98;
    unsigned int t99;
    unsigned int t100;
    unsigned int t101;
    unsigned int t102;
    char *t103;
    char *t104;
    unsigned int t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    char *t109;
    char *t110;
    char *t111;
    char *t112;
    char *t114;
    char *t115;
    unsigned int t116;
    unsigned int t117;
    unsigned int t118;
    unsigned int t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    unsigned int t125;
    unsigned int t126;
    unsigned int t127;
    char *t128;
    char *t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    char *t136;
    char *t137;
    unsigned int t138;
    unsigned int t139;
    unsigned int t140;
    char *t141;
    char *t142;
    char *t143;
    char *t144;
    char *t146;
    char *t147;
    unsigned int t148;
    unsigned int t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    char *t162;
    unsigned int t163;
    unsigned int t164;
    unsigned int t165;
    unsigned int t166;
    unsigned int t167;
    char *t168;
    unsigned int t170;
    unsigned int t171;
    unsigned int t172;
    char *t173;
    char *t174;
    char *t175;
    unsigned int t176;
    unsigned int t177;
    unsigned int t178;
    unsigned int t179;
    unsigned int t180;
    unsigned int t181;
    unsigned int t182;
    char *t183;
    char *t184;
    unsigned int t185;
    unsigned int t186;
    unsigned int t187;
    unsigned int t188;
    unsigned int t189;
    unsigned int t190;
    unsigned int t191;
    unsigned int t192;
    int t193;
    int t194;
    unsigned int t195;
    unsigned int t196;
    unsigned int t197;
    unsigned int t198;
    unsigned int t199;
    unsigned int t200;
    char *t202;
    unsigned int t203;
    unsigned int t204;
    unsigned int t205;
    unsigned int t206;
    unsigned int t207;
    char *t208;
    unsigned int t210;
    unsigned int t211;
    unsigned int t212;
    char *t213;
    char *t214;
    char *t215;
    unsigned int t216;
    unsigned int t217;
    unsigned int t218;
    unsigned int t219;
    unsigned int t220;
    unsigned int t221;
    unsigned int t222;
    char *t223;
    char *t224;
    unsigned int t225;
    unsigned int t226;
    unsigned int t227;
    int t228;
    unsigned int t229;
    unsigned int t230;
    unsigned int t231;
    int t232;
    unsigned int t233;
    unsigned int t234;
    unsigned int t235;
    unsigned int t236;
    char *t238;
    unsigned int t239;
    unsigned int t240;
    unsigned int t241;
    unsigned int t242;
    unsigned int t243;
    char *t244;
    char *t245;
    unsigned int t246;
    unsigned int t247;
    unsigned int t248;
    char *t250;
    char *t251;
    char *t252;
    char *t253;
    unsigned int t254;
    unsigned int t255;
    unsigned int t256;
    unsigned int t257;
    unsigned int t258;
    char *t259;
    char *t260;
    char *t261;
    unsigned int t262;
    unsigned int t263;
    unsigned int t264;
    unsigned int t265;
    unsigned int t266;
    unsigned int t267;
    unsigned int t268;
    unsigned int t269;
    char *t271;
    unsigned int t272;
    unsigned int t273;
    unsigned int t274;
    unsigned int t275;
    unsigned int t276;
    char *t277;
    unsigned int t279;
    unsigned int t280;
    unsigned int t281;
    char *t282;
    char *t283;
    char *t284;
    unsigned int t285;
    unsigned int t286;
    unsigned int t287;
    unsigned int t288;
    unsigned int t289;
    unsigned int t290;
    unsigned int t291;
    char *t292;
    char *t293;
    unsigned int t294;
    unsigned int t295;
    unsigned int t296;
    unsigned int t297;
    unsigned int t298;
    unsigned int t299;
    unsigned int t300;
    unsigned int t301;
    int t302;
    int t303;
    unsigned int t304;
    unsigned int t305;
    unsigned int t306;
    unsigned int t307;
    unsigned int t308;
    unsigned int t309;
    char *t310;
    unsigned int t311;
    unsigned int t312;
    unsigned int t313;
    unsigned int t314;
    unsigned int t315;
    char *t316;
    char *t317;
    unsigned int t318;
    unsigned int t319;
    unsigned int t320;
    char *t321;
    unsigned int t322;
    unsigned int t323;
    unsigned int t324;
    unsigned int t325;
    char *t326;
    char *t327;
    char *t328;
    char *t329;
    char *t330;
    char *t331;
    unsigned int t332;
    unsigned int t333;
    char *t334;
    unsigned int t335;
    unsigned int t336;
    char *t337;
    unsigned int t338;
    unsigned int t339;
    char *t340;

LAB0:    t1 = (t0 + 2520U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1288);
    t5 = (t2 + 36U);
    t6 = *((char **)t5);
    t7 = ((char*)((ng6)));
    memset(t8, 0, 8);
    t9 = (t6 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t6);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    memset(t24, 0, 8);
    t25 = (t8 + 4);
    t26 = *((unsigned int *)t25);
    t27 = (~(t26));
    t28 = *((unsigned int *)t8);
    t29 = (t28 & t27);
    t30 = (t29 & 1U);
    if (t30 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t25) != 0)
        goto LAB10;

LAB11:    t32 = (t24 + 4);
    t33 = *((unsigned int *)t24);
    t34 = *((unsigned int *)t32);
    t35 = (t33 || t34);
    if (t35 > 0)
        goto LAB12;

LAB13:    memcpy(t64, t24, 8);

LAB14:    memset(t96, 0, 8);
    t97 = (t64 + 4);
    t98 = *((unsigned int *)t97);
    t99 = (~(t98));
    t100 = *((unsigned int *)t64);
    t101 = (t100 & t99);
    t102 = (t101 & 1U);
    if (t102 != 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t97) != 0)
        goto LAB28;

LAB29:    t104 = (t96 + 4);
    t105 = *((unsigned int *)t96);
    t106 = (!(t105));
    t107 = *((unsigned int *)t104);
    t108 = (t106 || t107);
    if (t108 > 0)
        goto LAB30;

LAB31:    memcpy(t209, t96, 8);

LAB32:    memset(t237, 0, 8);
    t238 = (t209 + 4);
    t239 = *((unsigned int *)t238);
    t240 = (~(t239));
    t241 = *((unsigned int *)t209);
    t242 = (t241 & t240);
    t243 = (t242 & 1U);
    if (t243 != 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t238) != 0)
        goto LAB64;

LAB65:    t245 = (t237 + 4);
    t246 = *((unsigned int *)t237);
    t247 = *((unsigned int *)t245);
    t248 = (t246 || t247);
    if (t248 > 0)
        goto LAB66;

LAB67:    memcpy(t278, t237, 8);

LAB68:    memset(t4, 0, 8);
    t310 = (t278 + 4);
    t311 = *((unsigned int *)t310);
    t312 = (~(t311));
    t313 = *((unsigned int *)t278);
    t314 = (t313 & t312);
    t315 = (t314 & 1U);
    if (t315 != 0)
        goto LAB82;

LAB83:    if (*((unsigned int *)t310) != 0)
        goto LAB84;

LAB85:    t317 = (t4 + 4);
    t318 = *((unsigned int *)t4);
    t319 = *((unsigned int *)t317);
    t320 = (t318 || t319);
    if (t320 > 0)
        goto LAB86;

LAB87:    t322 = *((unsigned int *)t4);
    t323 = (~(t322));
    t324 = *((unsigned int *)t317);
    t325 = (t323 || t324);
    if (t325 > 0)
        goto LAB88;

LAB89:    if (*((unsigned int *)t317) > 0)
        goto LAB90;

LAB91:    if (*((unsigned int *)t4) > 0)
        goto LAB92;

LAB93:    memcpy(t3, t326, 8);

LAB94:    t327 = (t0 + 3152);
    t328 = (t327 + 32U);
    t329 = *((char **)t328);
    t330 = (t329 + 40U);
    t331 = *((char **)t330);
    memset(t331, 0, 8);
    t332 = 1U;
    t333 = t332;
    t334 = (t3 + 4);
    t335 = *((unsigned int *)t3);
    t332 = (t332 & t335);
    t336 = *((unsigned int *)t334);
    t333 = (t333 & t336);
    t337 = (t331 + 4);
    t338 = *((unsigned int *)t331);
    *((unsigned int *)t331) = (t338 | t332);
    t339 = *((unsigned int *)t337);
    *((unsigned int *)t337) = (t339 | t333);
    xsi_driver_vfirst_trans(t327, 0, 0);
    t340 = (t0 + 3020);
    *((int *)t340) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t24) = 1;
    goto LAB11;

LAB10:    t31 = (t24 + 4);
    *((unsigned int *)t24) = 1;
    *((unsigned int *)t31) = 1;
    goto LAB11;

LAB12:    t36 = (t0 + 1564);
    t37 = (t36 + 36U);
    t38 = *((char **)t37);
    t39 = ((char*)((ng7)));
    memset(t40, 0, 8);
    t41 = (t38 + 4);
    t42 = (t39 + 4);
    t43 = *((unsigned int *)t38);
    t44 = *((unsigned int *)t39);
    t45 = (t43 ^ t44);
    t46 = *((unsigned int *)t41);
    t47 = *((unsigned int *)t42);
    t48 = (t46 ^ t47);
    t49 = (t45 | t48);
    t50 = *((unsigned int *)t41);
    t51 = *((unsigned int *)t42);
    t52 = (t50 | t51);
    t53 = (~(t52));
    t54 = (t49 & t53);
    if (t54 != 0)
        goto LAB18;

LAB15:    if (t52 != 0)
        goto LAB17;

LAB16:    *((unsigned int *)t40) = 1;

LAB18:    memset(t56, 0, 8);
    t57 = (t40 + 4);
    t58 = *((unsigned int *)t57);
    t59 = (~(t58));
    t60 = *((unsigned int *)t40);
    t61 = (t60 & t59);
    t62 = (t61 & 1U);
    if (t62 != 0)
        goto LAB19;

LAB20:    if (*((unsigned int *)t57) != 0)
        goto LAB21;

LAB22:    t65 = *((unsigned int *)t24);
    t66 = *((unsigned int *)t56);
    t67 = (t65 & t66);
    *((unsigned int *)t64) = t67;
    t68 = (t24 + 4);
    t69 = (t56 + 4);
    t70 = (t64 + 4);
    t71 = *((unsigned int *)t68);
    t72 = *((unsigned int *)t69);
    t73 = (t71 | t72);
    *((unsigned int *)t70) = t73;
    t74 = *((unsigned int *)t70);
    t75 = (t74 != 0);
    if (t75 == 1)
        goto LAB23;

LAB24:
LAB25:    goto LAB14;

LAB17:    t55 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB18;

LAB19:    *((unsigned int *)t56) = 1;
    goto LAB22;

LAB21:    t63 = (t56 + 4);
    *((unsigned int *)t56) = 1;
    *((unsigned int *)t63) = 1;
    goto LAB22;

LAB23:    t76 = *((unsigned int *)t64);
    t77 = *((unsigned int *)t70);
    *((unsigned int *)t64) = (t76 | t77);
    t78 = (t24 + 4);
    t79 = (t56 + 4);
    t80 = *((unsigned int *)t24);
    t81 = (~(t80));
    t82 = *((unsigned int *)t78);
    t83 = (~(t82));
    t84 = *((unsigned int *)t56);
    t85 = (~(t84));
    t86 = *((unsigned int *)t79);
    t87 = (~(t86));
    t88 = (t81 & t83);
    t89 = (t85 & t87);
    t90 = (~(t88));
    t91 = (~(t89));
    t92 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t92 & t90);
    t93 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t93 & t91);
    t94 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t94 & t90);
    t95 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t95 & t91);
    goto LAB25;

LAB26:    *((unsigned int *)t96) = 1;
    goto LAB29;

LAB28:    t103 = (t96 + 4);
    *((unsigned int *)t96) = 1;
    *((unsigned int *)t103) = 1;
    goto LAB29;

LAB30:    t109 = (t0 + 1288);
    t110 = (t109 + 36U);
    t111 = *((char **)t110);
    t112 = ((char*)((ng1)));
    memset(t113, 0, 8);
    t114 = (t111 + 4);
    t115 = (t112 + 4);
    t116 = *((unsigned int *)t111);
    t117 = *((unsigned int *)t112);
    t118 = (t116 ^ t117);
    t119 = *((unsigned int *)t114);
    t120 = *((unsigned int *)t115);
    t121 = (t119 ^ t120);
    t122 = (t118 | t121);
    t123 = *((unsigned int *)t114);
    t124 = *((unsigned int *)t115);
    t125 = (t123 | t124);
    t126 = (~(t125));
    t127 = (t122 & t126);
    if (t127 != 0)
        goto LAB36;

LAB33:    if (t125 != 0)
        goto LAB35;

LAB34:    *((unsigned int *)t113) = 1;

LAB36:    memset(t129, 0, 8);
    t130 = (t113 + 4);
    t131 = *((unsigned int *)t130);
    t132 = (~(t131));
    t133 = *((unsigned int *)t113);
    t134 = (t133 & t132);
    t135 = (t134 & 1U);
    if (t135 != 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t130) != 0)
        goto LAB39;

LAB40:    t137 = (t129 + 4);
    t138 = *((unsigned int *)t129);
    t139 = *((unsigned int *)t137);
    t140 = (t138 || t139);
    if (t140 > 0)
        goto LAB41;

LAB42:    memcpy(t169, t129, 8);

LAB43:    memset(t201, 0, 8);
    t202 = (t169 + 4);
    t203 = *((unsigned int *)t202);
    t204 = (~(t203));
    t205 = *((unsigned int *)t169);
    t206 = (t205 & t204);
    t207 = (t206 & 1U);
    if (t207 != 0)
        goto LAB55;

LAB56:    if (*((unsigned int *)t202) != 0)
        goto LAB57;

LAB58:    t210 = *((unsigned int *)t96);
    t211 = *((unsigned int *)t201);
    t212 = (t210 | t211);
    *((unsigned int *)t209) = t212;
    t213 = (t96 + 4);
    t214 = (t201 + 4);
    t215 = (t209 + 4);
    t216 = *((unsigned int *)t213);
    t217 = *((unsigned int *)t214);
    t218 = (t216 | t217);
    *((unsigned int *)t215) = t218;
    t219 = *((unsigned int *)t215);
    t220 = (t219 != 0);
    if (t220 == 1)
        goto LAB59;

LAB60:
LAB61:    goto LAB32;

LAB35:    t128 = (t113 + 4);
    *((unsigned int *)t113) = 1;
    *((unsigned int *)t128) = 1;
    goto LAB36;

LAB37:    *((unsigned int *)t129) = 1;
    goto LAB40;

LAB39:    t136 = (t129 + 4);
    *((unsigned int *)t129) = 1;
    *((unsigned int *)t136) = 1;
    goto LAB40;

LAB41:    t141 = (t0 + 1564);
    t142 = (t141 + 36U);
    t143 = *((char **)t142);
    t144 = ((char*)((ng8)));
    memset(t145, 0, 8);
    t146 = (t143 + 4);
    t147 = (t144 + 4);
    t148 = *((unsigned int *)t143);
    t149 = *((unsigned int *)t144);
    t150 = (t148 ^ t149);
    t151 = *((unsigned int *)t146);
    t152 = *((unsigned int *)t147);
    t153 = (t151 ^ t152);
    t154 = (t150 | t153);
    t155 = *((unsigned int *)t146);
    t156 = *((unsigned int *)t147);
    t157 = (t155 | t156);
    t158 = (~(t157));
    t159 = (t154 & t158);
    if (t159 != 0)
        goto LAB45;

LAB44:    if (t157 != 0)
        goto LAB46;

LAB47:    memset(t161, 0, 8);
    t162 = (t145 + 4);
    t163 = *((unsigned int *)t162);
    t164 = (~(t163));
    t165 = *((unsigned int *)t145);
    t166 = (t165 & t164);
    t167 = (t166 & 1U);
    if (t167 != 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t162) != 0)
        goto LAB50;

LAB51:    t170 = *((unsigned int *)t129);
    t171 = *((unsigned int *)t161);
    t172 = (t170 & t171);
    *((unsigned int *)t169) = t172;
    t173 = (t129 + 4);
    t174 = (t161 + 4);
    t175 = (t169 + 4);
    t176 = *((unsigned int *)t173);
    t177 = *((unsigned int *)t174);
    t178 = (t176 | t177);
    *((unsigned int *)t175) = t178;
    t179 = *((unsigned int *)t175);
    t180 = (t179 != 0);
    if (t180 == 1)
        goto LAB52;

LAB53:
LAB54:    goto LAB43;

LAB45:    *((unsigned int *)t145) = 1;
    goto LAB47;

LAB46:    t160 = (t145 + 4);
    *((unsigned int *)t145) = 1;
    *((unsigned int *)t160) = 1;
    goto LAB47;

LAB48:    *((unsigned int *)t161) = 1;
    goto LAB51;

LAB50:    t168 = (t161 + 4);
    *((unsigned int *)t161) = 1;
    *((unsigned int *)t168) = 1;
    goto LAB51;

LAB52:    t181 = *((unsigned int *)t169);
    t182 = *((unsigned int *)t175);
    *((unsigned int *)t169) = (t181 | t182);
    t183 = (t129 + 4);
    t184 = (t161 + 4);
    t185 = *((unsigned int *)t129);
    t186 = (~(t185));
    t187 = *((unsigned int *)t183);
    t188 = (~(t187));
    t189 = *((unsigned int *)t161);
    t190 = (~(t189));
    t191 = *((unsigned int *)t184);
    t192 = (~(t191));
    t193 = (t186 & t188);
    t194 = (t190 & t192);
    t195 = (~(t193));
    t196 = (~(t194));
    t197 = *((unsigned int *)t175);
    *((unsigned int *)t175) = (t197 & t195);
    t198 = *((unsigned int *)t175);
    *((unsigned int *)t175) = (t198 & t196);
    t199 = *((unsigned int *)t169);
    *((unsigned int *)t169) = (t199 & t195);
    t200 = *((unsigned int *)t169);
    *((unsigned int *)t169) = (t200 & t196);
    goto LAB54;

LAB55:    *((unsigned int *)t201) = 1;
    goto LAB58;

LAB57:    t208 = (t201 + 4);
    *((unsigned int *)t201) = 1;
    *((unsigned int *)t208) = 1;
    goto LAB58;

LAB59:    t221 = *((unsigned int *)t209);
    t222 = *((unsigned int *)t215);
    *((unsigned int *)t209) = (t221 | t222);
    t223 = (t96 + 4);
    t224 = (t201 + 4);
    t225 = *((unsigned int *)t223);
    t226 = (~(t225));
    t227 = *((unsigned int *)t96);
    t228 = (t227 & t226);
    t229 = *((unsigned int *)t224);
    t230 = (~(t229));
    t231 = *((unsigned int *)t201);
    t232 = (t231 & t230);
    t233 = (~(t228));
    t234 = (~(t232));
    t235 = *((unsigned int *)t215);
    *((unsigned int *)t215) = (t235 & t233);
    t236 = *((unsigned int *)t215);
    *((unsigned int *)t215) = (t236 & t234);
    goto LAB61;

LAB62:    *((unsigned int *)t237) = 1;
    goto LAB65;

LAB64:    t244 = (t237 + 4);
    *((unsigned int *)t237) = 1;
    *((unsigned int *)t244) = 1;
    goto LAB65;

LAB66:    t250 = (t0 + 1472);
    t251 = (t250 + 36U);
    t252 = *((char **)t251);
    memset(t249, 0, 8);
    t253 = (t252 + 4);
    t254 = *((unsigned int *)t253);
    t255 = (~(t254));
    t256 = *((unsigned int *)t252);
    t257 = (t256 & t255);
    t258 = (t257 & 1U);
    if (t258 != 0)
        goto LAB72;

LAB70:    if (*((unsigned int *)t253) == 0)
        goto LAB69;

LAB71:    t259 = (t249 + 4);
    *((unsigned int *)t249) = 1;
    *((unsigned int *)t259) = 1;

LAB72:    t260 = (t249 + 4);
    t261 = (t252 + 4);
    t262 = *((unsigned int *)t252);
    t263 = (~(t262));
    *((unsigned int *)t249) = t263;
    *((unsigned int *)t260) = 0;
    if (*((unsigned int *)t261) != 0)
        goto LAB74;

LAB73:    t268 = *((unsigned int *)t249);
    *((unsigned int *)t249) = (t268 & 1U);
    t269 = *((unsigned int *)t260);
    *((unsigned int *)t260) = (t269 & 1U);
    memset(t270, 0, 8);
    t271 = (t249 + 4);
    t272 = *((unsigned int *)t271);
    t273 = (~(t272));
    t274 = *((unsigned int *)t249);
    t275 = (t274 & t273);
    t276 = (t275 & 1U);
    if (t276 != 0)
        goto LAB75;

LAB76:    if (*((unsigned int *)t271) != 0)
        goto LAB77;

LAB78:    t279 = *((unsigned int *)t237);
    t280 = *((unsigned int *)t270);
    t281 = (t279 & t280);
    *((unsigned int *)t278) = t281;
    t282 = (t237 + 4);
    t283 = (t270 + 4);
    t284 = (t278 + 4);
    t285 = *((unsigned int *)t282);
    t286 = *((unsigned int *)t283);
    t287 = (t285 | t286);
    *((unsigned int *)t284) = t287;
    t288 = *((unsigned int *)t284);
    t289 = (t288 != 0);
    if (t289 == 1)
        goto LAB79;

LAB80:
LAB81:    goto LAB68;

LAB69:    *((unsigned int *)t249) = 1;
    goto LAB72;

LAB74:    t264 = *((unsigned int *)t249);
    t265 = *((unsigned int *)t261);
    *((unsigned int *)t249) = (t264 | t265);
    t266 = *((unsigned int *)t260);
    t267 = *((unsigned int *)t261);
    *((unsigned int *)t260) = (t266 | t267);
    goto LAB73;

LAB75:    *((unsigned int *)t270) = 1;
    goto LAB78;

LAB77:    t277 = (t270 + 4);
    *((unsigned int *)t270) = 1;
    *((unsigned int *)t277) = 1;
    goto LAB78;

LAB79:    t290 = *((unsigned int *)t278);
    t291 = *((unsigned int *)t284);
    *((unsigned int *)t278) = (t290 | t291);
    t292 = (t237 + 4);
    t293 = (t270 + 4);
    t294 = *((unsigned int *)t237);
    t295 = (~(t294));
    t296 = *((unsigned int *)t292);
    t297 = (~(t296));
    t298 = *((unsigned int *)t270);
    t299 = (~(t298));
    t300 = *((unsigned int *)t293);
    t301 = (~(t300));
    t302 = (t295 & t297);
    t303 = (t299 & t301);
    t304 = (~(t302));
    t305 = (~(t303));
    t306 = *((unsigned int *)t284);
    *((unsigned int *)t284) = (t306 & t304);
    t307 = *((unsigned int *)t284);
    *((unsigned int *)t284) = (t307 & t305);
    t308 = *((unsigned int *)t278);
    *((unsigned int *)t278) = (t308 & t304);
    t309 = *((unsigned int *)t278);
    *((unsigned int *)t278) = (t309 & t305);
    goto LAB81;

LAB82:    *((unsigned int *)t4) = 1;
    goto LAB85;

LAB84:    t316 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t316) = 1;
    goto LAB85;

LAB86:    t321 = ((char*)((ng6)));
    goto LAB87;

LAB88:    t326 = ((char*)((ng1)));
    goto LAB89;

LAB90:    xsi_vlog_unsigned_bit_combine(t3, 32, t321, 32, t326, 32);
    goto LAB94;

LAB92:    memcpy(t3, t321, 8);
    goto LAB94;

}

static void Always_46_4(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;

LAB0:    t1 = (t0 + 2664U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 3028);
    *((int *)t2) = 1;
    t3 = (t0 + 2692);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(46, ng0);

LAB5:    xsi_set_current_line(47, ng0);
    t4 = (t0 + 692U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(47, ng0);

LAB9:    xsi_set_current_line(48, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1288);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    xsi_set_current_line(49, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1380);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 32);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1564);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 8);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1472);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB8;

}

static void Always_55_5(char *t0)
{
    char t18[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;
    char *t19;
    char *t20;
    char *t21;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;

LAB0:    t1 = (t0 + 2808U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 3036);
    *((int *)t2) = 1;
    t3 = (t0 + 2836);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(55, ng0);

LAB5:    xsi_set_current_line(56, ng0);
    t4 = (t0 + 1060U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(83, ng0);

LAB34:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 1564);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);

LAB35:    t5 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t5, 32);
    if (t15 == 1)
        goto LAB36;

LAB37:    t2 = ((char*)((ng6)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t15 == 1)
        goto LAB38;

LAB39:    t2 = ((char*)((ng13)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t15 == 1)
        goto LAB40;

LAB41:    t2 = ((char*)((ng15)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t15 == 1)
        goto LAB42;

LAB43:    t2 = ((char*)((ng17)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t15 == 1)
        goto LAB44;

LAB45:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t15 == 1)
        goto LAB46;

LAB47:    t2 = ((char*)((ng11)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t15 == 1)
        goto LAB48;

LAB49:    t2 = ((char*)((ng19)));
    t15 = xsi_vlog_unsigned_case_compare(t4, 8, t2, 32);
    if (t15 == 1)
        goto LAB50;

LAB51:
LAB53:
LAB52:    xsi_set_current_line(151, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB54:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(56, ng0);

LAB9:    xsi_set_current_line(57, ng0);
    t11 = (t0 + 1564);
    t12 = (t11 + 36U);
    t13 = *((char **)t12);

LAB10:    t14 = ((char*)((ng1)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 8, t14, 32);
    if (t15 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng8)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 8, t2, 32);
    if (t15 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng7)));
    t15 = xsi_vlog_unsigned_case_compare(t13, 8, t2, 32);
    if (t15 == 1)
        goto LAB15;

LAB16:
LAB18:
LAB17:    xsi_set_current_line(77, ng0);

LAB33:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t4, 32, t5, 32);
    t11 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t11, t18, 0, 0, 32, 0LL);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB19:    goto LAB8;

LAB11:    xsi_set_current_line(58, ng0);

LAB20:    xsi_set_current_line(59, ng0);
    t16 = ((char*)((ng1)));
    t17 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 8, 0LL);
    goto LAB19;

LAB13:    xsi_set_current_line(61, ng0);

LAB21:    xsi_set_current_line(62, ng0);
    t3 = ((char*)((ng1)));
    t4 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t4, t3, 0, 0, 8, 0LL);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t4, 32, t5, 32);
    t11 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t11, t18, 0, 0, 32, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1380);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng6)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t4, 32, t5, 32);
    t11 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t11, t18, 0, 0, 32, 0LL);
    goto LAB19;

LAB15:    xsi_set_current_line(66, ng0);

LAB22:    xsi_set_current_line(67, ng0);
    t3 = (t0 + 1380);
    t4 = (t3 + 36U);
    t5 = *((char **)t4);
    t11 = ((char*)((ng6)));
    memset(t18, 0, 8);
    xsi_vlog_unsigned_add(t18, 32, t5, 32, t11, 32);
    t12 = (t0 + 1380);
    xsi_vlogvar_wait_assign_value(t12, t18, 0, 0, 32, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 1288);
    t3 = (t2 + 36U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng1)));
    memset(t18, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB24;

LAB23:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB24;

LAB27:    if (*((unsigned int *)t4) > *((unsigned int *)t5))
        goto LAB25;

LAB26:    t16 = (t18 + 4);
    t6 = *((unsigned int *)t16);
    t7 = (~(t6));
    t8 = *((unsigned int *)t18);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB28;

LAB29:    xsi_set_current_line(72, ng0);

LAB32:    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 32, 0LL);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 1472);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB30:    goto LAB19;

LAB24:    t14 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB26;

LAB25:    *((unsigned int *)t18) = 1;
    goto LAB26;

LAB28:    xsi_set_current_line(69, ng0);

LAB31:    xsi_set_current_line(70, ng0);
    t17 = (t0 + 1288);
    t19 = (t17 + 36U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng6)));
    memset(t22, 0, 8);
    xsi_vlog_unsigned_minus(t22, 32, t20, 32, t21, 32);
    t23 = (t0 + 1288);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 32, 0LL);
    goto LAB30;

LAB36:    xsi_set_current_line(85, ng0);

LAB55:    xsi_set_current_line(90, ng0);
    t11 = (t0 + 968U);
    t12 = *((char **)t11);
    t11 = ((char*)((ng9)));
    memset(t18, 0, 8);
    t14 = (t12 + 4);
    t16 = (t11 + 4);
    t6 = *((unsigned int *)t12);
    t7 = *((unsigned int *)t11);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t14);
    t10 = *((unsigned int *)t16);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t14);
    t27 = *((unsigned int *)t16);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB59;

LAB56:    if (t28 != 0)
        goto LAB58;

LAB57:    *((unsigned int *)t18) = 1;

LAB59:    t19 = (t18 + 4);
    t31 = *((unsigned int *)t19);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB60;

LAB61:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 968U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng10)));
    memset(t18, 0, 8);
    t5 = (t3 + 4);
    t11 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t11);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t5);
    t27 = *((unsigned int *)t11);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB67;

LAB64:    if (t28 != 0)
        goto LAB66;

LAB65:    *((unsigned int *)t18) = 1;

LAB67:    t14 = (t18 + 4);
    t31 = *((unsigned int *)t14);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB68;

LAB69:    xsi_set_current_line(96, ng0);

LAB72:    xsi_set_current_line(97, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB70:
LAB62:    goto LAB54;

LAB38:    xsi_set_current_line(100, ng0);

LAB73:    xsi_set_current_line(101, ng0);
    t3 = (t0 + 968U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng10)));
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t3);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t12);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB77;

LAB74:    if (t28 != 0)
        goto LAB76;

LAB75:    *((unsigned int *)t18) = 1;

LAB77:    t16 = (t18 + 4);
    t31 = *((unsigned int *)t16);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB78;

LAB79:    xsi_set_current_line(104, ng0);

LAB82:    xsi_set_current_line(105, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB80:    goto LAB54;

LAB40:    xsi_set_current_line(108, ng0);

LAB83:    xsi_set_current_line(109, ng0);
    t3 = (t0 + 968U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng14)));
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t3);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t12);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB87;

LAB84:    if (t28 != 0)
        goto LAB86;

LAB85:    *((unsigned int *)t18) = 1;

LAB87:    t16 = (t18 + 4);
    t31 = *((unsigned int *)t16);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB88;

LAB89:    xsi_set_current_line(112, ng0);

LAB92:    xsi_set_current_line(113, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB90:    goto LAB54;

LAB42:    xsi_set_current_line(116, ng0);

LAB93:    xsi_set_current_line(117, ng0);
    t3 = (t0 + 968U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng16)));
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t3);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t12);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB97;

LAB94:    if (t28 != 0)
        goto LAB96;

LAB95:    *((unsigned int *)t18) = 1;

LAB97:    t16 = (t18 + 4);
    t31 = *((unsigned int *)t16);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB98;

LAB99:    xsi_set_current_line(120, ng0);

LAB102:    xsi_set_current_line(121, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB100:    goto LAB54;

LAB44:    xsi_set_current_line(124, ng0);

LAB103:    xsi_set_current_line(125, ng0);
    t3 = (t0 + 968U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng18)));
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t3);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t12);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB107;

LAB104:    if (t28 != 0)
        goto LAB106;

LAB105:    *((unsigned int *)t18) = 1;

LAB107:    t16 = (t18 + 4);
    t31 = *((unsigned int *)t16);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB108;

LAB109:    xsi_set_current_line(128, ng0);

LAB112:    xsi_set_current_line(129, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB110:    goto LAB54;

LAB46:    xsi_set_current_line(132, ng0);

LAB113:    xsi_set_current_line(133, ng0);
    t3 = ((char*)((ng12)));
    t5 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t5, t3, 0, 0, 8, 0LL);
    goto LAB54;

LAB48:    xsi_set_current_line(135, ng0);

LAB114:    xsi_set_current_line(136, ng0);
    t3 = (t0 + 968U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng18)));
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t3);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t12);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB118;

LAB115:    if (t28 != 0)
        goto LAB117;

LAB116:    *((unsigned int *)t18) = 1;

LAB118:    t16 = (t18 + 4);
    t31 = *((unsigned int *)t16);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB119;

LAB120:    xsi_set_current_line(139, ng0);

LAB123:    xsi_set_current_line(140, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB121:    goto LAB54;

LAB50:    xsi_set_current_line(143, ng0);

LAB124:    xsi_set_current_line(144, ng0);
    t3 = (t0 + 968U);
    t5 = *((char **)t3);
    t3 = ((char*)((ng20)));
    memset(t18, 0, 8);
    t11 = (t5 + 4);
    t12 = (t3 + 4);
    t6 = *((unsigned int *)t5);
    t7 = *((unsigned int *)t3);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t11);
    t10 = *((unsigned int *)t12);
    t24 = (t9 ^ t10);
    t25 = (t8 | t24);
    t26 = *((unsigned int *)t11);
    t27 = *((unsigned int *)t12);
    t28 = (t26 | t27);
    t29 = (~(t28));
    t30 = (t25 & t29);
    if (t30 != 0)
        goto LAB128;

LAB125:    if (t28 != 0)
        goto LAB127;

LAB126:    *((unsigned int *)t18) = 1;

LAB128:    t16 = (t18 + 4);
    t31 = *((unsigned int *)t16);
    t32 = (~(t31));
    t33 = *((unsigned int *)t18);
    t34 = (t33 & t32);
    t35 = (t34 != 0);
    if (t35 > 0)
        goto LAB129;

LAB130:    xsi_set_current_line(147, ng0);

LAB133:    xsi_set_current_line(148, ng0);
    t2 = ((char*)((ng12)));
    t3 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB131:    goto LAB54;

LAB58:    t17 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t17) = 1;
    goto LAB59;

LAB60:    xsi_set_current_line(90, ng0);

LAB63:    xsi_set_current_line(91, ng0);
    t20 = ((char*)((ng6)));
    t21 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t21, t20, 0, 0, 8, 0LL);
    goto LAB62;

LAB66:    t12 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB67;

LAB68:    xsi_set_current_line(93, ng0);

LAB71:    xsi_set_current_line(94, ng0);
    t16 = ((char*)((ng11)));
    t17 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t17, t16, 0, 0, 8, 0LL);
    goto LAB70;

LAB76:    t14 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB77;

LAB78:    xsi_set_current_line(101, ng0);

LAB81:    xsi_set_current_line(102, ng0);
    t17 = ((char*)((ng13)));
    t19 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t19, t17, 0, 0, 8, 0LL);
    goto LAB80;

LAB86:    t14 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB87;

LAB88:    xsi_set_current_line(109, ng0);

LAB91:    xsi_set_current_line(110, ng0);
    t17 = ((char*)((ng15)));
    t19 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t19, t17, 0, 0, 8, 0LL);
    goto LAB90;

LAB96:    t14 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB97;

LAB98:    xsi_set_current_line(117, ng0);

LAB101:    xsi_set_current_line(118, ng0);
    t17 = ((char*)((ng17)));
    t19 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t19, t17, 0, 0, 8, 0LL);
    goto LAB100;

LAB106:    t14 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB107;

LAB108:    xsi_set_current_line(125, ng0);

LAB111:    xsi_set_current_line(126, ng0);
    t17 = ((char*)((ng8)));
    t19 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t19, t17, 0, 0, 8, 0LL);
    goto LAB110;

LAB117:    t14 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB118;

LAB119:    xsi_set_current_line(136, ng0);

LAB122:    xsi_set_current_line(137, ng0);
    t17 = ((char*)((ng19)));
    t19 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t19, t17, 0, 0, 8, 0LL);
    goto LAB121;

LAB127:    t14 = (t18 + 4);
    *((unsigned int *)t18) = 1;
    *((unsigned int *)t14) = 1;
    goto LAB128;

LAB129:    xsi_set_current_line(144, ng0);

LAB132:    xsi_set_current_line(145, ng0);
    t17 = ((char*)((ng7)));
    t19 = (t0 + 1564);
    xsi_vlogvar_wait_assign_value(t19, t17, 0, 0, 8, 0LL);
    goto LAB131;

}


extern void work_m_00000000001455669165_1075435344_init()
{
	static char *pe[] = {(void *)Initial_32_0,(void *)Cont_42_1,(void *)Cont_43_2,(void *)Cont_44_3,(void *)Always_46_4,(void *)Always_55_5};
	xsi_register_didat("work_m_00000000001455669165_1075435344", "isim/test_bc_isim_beh.exe.sim/work/m_00000000001455669165_1075435344.didat");
	xsi_register_executes(pe);
}
