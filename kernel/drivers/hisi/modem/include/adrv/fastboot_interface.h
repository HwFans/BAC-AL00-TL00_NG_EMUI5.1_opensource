/*************************************************************************
*   版权所有(C) 1987-2015, 深圳海思半导体技术有限公司.
*
*   文 件 名 :  fastboot_interface.h
*
*   描    述 :  本文件命名为"fastboot_interface.h", 给出fastboot侧底软直接对外提供API接口描述
*
*   修改记录 :  2015年4月01日  v1.00  创建
*************************************************************************/

#ifndef HISI_FASTBOOT_DRV_H
#define HISI_FASTBOOT_DRV_H

/*************************************************************************
*
*   宏定义
*
*************************************************************************/
#define PARTITION_MODEM_NVDLOAD_NAME        "modemnvm_update"
#define PARTITION_MODEM_NVDLOAD_CUST_NAME   "modemnvm_cust"
#define PARTITION_MODEM_NVDEFAULT_NAME      "modemnvm_factory"
#define PARTITION_MODEM_NVBACKUP_NAME       "modemnvm_backup"
#define PARTITION_MODEM_NVSYS_NAME          "modemnvm_system"
#define PARTITION_MODEM_NVIMG_NAME          "modemnvm_img"


typedef struct ptentry ptentry;
struct ptentry
{
    char name[32];
    unsigned start;
    unsigned length;
    unsigned flags;
};

/*****************************************************************************
* 函 数 名  : get_operators
*
* 功能描述  : 获取分区的回调函数
*
* 输入参数  : string 传入"partition"
*             
* 输出参数  : 无
*
* 返 回 值  : 无
*
* 其它说明  : fastboot
*
*****************************************************************************/
void * get_operators(char * string);


/*****************************************************************************
* 函 数 名  : get_boardid
*
* 功能描述  : 获取单板id号
*
* 输入参数  : 无
*             
* 输出参数  : 无
*
* 返 回 值  : 单板id号,具体查看该平台对应的产品单板id规划
*
* 其它说明  : fastboot
*
*****************************************************************************/
unsigned int get_boardid(void);

/*****************************************************************************
* 函 数 名  : get_productid
*
* 功能描述  : 获取产品id 号
*
* 输入参数  : 无
*             
* 输出参数  : 无
*
* 返 回 值  : 产品id 号
*
* 其它说明  : fastboot
*
*****************************************************************************/
unsigned int get_productid(void);

/*****************************************************************************
* 函 数 名  : hisi_adc_get_value
*
* 功能描述  : 获取hkadc的检测值
*
* 输入参数  : channel hkadc物理通道号
*             
* 输出参数  : 无
*
* 返 回 值  : 转换的电压值 uv
			  负值表示错误
*
* 其它说明  : fastboot
*
*****************************************************************************/
int hisi_adc_get_value(unsigned int channel);


/*****************************************************************************
* 函 数 名  : find_ptn
*
* 功能描述  : FASTBOOT中根据分区名返回分区信息
*
* 输入参数  : str 分区名
*             
* 输出参数  : 无
*
* 返 回 值  : 分区信息数据结构
			  NULL表示错误
*
* 其它说明  : fastboot
*
*****************************************************************************/
struct ptentry* find_ptn(const char* str);

/*****************************************************************************
* 函 数 名  : hisi_secboot_preload_verification 
*
* 功能描述  : 镜像安全校验
*
* 输入参数  : imageAddress 镜像地址
			  imageNamePtr 镜像名称
			  magicNumber  魔数 默认0
*             
* 输出参数  : 无
*
* 返 回 值  : 0  处理成功
			  <0 处理失败
*
* 其它说明  : fastboot
*
*****************************************************************************/
int hisi_secboot_preload_verification (unsigned imageAddress, const char *imageNamePtr, unsigned magicNumber);

/*****************************************************************************
* 函 数 名  : hisi_secboot_hold_system 
*
* 功能描述  : 系统出现严重错误时候，挂住系统
*
* 输入参数  : 无
*             
* 输出参数  : 无
*
* 返 回 值  : 无
*
* 其它说明  : fastboot
*
*****************************************************************************/
void hisi_secboot_hold_system(void);
	
/*****************************************************************************
* 函 数 名  : storage_read
*
* 功能描述  : FASTBOOT中读取对应分区中指定位置的数据
*
* 输入参数  : ptn_name 需要操作的分区名
			  offset  相对分区起始地址的偏移
			  data 读数据存放的目的buffer
			  bytes  需要读取的字节数
*             
* 输出参数  : 无
*
* 返 回 值  : 0  读取成功
			  -1 读取失败
*
* 其它说明  : fastboot
*
*****************************************************************************/
int storage_read(const char *ptn_name, unsigned long long offset, void *data, unsigned long long bytes);

/*****************************************************************************
* 函 数 名  : Is_load_modem 
*
* 功能描述  : 是否加载modem
*
* 输入参数  : NULL
*             
* 输出参数  : NULL
*
* 返 回 值  : 0  失败
			    1 需要加载modem和dsp
*
* 其它说明  : fastboot
*
*****************************************************************************/
unsigned int bsp_need_loadmodem (void);

/*****************************************************************************
* 函 数 名  : bsp_socpmem_enable
*
* 功能描述  : 是否静态预留modem socp的内存
*
* 输入参数  : NULL
*
* 输出参数  : NULL
*
* 返 回 值  : 0 不静态预留modem socp的内存
              1 静态预留modem socp的内存
*
* 其它说明  : fastboot
*
*****************************************************************************/
unsigned int bsp_socpmem_enable(void);

#endif /* HISI_AP_DRV_H */

