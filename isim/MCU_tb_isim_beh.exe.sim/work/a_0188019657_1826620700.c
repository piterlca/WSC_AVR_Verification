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
static const char *ng0 = "C:/Users/Piotr/workspace/vlsi/vlsi_mcu - Copy/VLSI_PN_212451_CIELECKI/io_port.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0188019657_1826620700_p_0(char *t0)
{
    char t11[16];
    char t17[16];
    char t25[16];
    char t31[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    char *t9;
    int t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    char *t22;
    unsigned int t23;
    int t24;
    char *t26;
    char *t28;
    char *t29;
    char *t32;
    char *t33;
    int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    int t38;
    char *t39;
    char *t40;
    unsigned char t41;
    unsigned char t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;

LAB0:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1780U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4060);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t4 = (t0 + 1896U);
    t8 = *((char **)t4);
    t4 = (t0 + 9140);
    t10 = xsi_mem_cmp(t4, t8, 16U);
    if (t10 == 1)
        goto LAB9;

LAB13:    t12 = (t0 + 9156);
    t14 = (t0 + 8976U);
    t15 = (t0 + 9172);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 0;
    t19 = (t18 + 4U);
    *((int *)t19) = 15;
    t19 = (t18 + 8U);
    *((int *)t19) = 1;
    t20 = (15 - 0);
    t21 = (t20 * 1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t19 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t11, t12, t14, t15, t17);
    t22 = (t11 + 12U);
    t21 = *((unsigned int *)t22);
    t23 = (1U * t21);
    t24 = xsi_mem_cmp(t19, t8, t23);
    if (t24 == 1)
        goto LAB10;

LAB14:    t26 = (t0 + 9188);
    t28 = (t0 + 8976U);
    t29 = (t0 + 9204);
    t32 = (t31 + 0U);
    t33 = (t32 + 0U);
    *((int *)t33) = 0;
    t33 = (t32 + 4U);
    *((int *)t33) = 15;
    t33 = (t32 + 8U);
    *((int *)t33) = 1;
    t34 = (15 - 0);
    t35 = (t34 * 1);
    t35 = (t35 + 1);
    t33 = (t32 + 12U);
    *((unsigned int *)t33) = t35;
    t33 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t25, t26, t28, t29, t31);
    t36 = (t25 + 12U);
    t35 = *((unsigned int *)t36);
    t37 = (1U * t35);
    t38 = xsi_mem_cmp(t33, t8, t37);
    if (t38 == 1)
        goto LAB11;

LAB15:
LAB12:    xsi_set_current_line(57, ng0);
    t2 = xsi_get_transient_memory(8U);
    memset(t2, 0, 8U);
    t4 = t2;
    memset(t4, (unsigned char)4, 8U);
    t5 = (t0 + 4112);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    t12 = (t9 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 8U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(57, ng0);
    t2 = xsi_get_transient_memory(16U);
    memset(t2, 0, 16U);
    t4 = t2;
    memset(t4, (unsigned char)4, 16U);
    t5 = (t0 + 4220);
    t8 = (t5 + 32U);
    t9 = *((char **)t8);
    t12 = (t9 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t2, 16U);
    xsi_driver_first_trans_fast_port(t5);

LAB8:    goto LAB3;

LAB5:    t4 = (t0 + 1804U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB9:    xsi_set_current_line(48, ng0);
    t39 = (t0 + 2080U);
    t40 = *((char **)t39);
    t41 = *((unsigned char *)t40);
    t42 = (t41 == (unsigned char)2);
    if (t42 != 0)
        goto LAB17;

LAB19:
LAB18:    goto LAB8;

LAB10:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 2080U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB20;

LAB22:
LAB21:    goto LAB8;

LAB11:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2080U);
    t4 = *((char **)t2);
    t1 = *((unsigned char *)t4);
    t3 = (t1 == (unsigned char)3);
    if (t3 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB8;

LAB16:;
LAB17:    xsi_set_current_line(48, ng0);
    t39 = (t0 + 2356U);
    t43 = *((char **)t39);
    t39 = (t0 + 4112);
    t44 = (t39 + 32U);
    t45 = *((char **)t44);
    t46 = (t45 + 40U);
    t47 = *((char **)t46);
    memcpy(t47, t43, 8U);
    xsi_driver_first_trans_fast_port(t39);
    goto LAB18;

LAB20:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 1988U);
    t5 = *((char **)t2);
    t2 = (t0 + 4148);
    t8 = (t2 + 32U);
    t9 = *((char **)t8);
    t12 = (t9 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t5, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB21;

LAB23:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1988U);
    t5 = *((char **)t2);
    t2 = (t0 + 4184);
    t8 = (t2 + 32U);
    t9 = *((char **)t8);
    t12 = (t9 + 40U);
    t13 = *((char **)t12);
    memcpy(t13, t5, 8U);
    xsi_driver_first_trans_fast(t2);
    goto LAB24;

}

static void work_a_0188019657_1826620700_p_1(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;

LAB0:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 2448U);
    t2 = *((char **)t1);
    t1 = (t0 + 9040U);
    t3 = (t0 + 9220);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 7;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (7 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB2:    t16 = (t0 + 4068);
    *((int *)t16) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 2172U);
    t11 = *((char **)t7);
    t7 = (t0 + 4256);
    t12 = (t7 + 32U);
    t13 = *((char **)t12);
    t14 = (t13 + 40U);
    t15 = *((char **)t14);
    memcpy(t15, t11, 8U);
    xsi_driver_first_trans_fast(t7);
    goto LAB2;

}


extern void work_a_0188019657_1826620700_init()
{
	static char *pe[] = {(void *)work_a_0188019657_1826620700_p_0,(void *)work_a_0188019657_1826620700_p_1};
	xsi_register_didat("work_a_0188019657_1826620700", "isim/MCU_tb_isim_beh.exe.sim/work/a_0188019657_1826620700.didat");
	xsi_register_executes(pe);
}
