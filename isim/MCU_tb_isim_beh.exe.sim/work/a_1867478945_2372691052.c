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
static const char *ng0 = "C:/Users/Piotr/workspace/vlsi/vlsi_mcu - Copy/VLSI_PN_212451_CIELECKI/test.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3564397177;
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
void ieee_p_3564397177_sub_3988856810_91900896(char *, char *, char *, char *, char *);


static void work_a_1867478945_2372691052_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    int64 t7;
    int64 t8;

LAB0:    t1 = (t0 + 2408U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 2784);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(58, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2308);
    xsi_process_wait(t2, t8);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2784);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t7 = *((int64 *)t3);
    t8 = (t7 / 2);
    t2 = (t0 + 2308);
    xsi_process_wait(t2, t8);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    goto LAB2;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

}

static void work_a_1867478945_2372691052_p_1(char *t0)
{
    char t14[16];
    char t18[16];
    char t20[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    char *t13;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t19;
    char *t21;
    char *t22;
    int t23;
    unsigned int t24;
    int t25;
    char *t26;
    int t27;
    int64 t28;
    int64 t29;

LAB0:    t1 = (t0 + 2552U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2820);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 1476U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((unsigned char *)t2) = (unsigned char)1;
    t4 = (t0 + 1440U);
    xsi_variable_act(t4);
    xsi_set_current_line(75, ng0);
    t2 = (t0 + 592U);
    t3 = *((char **)t2);
    t8 = *((unsigned char *)t3);
    t9 = (t8 == (unsigned char)2);
    if (t9 == 1)
        goto LAB7;

LAB8:    t7 = (unsigned char)0;

LAB9:    if (t7 != 0)
        goto LAB4;

LAB6:
LAB5:    xsi_set_current_line(109, ng0);
    t2 = (t0 + 1476U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((unsigned char *)t2) = (unsigned char)0;
    t4 = (t0 + 1440U);
    xsi_variable_act(t4);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 2856);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 2820);
    t3 = (t2 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 40U);
    t6 = *((char **)t5);
    *((unsigned char *)t6) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t28 = *((int64 *)t3);
    t29 = (110 * t28);
    t2 = (t0 + 2452);
    xsi_process_wait(t2, t29);

LAB30:    *((char **)t1) = &&LAB31;

LAB1:    return;
LAB4:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 2856);
    t5 = (t2 + 32U);
    t6 = *((char **)t5);
    t12 = (t6 + 40U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(78, ng0);
    t2 = (t0 + 2452);
    t3 = (t0 + 1936U);
    t4 = (t0 + 2040U);
    std_textio_readline(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(80, ng0);

LAB10:    t2 = (t0 + 1936U);
    t7 = std_textio_endfile(t2);
    t8 = (!(t7));
    if (t8 != 0)
        goto LAB11;

LAB13:    goto LAB5;

LAB7:    t2 = (t0 + 1476U);
    t4 = *((char **)t2);
    t10 = *((unsigned char *)t4);
    t11 = (t10 == (unsigned char)1);
    t7 = t11;
    goto LAB9;

LAB11:    xsi_set_current_line(81, ng0);
    t3 = (t0 + 2452);
    t4 = (t0 + 1936U);
    t5 = (t0 + 2040U);
    std_textio_readline(STD_TEXTIO, t3, t4, t5);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 2452);
    t3 = (t0 + 2040U);
    t4 = (t0 + 1544U);
    t5 = *((char **)t4);
    t4 = (t0 + 5888U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t5, t4);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2452);
    t3 = (t0 + 2040U);
    t4 = (t0 + 1612U);
    t5 = *((char **)t4);
    t4 = (t0 + 5904U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t5, t4);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 2452);
    t3 = (t0 + 2040U);
    t4 = (t0 + 1544U);
    t5 = *((char **)t4);
    t4 = (t0 + 5888U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t5, t4);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1612U);
    t3 = *((char **)t2);
    t4 = ((IEEE_P_2592010699) + 2332);
    t5 = (t0 + 5904U);
    t2 = xsi_base_array_concat(t2, t14, t4, (char)99, (unsigned char)2, (char)97, t3, t5, (char)101);
    t6 = (t0 + 1544U);
    t12 = *((char **)t6);
    t15 = (3 - 3);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t6 = (t12 + t17);
    t19 = ((IEEE_P_2592010699) + 2332);
    t21 = (t20 + 0U);
    t22 = (t21 + 0U);
    *((int *)t22) = 3;
    t22 = (t21 + 4U);
    *((int *)t22) = 1;
    t22 = (t21 + 8U);
    *((int *)t22) = -1;
    t23 = (1 - 3);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t24;
    t13 = xsi_base_array_concat(t13, t18, t19, (char)97, t2, t14, (char)97, t6, t20, (char)101);
    t25 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t13, t18);
    t22 = (t0 + 1680U);
    t26 = *((char **)t22);
    t22 = (t26 + 0);
    *((int *)t22) = t25;
    xsi_set_current_line(86, ng0);
    t2 = (t0 + 6088);
    *((int *)t2) = 0;
    t3 = (t0 + 6092);
    *((int *)t3) = 5;
    t23 = 0;
    t25 = 5;

LAB14:    if (t23 <= t25)
        goto LAB15;

