---
title: 安装Ubuntu gnome 17.04后的一些配置
categories:
  - 教程
  - Ubuntu
  - 配置
mathjax: true
abbrlink: 2265297077
date: 2017-08-30 13:56:51
---
## 前言
**本次教程我们需要了解以下几点**
* Gnome和普通的Ubuntu到底有什么区别？
* Ubuntu 17.04有一些什么功能进行了加强？
* 我们如何安装搜狗输入法,Chrome等一些基本软件？
* 我们如何用wine安装QQ,网易云音乐等一些Windows下的好东西？
* 我们如何用Ubuntu配置好Vim,markdown等编程软件？
* $\dots\dots$

<!--more-->

**本次教程非Ubuntu gnome的阅读者也可以观看，而且语法我也尽量遵照非Gnome的语法**

## Gnome和普通的Ubuntu到底有什么区别？
* Gnome是一个更加好看的，进行了优化的Ubuntu，而且从17年4月开始，Ubuntu官网就开始成重新进行长期支持Ubuntu Gnome，~~虽然Ubuntu Gnome 17.04只维护一年~~.
* Gnome有什么好处？就一个字，好看！！！
* 我之前是弃Gnome的，但后来发现Ubuntu Gnome 17.04这么好看，就又跳进来了。。。
* 如果你现在不知道如何安装Ubuntu Gnome 17.04，你可以去网上搜一下，很快你就会知道如何安装了

## Ubuntu 17.04有一些什么功能进行了加强？

* **交换文件（SWAP）**
* Ubuntu 17.04的新安装将不再需要交换分区。对具有更多内存的现代系统来说，这是没有意义的。
所以，相反，Ubuntu 17.04 Zesty Zapus默认使用交换文件。交换文件的大小与交换分区不同，通常使用不超过5％的可用磁盘空间（或2048MB的RAM），这是另一个潜在的好处。
* **Linux内核4.10**
* Ubuntu 17.04包括Linux内核4.10，这对于任何想要在AMD Ryzen或Intel Kaby Lake系统上运行版本的人来说都是个好消息。 游戏玩家也喜欢使用MESA 17.0.2，默认情况下也使用X.Org Server 1.19.2。
* **默认应用**
* Ubuntu的核心应用程序已经大幅更新。
* 有最新的LibreOffice 5.3（也就是可以启用“功能区”界面）; 默认的日历应用程序可以拾取方便的周视图; Firefox和Thunderbird也在推送他们最新的稳定版本。
* 随着Zesty中的大部分使用GNOME 3.24，您还可以获得许多其他应用程序和工具的新版本，除了库存终端模拟器（版本v3.20），Nautilus文件管理器（v3.20）和Ubuntu软件（ 在v3.22，但具有一些附加功能，如Snap URL支持）。
* Firefox 52
* Thunderbird 45
* LibreOffice 5.3
* Nautilus 3.20.4
* Rhythmbox 3.4.1
* **默认新壁纸**
![](安装Ubuntu-gnome-17-04后的一些配置/1.jpg)
* **其他杂项更新**
* 默认DNS解析器现在被系统解析，默认情况下不再安装gconf已被gsettings替换。

说了这么多，看起来好像没什么用~~我也这么觉得~~，但是我这种超级喜爱Ubuntu的人，有更新还是要更新的。。。而且好像这个系统不怎么稳定，我经常电脑突然卡死~~刚刚码字的时候就又卡了~~，所以大家也可以选择使用Ubuntu 16.04，而且Ubuntu 17.04只维护9个月。。。刚刚装好的电脑说不定又要重装系统了。。。

