/*
 * Copyright (C) Huawei Technologies Co., Ltd. 2012-2015. All rights reserved.
 * foss@huawei.com
 *
 * If distributed as part of the Linux kernel, the following license terms
 * apply:
 *
 * * This program is free software; you can redistribute it and/or modify
 * * it under the terms of the GNU General Public License version 2 and
 * * only version 2 as published by the Free Software Foundation.
 * *
 * * This program is distributed in the hope that it will be useful,
 * * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * * GNU General Public License for more details.
 * *
 * * You should have received a copy of the GNU General Public License
 * * along with this program; if not, write to the Free Software
 * * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307, USA
 *
 * Otherwise, the following license terms apply:
 *
 * * Redistribution and use in source and binary forms, with or without
 * * modification, are permitted provided that the following conditions
 * * are met:
 * * 1) Redistributions of source code must retain the above copyright
 * *    notice, this list of conditions and the following disclaimer.
 * * 2) Redistributions in binary form must reproduce the above copyright
 * *    notice, this list of conditions and the following disclaimer in the
 * *    documentation and/or other materials provided with the distribution.
 * * 3) Neither the name of Huawei nor the names of its contributors may
 * *    be used to endorse or promote products derived from this software
 * *    without specific prior written permission.
 *
 * * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 */

/************************************************************************
  Copyright   : 2013-2015, Huawei Tech. Co., Ltd.
  File name   : csimagent.h
  Author      : l00256032
  Version     : V900R001
  Date        : 2013-12-19
  Description : L+C��SIM����Ŀͷ�ļ���ض���---
  History     :
   1.Date:2013-12-19
     Author: L47619
     Modification:create

************************************************************************/

#ifndef __CSIMAGENT_H__
#define __CSIMAGENT_H__

/*****************************************************************************
  1 ����ͷ�ļ�����
*****************************************************************************/
#include "UsimPsInterface.h"
#include "siapppih.h"
#include "usimmbase.h"
#include "siappstk.h"