LAB17:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 1680U);
    t3 = *((char **)t2);
    t23 = *((int *)t3);
    t2 = (t0 + 6096);
    *((int *)t2) = 1;
    t4 = (t0 + 6100);
    *((int *)t4) = t23;
    t25 = 1;
    t27 = t23;

LAB19:    if (t25 <= t27)
        goto LAB20;

LAB22:    goto LAB10;

LAB12:;
LAB15:    xsi_set_current_line(87, ng0);
    t4 = (t0 + 2452);
    t5 = (t0 + 2040U);
    t6 = (t0 + 1544U);
    t12 = *((char **)t6);
    t6 = (t0 + 5888U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t4, t5, t12, t6);

LAB16:    t2 = (t0 + 6088);
    t23 = *((int *)t2);
    t3 = (t0 + 6092);
    t25 = *((int *)t3);
    if (t23 == t25)
        goto LAB17;

LAB18:    t27 = (t23 + 1);
    t23 = t27;
    t4 = (t0 + 6088);
    *((int *)t4) = t23;
    goto LAB14;

LAB20:    xsi_set_current_line(91, ng0);
    t5 = (t0 + 2452);
    t6 = (t0 + 2040U);
    t12 = (t0 + 1612U);
    t13 = *((char **)t12);
    t12 = (t0 + 5904U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t5, t6, t13, t12);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2452);
    t3 = (t0 + 2040U);
    t4 = (t0 + 1544U);
    t5 = *((char **)t4);
    t4 = (t0 + 5888U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t5, t4);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 1612U);
    t3 = *((char **)t2);
    t2 = (t0 + 1544U);
    t4 = *((char **)t2);
    t5 = ((IEEE_P_2592010699) + 2332);
    t6 = (t0 + 5904U);
    t12 = (t0 + 5888U);
    t2 = xsi_base_array_concat(t2, t14, t5, (char)97, t3, t6, (char)97, t4, t12, (char)101);
    t13 = (t0 + 1748U);
    t19 = *((char **)t13);
    t15 = (15 - 7);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t19 + t17);
    t24 = (4U + 4U);
    memcpy(t13, t2, t24);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2452);
    t3 = (t0 + 2040U);
    t4 = (t0 + 1612U);
    t5 = *((char **)t4);
    t4 = (t0 + 5904U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t5, t4);
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 2452);
    t3 = (t0 + 2040U);
    t4 = (t0 + 1544U);
    t5 = *((char **)t4);
    t4 = (t0 + 5888U);
    ieee_p_3564397177_sub_3988856810_91900896(IEEE_P_3564397177, t2, t3, t5, t4);
    xsi_set_current_line(97, ng0);
    t2 = (t0 + 1612U);
    t3 = *((char **)t2);
    t2 = (t0 + 1544U);
    t4 = *((char **)t2);
    t5 = ((IEEE_P_2592010699) + 2332);
    t6 = (t0 + 5904U);
    t12 = (t0 + 5888U);
    t2 = xsi_base_array_concat(t2, t14, t5, (char)97, t3, t6, (char)97, t4, t12, (char)101);
    t13 = (t0 + 1748U);
    t19 = *((char **)t13);
    t15 = (15 - 15);
    t16 = (t15 * 1U);
    t17 = (0 + t16);
    t13 = (t19 + t17);
    t24 = (4U + 4U);
    memcpy(t13, t2, t24);
    xsi_set_current_line(99, ng0);
    t2 = (t0 + 1748U);
    t3 = *((char **)t2);
    t2 = (t0 + 2892);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 40U);
    t12 = *((char **)t6);
    memcpy(t12, t3, 16U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(100, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t28 = *((int64 *)t3);
    t29 = (1 * t28);
    t2 = (t0 + 2452);
    xsi_process_wait(t2, t29);

LAB25:    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB21:    t2 = (t0 + 6096);
    t25 = *((int *)t2);
    t3 = (t0 + 6100);
    t27 = *((int *)t3);
    if (t25 == t27)
        goto LAB22;

LAB27:    t23 = (t25 + 1);
    t25 = t23;
    t4 = (t0 + 6096);
    *((int *)t4) = t25;
    goto LAB19;

LAB23:    goto LAB21;

LAB24:    goto LAB23;

LAB26:    goto LAB24;

LAB28:    xsi_set_current_line(113, ng0);
    t2 = (t0 + 6104);
    t4 = (t0 + 2928);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    t12 = (t6 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 1408U);
    t3 = *((char **)t2);
    t28 = *((int64 *)t3);
    t29 = (60 * t28);
    t2 = (t0 + 2452);
    xsi_process_wait(t2, t29);

LAB34:    *((char **)t1) = &&LAB35;
    goto LAB1;

LAB29:    goto LAB28;

LAB31:    goto LAB29;

LAB32:    xsi_set_current_line(116, ng0);
    if ((unsigned char)0 == 0)
        goto LAB36;

LAB37:    goto LAB2;

LAB33:    goto LAB32;

LAB35:    goto LAB33;

LAB36:    t2 = (t0 + 6112);
    xsi_report(t2, 19U, (unsigned char)3);
    goto LAB37;

}


extern void work_a_1867478945_2372691052_init()
{
	static char *pe[] = {(void *)work_a_1867478945_2372691052_p_0,(void *)work_a_1867478945_2372691052_p_1};
	xsi_register_didat("work_a_1867478945_2372691052", "isim/MCU_tb_isim_beh.exe.sim/work/a_1867478945_2372691052.didat");
	xsi_register_executes(pe);
}