## 我们如何安装搜狗输入法,Chrome等一些基本软件？
 * **刚刚开机的我**
 * 好像我们的电脑里面有一大堆没有更新的软件（这可是4月的），那我还是要更新的吧？先打开终端（Ctrl+Alt+t)，然后用下面的命令
{% codeblock %}
 sudo apt-get update
 sudo apt-get upgrade
{% endcodeblock %}
 * 遇到要输入密码的好好输（Ubuntu输密码你看不到，是不会显示密码位数的）.
 * 这个更新需要一点时间，你可以去喝一杯咖啡了.
 *  **更新完后的我**
 *  仔细观察一下你的Ubuntu，是不是觉得超级丑陋？我也这么~~觉得~~，所以我们需要搞事情.
 *  打开终端，找到编辑选项，里面有一个配置文件首选项，打开，如果你没有找到，看图：
![](安装Ubuntu-gnome-17-04后的一些配置/1.png)
 *  不要在意里面的细节
 *  然后打开，你会发现这些:
 ![](安装Ubuntu-gnome-17-04后的一些配置/2.png)
 * 这个时候，你爱怎么搞事情怎么搞，可以调整一大堆乱七八糟的东西来修改你的终端配色，一般来说，我的配置是
 * 终端初始尺寸：511*511
 * 勾选Custom font，然后挑选Ubuntu Mono Bold这款字体（我喜欢)
 * 选择颜色，然后将使用系统主题中的颜色勾选去掉，然后在内置方案中挑选浅色的Solarized.
 * 调完之后关闭，然后你就会发现你美丽的终端出现了！！！
 * **我想打字，怎么办啊**
 * 这个时候我们需要来安装Sogou了
 * 打开终端，输入
{% codeblock %}
sudo add-apt-repository ppa:fcitx-team/nightly
sudo apt-get update
sudo apt-get install fcitx
sudo apt-get install fcitx-config-gtk
sudo apt-get install fcitx-table-all
sudo apt-get install im-switch
cd ~
wegt http://cdn2.ime.sogou.com/dl/index/1491565850/sogoupinyin_2.1.0.0086_amd64.deb?st=39YAi5wnciFA_K3gGDeUgQ&e=1503989588&fn=sogoupinyin_2.1.0.0086_amd64.deb
sudo dpkg -i sogoupinyin_2.1.0.0086_amd64.deb
sudo apt-get-f install
{% endcodeblock %}
 * 这些都是一行行的啊，每次拷贝好之后在终端Shift+Insert插入（Shift是左Shift，Insert是在Enter键的右上方)
 * 然后重启电脑
 * 这个时候你可以在电脑的左下方找到一个东东
 ![](安装Ubuntu-gnome-17-04后的一些配置/3.png)
 * 如果你还是没有找到，那么只能说明你的视力爆掉了。。。
 * 这个时候右键单击那个Windows有的那个东东（我也不知道叫什么），找到设置
 * ![](安装Ubuntu-gnome-17-04后的一些配置/4.png)
 * 因为我已经装好了搜狗，所以是这样的，你们操作差不多，不过界面可能不一样，然后就没有然后，自己设置吧，如果还是不会留言来解答
 * **Chrome I love you!**
 * 打开终端
 * 我们首先需要科学上网，命令如下：
{% codeblock %}
sudo add-apt-repository ppa:hzwhuang/ss-qt5
sudo apt-get update
sudo apt-get install shadowsocks-qt5
{% endcodeblock %}
 * 然后我们可以开始安装Chrome
{% codeblock %}
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get install google-chrome-stable
{% endcodeblock %}
 * 这是不是非常简单？
 * 然后Chrome就会出现了（如何打开？按Win键，然后搜索Chrome，或者你可以将Chrome固定的任务栏）
 * **我们是不是发现自己的Ubuntu安装软件特别慢？我们有必要换一个安装源，方法如下:**
 * 在系统软件菜单中找到**软件和更新**，打开，你会看见这些东西
![](安装Ubuntu-gnome-17-04后的一些配置/5.png)
 * 这个时候，你就点击下载自，然后选择中国服务器http://mirrors.cn99.com/ubuntu
![](安装Ubuntu-gnome-17-04后的一些配置/6.png)
 * 然后需要输入密码，关闭软件更新器，关闭时会出现
