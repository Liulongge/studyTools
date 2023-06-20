#!/usr/bin/env python3
import subprocess
import tkinter as tk
import os
from tkinter import END

# 创建一个Tkinter窗口
root = tk.Tk()
root.title("ADB Shell List")

# 创建一个列表框，用于显示adb shell命令的输出
listbox = tk.Listbox(root, height=30, width=100)
listbox.pack()

# 执行adb shell命令，并将其输出插入到列表框中
# result = subprocess.run(["adb", "shell", "ls"], stdout=subprocess.PIPE)
# files = result.stdout.decode().split("\n")
# for file in files:
#     listbox.insert(tk.END, file)

def list_files(path="."):
    # 清空列表框
    global listbox
    listbox.delete(0, tk.END)
    result = subprocess.run(["adb", "shell", "ls"], stdout=subprocess.PIPE)
    files = result.stdout.decode().split("\n")
    for file in files:
        listbox.insert(tk.END, file)

list_files()
full_patch=''
# 创建一个函数，用于处理列表框的选择事件
def pull_file(event):
    # 获取用户选择的文件名
    global full_patch
    selection = listbox.get(listbox.curselection())
    # command = ['adb pull' + full_patch + selection]
    print("=========")
    result = subprocess.run(['adb', 'pull', full_patch + '/' + selection],  stdout=subprocess.PIPE)
    print("+++++++++++", result)

def change_dir(event):
    global full_patch
    selection = listbox.get(listbox.curselection())
    full_patch = full_patch + '/' + selection
    print(full_patch)
    listbox.delete(0, END)
    command = ['ls -a']
    result = subprocess.run(['adb', 'shell', 'cd', full_patch, '&&'] + command,  stdout=subprocess.PIPE)
    print(result.stdout)
    files = result.stdout.decode().split("\n")
    for file in files:
        listbox.insert(tk.END, file)

# 绑定列表框的选择事件到pull_file函数
listbox.bind("<Double-Button-1>", change_dir)
listbox.bind("<Double-Button-2>", pull_file)

# 启动Tkinter的事件循环
root.mainloop()