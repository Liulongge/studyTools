# #!/bin/bash

# 参考
# https://yaocc.cc/menushell/

# # 函数：显示选择列表并返回用户选择的选项
# # 参数：
# #   $1 - 选项数组
# # 返回值：
# #   用户选择的选项
# # 定义选择函数
# select_option() {
#   choices=("$@")  # 将选项数组声明为全局变量
#   selected=0      # 初始化选择索引

#   while true; do
#     clear
#     for index in "${!choices[@]}"; do
#       if [ $index -eq $selected ]; then
#         printf "\033[31m> ${choices[$index]}\033[0m\n"  # 高亮显示选中的选项
#       else
#         echo "  ${choices[$index]}"
#       fi
#     done

#     read -n1 -s key  # 读取单个按键并保持输入的隐私

#     case "$key" in
#       A)  # 上箭头
#         if [ $selected -gt 0 ]; then
#           selected=$((selected - 1))
#         fi
#         ;;
#       B)  # 下箭头
#         if [ $selected -lt $(( ${#choices[@]} - 1 )) ]; then
#           selected=$((selected + 1))
#         fi
#         ;;
#       "")  # 回车键
#         break
#         ;;
#     esac
#   done

#   # 打印最终结果日志
#   selected_option="${choices[$selected]}"
#   echo "最终选择：$selected_option"
# }

# # 定义选项数组
# options=("Option 1" "Option 2" "Option 3" "Option 4")

# # 调用选择函数，并将选项数组作为参数传入
# select_option "${options[@]}"

# # 显示用户选择的选项
# echo "你选择了：$selected_option"


#!/bin/bash

# source ./menu.sh

# menu_items=("跳板机" "腾讯云" "跳板机2" "跳板机win" "翻墙机" "公网机")

# cmds[0]='ssh **@a.b.com'
# cmds[1]='ssh root@host1'
# cmds[2]='sshpass -p ****** ssh **@jms.hwwt2.com -p 2223'
# cmds[3]='rdesktop -u ******** -p ****** ip:3390 -r sound:off -g 1920x1080'
# cmds[4]='ssh root@host2'
# cmds[5]='ssh root@255.255.255.251'

# after_hook() {
#     echo
#     echo '   '${cmds[$item_index]}
# }

# case $1 in
#     '')
#         menu
#         echo 连接${menu_items[$item_index]}
#         exec ${cmds[$item_index]}
#         ;;
#     *) ssh $*;;
# esac

source ./menu.sh
menu_tabs=('横坐标1' '横坐标2' '横坐标3')
menu_items=('纵坐标1' '纵坐标2' '纵坐标3')
pre_hook() {
    echo '请选择tab or item:'
}
after_hook() {
    echo '当前选中项为:' ${menu_tabs[$tab_index]} ${menu_items[$item_index]}
}

# 调用 func: menu 开始菜单 [上下左右移动] [回车选中] [q或esc或ctrl c结束]
menu
echo 结束了
echo 最终选中的项为: ${menu_tabs[$tab_index]} ${menu_items[$item_index]}