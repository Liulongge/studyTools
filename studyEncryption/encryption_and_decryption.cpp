#include <stdio.h>
#include <string.h>
#include "stdint.h"

int main()
{
    uint8_t key[] = {"?16qwscdf0!~tga!"};
    uint8_t unencrypted[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20 } ;
    int result=1;
    int i;
    int count=0;
    char Text[128]={'\0'};
    char cryptograph[128]={'\0'};
    while(1)
    {
        if(result==1)
        {
            printf("请输入要加密的明文：\n");
            scanf ("%s",&Text);
            count=strlen(Text);
            for(i=0;i<count;i++)
            {
                cryptograph[i]=Text[i]+i+5;
            }
            cryptograph[i]='\0';
            printf("加密后的密文是：%s\n",cryptograph);
        }
        else if(result==2)
        {
            count=strlen(Text);
            for(i=0;i<count;i++)
            {
                Text[i]=cryptograph[i]-i-5;
            }
            Text[i]='\0';
            printf("解密后的明文是：%s\n",Text);
        }
        else if(result==3)
        {
            break;
        }
        else
        {
            printf("请输入正确的命令符：\n");
        }
        printf("输入1加密新的明文，输入2对刚加密的密文进行解密，输入3退出系统：\n");
        printf("请输入命令符：\n");
        scanf("%d",&result);
    }
    return 0;
}