#ifdef __cplusplus
#if __cplusplus
extern "C" {
#endif
#endif
/* ��CBP�ԽӵĽӿڣ���ǿ��Ҫ�����ֽڶ��� */
#pragma pack(1)

/*****************************************************************************
  2 �궨��
*****************************************************************************/
#define UIM_ERR_TIMEOUT                   (4)
#define STK_PROACTIVE_DATA_LEN            (256)
#define CSIMA_CBP_MSG_DATA_RSV            (4)
#define CSIMA_CARD_CHANEL_NULL            (0xFF)

/* CSIMA LOG�� */
#define CSIMA_INFO_LOG(string)            PS_LOG(WUEPS_PID_CSIMA, 0, PS_PRINT_INFO,   string)
#define CSIMA_NORMAL_LOG(string)          PS_LOG(WUEPS_PID_CSIMA, 0, PS_PRINT_NORMAL, string)
#define CSIMA_WARNING_LOG(string)         PS_LOG(WUEPS_PID_CSIMA, 0, PS_PRINT_WARNING,string)
#define CSIMA_ERROR_LOG(string)           PS_LOG(WUEPS_PID_CSIMA, 0, PS_PRINT_ERROR,  string)

#define CSIMA_INFO1_LOG(string, para1)    PS_LOG1(WUEPS_PID_CSIMA, 0, PS_PRINT_INFO,   string, para1)
#define CSIMA_NORMAL1_LOG(string, para1)  PS_LOG1(WUEPS_PID_CSIMA, 0, PS_PRINT_NORMAL, string, para1)
#define CSIMA_WARNING1_LOG(string, para1) PS_LOG1(WUEPS_PID_CSIMA, 0, PS_PRINT_WARNING,string, para1)
#define CSIMA_ERROR1_LOG(string, para1)   PS_LOG1(WUEPS_PID_CSIMA, 0, PS_PRINT_ERROR,  string, para1)

/*******************************************************************************
  3 ö�ٶ���
*******************************************************************************/
/*****************************************************************************
 ö����    :CSIMA_ICC_MODE_ENUM
 �ṹ˵��  :CSIMA ��ǰ��Ӧ��ģʽö�ٶ���
*****************************************************************************/
enum CSIMA_ICC_MODE_ENUM
{
    CSIMA_ICC_MODE                      = 0x00,
    CSIMA_UICC_MODE                     = 0x01,
    CSIMA_ICC_MODE_BUTT
};
typedef VOS_UINT32     CSIMA_ICC_MODE_ENUM_UINT32;

/*****************************************************************************
 ö����    :CSIMA_CBP_CARD_TYPE_ENUM
 �ṹ˵��  :CSIMA��CBP�俨���Ͷ���,ʵ����дʱ��BIT��
*****************************************************************************/
enum CSIMA_CBP_CARD_TYPE_ENUM
{
    CSIMA_CBP_CARD_NONE                 = 0x00,
    CSIMA_CBP_UIM_CARD                  = 0x01,
    CSIMA_CBP_SIM_CARD                  = 0x02,
    CSIMA_CBP_UICC_CARD                 = 0x04,
    CSIMA_CBP_CSIM_CARD                 = 0x10,
    CSIMA_CBP_USIM_CARD                 = 0x20,
    CSIMA_CBP_ISIM_CARD                 = 0x40,
    CSIMA_CBP_UNKNOWN_CARD              = 0x80,
    CSIMA_CBP_CARD_TYPE_BUTT
};
typedef VOS_UINT16     CSIMA_CBP_CARD_TYPE_ENUM_UINT16;

/*****************************************************************************
 ö����    :CSIMA_CBP_UICC_MSGID_ENUM
 �ṹ˵��  :CSIMA��CBP����UICC��ϢIDö��
*****************************************************************************/
enum CSIMA_CBP_UICC_MSGID_ENUM
{
    CSIMA_CBP_UICC_CTPDU_MSG            = 0x00, /* ����CSIMӦ��������Ϣ */
    CSIMA_CBP_UICC_RTPDU_MSG            = 0x01, /* ����CSIMӦ�ûظ���Ϣ */
    CSIMA_CBP_UICC_RST_REQ_MSG          = 0x02, /* RESET���� */
    CSIMA_CBP_UICC_STATUS_IND_MSG       = 0x03, /* ��״̬�ϱ� */
    CSIMA_CBP_UICC_PROACTIVE_CMD_MSG    = 0x04, /* ���������ϱ� */
    CSIMA_CBP_UICC_TERMINALRESPONSE_MSG = 0x05, /* ��������ִ�н�� */
    CSIMA_CBP_UICC_RESACC_REQ_MSG       = 0x07, /* ���޷���USIMӦ��������Ϣ */
    CSIMA_CBP_UICC_RESACC_RSP_MSG       = 0x08, /* ���޷���USIMӦ�ûظ���Ϣ */
    CSIMA_CBP_UICC_HANDSHAKE_MSG        = 0xee, /* VIA��BALONG���ִ��� */
    CSIMA_CBP_UICC_MSGID_BUTT
};
typedef VOS_UINT32     CSIMA_CBP_UICC_MSGID_ENUM_UINT32;

/*****************************************************************************
 ö����    :CSIMA_CBP_CARD_STATUS_ENUM
 �ṹ˵��  :CSIMA��CBP�ϱ��Ŀ�״̬ö��
*****************************************************************************/
enum CSIMA_CBP_CARD_STATUS_ENUM
{
    CSIMA_CBP_CARD_NOT_READY            = 0x00, /* ��ʼ��ʧ���ϱ� */
    CSIMA_CBP_CARD_ERROR,                       /* ��ʱ����Ҫ */
    CSIMA_CBP_CARD_REPLACED,                    /* ��ʱ����Ҫ */
    CSIMA_CBP_CARD_READY,                       /* ��ʼ���ɹ��ϱ� */
    CSIMA_CBP_CARD_BOOTUP,                      /* ��ʼ��δ��ɻ�ȴ�PINУ�� */
    CSIMA_CBP_CARD_LINK_FAILURE,                /* ��ʱ����Ҫ */
    CSIMA_CBP_CARD_STATUS_BUTT
};
typedef VOS_UINT16     CSIMA_CBP_CARD_STATUS_ENUM_UINT16;

/*****************************************************************************
 ö����    :CSIMA_ICC_MODE_ENUM
 �ṹ˵��  :CSIMA ��ǰ��Ӧ��ģʽö�ٶ���
*****************************************************************************/
enum CSIMA_EVENTLIST_RESEND_ENUM
{
    CSIMA_EVENTLIST_RESEND_INIT           = 0x00,
    CSIMA_EVENTLIST_NEED_RESEND           = 0x01,
    CSIMA_EVENTLIST_RESENT                = 0X02,
    CSIMA_EVENTLIST_BUTT
};
typedef VOS_UINT32     CSIMA_EVENTLIST_RESEND_ENUM_UINT32;

/*****************************************************************************
  4 �ṹ�嶨��
*****************************************************************************/
/*****************************************************************************
 �ṹ��    :CSIMA_CBP_MSG_STRU
 �ṹ˵��  :CSIMA��CBP������Ϣ�ṹ
*****************************************************************************/
typedef struct
{
    VOS_MSG_HEADER
    VOS_UINT32                               ulIPCMsgId;                     /* ��ϢID */
}CSIMA_CBP_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_CBP_STATUS_IND_MSG_STRU
 �ṹ˵��  :CSIMA��CBP�ϱ���״̬�ṹ
*****************************************************************************/
typedef struct
{
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    CSIMA_CBP_CARD_STATUS_ENUM_UINT16       enStatus;                       /* ��״̬ */
    VOS_UINT16                              usCardType;                     /* �����ͣ���Ӧ�õ������bit��ʾ����Ӧ������,����ֶ���status readyʱ����Ϊ������ */
    VOS_UINT8                               ucCSIMChanNum;                  /* CSIMͨ���� */
    VOS_UINT8                               ucUSIMChanNum;                  /* USIMͨ���� */
    VOS_UINT8                               ucISIMChanNum;                  /* ISIMͨ���ţ���֧�֣���0xff */
    VOS_UINT8                               aucCSIMAID[USIMM_AID_LEN_MAX];  /* CSIM AID */
    VOS_UINT8                               aucUSIMAID[USIMM_AID_LEN_MAX];  /* USIM AID */
    VOS_UINT8                               aucISIMAID[USIMM_AID_LEN_MAX];  /* ISIM AID,��֧�֣���0xff */
    VOS_UINT32                              ulWWT;                          /* work waiting time,��ʱ����Ҫ����0 */
    VOS_UINT8                               ucATRLen;                       /* ATR���ȣ���ʱ����Ҫ����0 */
    VOS_UINT8                               aucATR[1];                      /* ATR���ݣ���ʱ����Ҫ�����һ���ֽ�0 */
}CSIMA_CBP_STATUS_IND_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_CBP_CTPDU_MSG_STRU
 �ṹ˵��  :CBP����CSIMӦ���������ݽṹ
*****************************************************************************/
typedef struct
{
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    VOS_UINT8                               aucCTPDUHdr[USIMM_APDU_HEADLEN];/* CTPDUͷ */
    VOS_UINT8                               ucChanNum;                      /* ͨ���� */
    VOS_UINT16                              usDataLen;                      /* ���ݳ��� */
    VOS_UINT8                               aucData[CSIMA_CBP_MSG_DATA_RSV];/* ���� */
}CSIMA_CBP_CTPDU_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_CBP_RTPDU_MSG_STRU
 �ṹ˵��  :CBP����CSIMӦ�ûظ����ݽṹ
*****************************************************************************/
typedef struct
{
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    VOS_UINT16                              usSWStatus;                     /* SW1�ڵ�λ��SW2�ڸ�λ */
    VOS_UINT16                              usDataLen;                      /* ���ݳ��� */
    VOS_UINT8                               aucData[CSIMA_CBP_MSG_DATA_RSV];/* ���� */
}CSIMA_CBP_RTPDU_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_CBP_PROACTIVE_CMD_MSG_STRU
 �ṹ˵��  :CSIMA��CBP���͵���������ṹ
*****************************************************************************/
typedef struct
{
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    VOS_UINT16                              usDataLen;                      /* ���ݳ��� */
    VOS_UINT8                               aucData[STK_PROACTIVE_DATA_LEN];/* ���� */
}CSIMA_CBP_PROACTIVE_CMD_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_CBP_TERMINALRESPONSE_MSG_STRU
 �ṹ˵��  :CBP�ظ���CSIMA����������ִ�н�����ݽṹ
*****************************************************************************/
typedef struct
{
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    VOS_UINT16                              usDataLen;                      /* ���ݳ��� */
    VOS_UINT8                               aucData[CSIMA_CBP_MSG_DATA_RSV];/* ���� */
}CSIMA_CBP_TERMINALRESPONSE_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_CBP_RESACC_REQ_MSG_STRU
 �ṹ˵��  :CBP����USIMӦ�����ļ��������ݽṹ
*****************************************************************************/
typedef struct
{
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    VOS_UINT8                               ucChanNum;                      /* ͨ���� */
    VOS_UINT8                               ucCmd;                          /* �������� */
    VOS_UINT16                              usFileId;                       /* �ļ�ID����λ��ǰ��λ�ں� */
    VOS_UINT8                               ucP1;                           /* P1���� */
    VOS_UINT8                               ucP2;                           /* P2���� */
    VOS_UINT8                               ucP3;                           /* P3���� */
    VOS_UINT8                               ucLen;                          /* aucData�������ݳ��ȣ�������·������ */
    VOS_UINT16                              usPathLen;                      /* ·������ */
    VOS_UINT8                               aucData[CSIMA_CBP_MSG_DATA_RSV];/* ����+·����·�����Ѱ����ļ�ID */
}CSIMA_CBP_RESACC_REQ_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_CBP_RESACC_RSP_MSG_STRU
 �ṹ˵��  :CBP����USIMӦ�����ļ��ظ����ݽṹ
*****************************************************************************/
typedef struct
{
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    VOS_UINT16                              usSWStatus;                     /* SW1�ڵ�λ��SW2�ڸ�λ */
    VOS_UINT16                              usDataLen;                      /* ���ݳ��� */
    VOS_UINT8                               aucData[CSIMA_CBP_MSG_DATA_RSV];/* ���� */
}CSIMA_CBP_RESACC_RSP_MSG_STRU;

/*****************************************************************************
 �ṹ��    :CSIMA_STK_PROACTIVE_CMD_MSG_STRU
 �ṹ˵��  :STK��CSIMA���������������Ϣ�ṹ
*****************************************************************************/
typedef struct
{
    VOS_MSG_HEADER
    CSIMA_CBP_UICC_MSGID_ENUM_UINT32        enIPCMsgId;                     /* ��ϢID */
    VOS_UINT32                              ulLen;
    VOS_UINT8                               aucProactiveCmd[STK_PROACTIVE_DATA_LEN];
}CSIMA_STK_PROACTIVE_CMD_MSG_STRU;

/*****************************************************************************
 �ṹ��    : CSIMA_CARDINFO_STRU
 �ṹ˵��  : CSIMAģ�鱣��USIM����Ϣ���ݽṹ
*****************************************************************************/
typedef struct
{
    USIMM_PHYCARD_TYPE_ENUM_UINT32      enPhyType;
}CSIMA_CARDINFO_STRU;


/*****************************************************************************
  4 ��������
*****************************************************************************/

/*****************************************************************************
  5 ȫ�ֱ�������
*****************************************************************************/


/*****************************************************************************
  6 OTHERS����
*****************************************************************************/
#if ((VOS_OS_VER == VOS_WIN32) || (VOS_OS_VER == VOS_NUCLEUS))
#pragma pack()
#else
#pragma pack(0)
#endif

#ifdef __cplusplus
    #if __cplusplus
        }
    #endif
#endif

#endif /* end of csimagent.h*/
