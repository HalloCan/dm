# dm
A fast and user-friendly script for initiating and halting Docker containers for linux.

---

**WARNING**

*This script requires root privileges. Before you run it, make sure you've checked the followings:*
 
  + Username is "root"(for privilege validation only).
  + Docker and whereis is installed and Docker can be recognized by *whereis*.

**Instructions**
This script will present a menu like this:
> 1:stop all containers
> 
> 2:show all existed containers
> 
> 3:show all running containers
> 
> 4:start container
> 
> 5:stop who?
> 
> 6:exit

When you choosing "4:start container", script will show all existing container, you can choose by typing the number before your container's name.

Same goes for you choosing "5:stop who?".

Script will not stop until you give a wrong parametric or you choose "6:exit"

This script can be used to quickly turn on a feature by attaching a parameter to it at startup:

>-sa: like you choose "1:stop all containers".
>
>-r <container_name>: will start the contailer <container_name>.
>
>-s: Stop the given contailer.
>
>-h: show the help message
>
Like: typing "dm -sa", dm will stop all contailers and not show the menu.

## ***GIVING ROOT PRIVILEGE TO A PROGRAM OR SCRIPT IS A VERY DANGEROUS OPERATE, MAKE SURE SCRIPT HAS NOT BEEN MALICIOUSLY MODIFIED!***

---

# dm
一个快速、用户友好用于启动和停止 Linux 下 Docker 容器的脚本。

~不是那个dm,这里没有第五人格~

---

**用前提醒**

*这个脚本需要Root权限，请确保以下事项满足后使用:*
 
  + 用户名是"root"(仅供权限识别).
  + Docker和whereis被正确安装，且Docker可以被*whereis*识别.

**指南**
脚本菜单如下:
> 1:stop all containers(停止所有容器)
> 
> 2:show all existed containers(列出所有存在的容器)
> 
> 3:show all running containers(列出所有运行中的容器)
> 
> 4:start container(启动一个容器)
> 
> 5:stop who?(停止一个正在运行的容器)
> 
> 6:exit(退出脚本)

选择在"4:start container",脚本将查询所有存在的容器,用户可以通过容器名前面的数字选定容器.

选择"5:stop who?"的菜单同上.

脚本不会停止，直到你给出一个错误的参数或者你选择了"6:exit"。

该脚本可用于在启动时附加一个参数，从而快速开启一项功能:

>-sa: 停止所有正在运行的 Docker 容器。
>
>-r <container_name>: 启动指定名称的 Docker 容器。
>
>-s: 停止一个指定的 Docker 容器。
>
>-h: 显示帮助信息。
>
比如: 输入"dm -sa", dm会直接停止所有容器而不显示菜单.

## ***为程序或脚本赋予 root 权限是非常危险的操作，请确保脚本未被恶意修改！***