![](安装Ubuntu-gnome-17-04后的一些配置/7.png)
 * 这个不用理它，直接点击关闭即可，然后打开终端，输入
{% codeblock %}
sudo apt-get update
sudo apt-get upgrade
{% endcodeblock %}
 * 如果有时你的Ubuntu在更新源的时候，即在运行sudo apt-get update的时候，出现下面的情况：
![](安装Ubuntu-gnome-17-04后的一些配置/8.png)
 * 仔细观察就会发现，我的电脑wiznote-team出现了很多次，说明这个源是不可以使用的，此时我们就需要在其它软件中将wiznote的勾勾去掉，然后就会发现可以了！
 ![](安装Ubuntu-gnome-17-04后的一些配置/9.png)
  ![](安装Ubuntu-gnome-17-04后的一些配置/10.png)
 * 这一段就Over了，接下来我们继续。


 ## 我们如何用wine安装QQ,网易云音乐等一些Windows下的好东西？
 * **Wine QQ**
 * Wine QQ是我使用了无限的时间找到然后抄袭我同学抄袭我找到的网页然后搞出来的。
 * 打开终端，输入
{% codeblock %}
 sudo add-apt-repository ppa:wine/wine-builds;sudo apt-get update;sudo apt-get install winehq-devel
{% endcodeblock %}
 * [戳我](https://pan.baidu.com/s/1bpztCXh)，提取密码为b2cx，然后打开存放目录
{% codeblock %}
 tar xvf Wine_QQ.tar.xz -C ~/
{% endcodeblock %}
 * 然后你就可以在系统菜单中找到Wine QQ的选项了
 * 之后如果你需要安装Windows下的软件，只需要将exe下载下来，然后到下载目录，在终端输入
{% codeblock %}
 wine 当前软件名称
{% endcodeblock %}
 * 就可以了
 * **网易云音乐**
 * 网易云音乐安装比较简单，打开终端，输入
{% codeblock %}
wget http://s1.music.126.net/download/pc/netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
sudo dpkg -i netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
sudo apt-get -f install
sudo dpkg -i netease-cloud-music_1.0.0-2_amd64_ubuntu16.04.deb
{% endcodeblock %}
 * 中间可能会出现依赖包问题，你就缺什么补什么，例如少a软件，你就输入
{% codeblock %}
 sudo apt-get install a
{% endcodeblock %}
 * 就可以了
 * 这个时候网易云音乐也就安装完成，然后我们可以开始下一步.

## 我们如何用Ubuntu配置好Vim,markdown等编程软件？
* **Vim**
* Vim是一款好东西（不知道的我也没有办法了）
* 打开终端，输入
{% codeblock %}
sudo apt-get install vim
{% endcodeblock %}
* vim就安装好了，vim的配置文件在~/.vimrc，你可以在终端里这么做
{% codeblock %}
sudo vim ~/.vimrc
{% endcodeblock %}
* 这时你就可以更改Vim了.配置的话我之后再更吧，现在码字太累了。。。
* **Markdown**
* 我使用的Markdown是MOEDITOR，打开终端，输入
{% codeblock %}
wget https://github-production-release-asset-2e65be.s3.amazonaws.com/61847006/2ca322ac-6f0a-11e6-9275-f8b112336b43?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAIWNJYAX4CSVEH53A%2F20170829%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Date=20170829T072124Z&X-Amz-Expires=300&X-Amz-Signature=7e242e4594396804425316e4c11b28826dc97b559ebfa49308c3d9bd2c9de034&X-Amz-SignedHeaders=host&actor_id=0&response-content-disposition=attachment%3B%20filename%3Dmoeditor_0.2.0-1_amd64.deb&response-content-type=application%2Foctet-stream
sudo dpkg -i moeditor_0.2.0-1_amd64.deb
{% endcodeblock %}
* 就可以使用了，大家可以观赏一下模样
![](安装Ubuntu-gnome-17-04后的一些配置/11.png)
* 是不是很好看啊？

## 结束
今天的教程就写到这里，欢迎大家提出意见！！！

 
 
