
http://wiki.sylixos.com/index.php/%E7%B3%BB%E7%BB%9F%E7%AE%80%E4%BB%8B


SylixOS是一款嵌入式硬实时操作系统，同其类似的操作系统，全球比较知名的还有
  VxWorks(主要应用于航空航天、军事与工业自动化领域)、
  RTEMS(起源于美国国防部导弹与火箭控制实时系统)、
  ThreadX(主要应用于航空航天与数码通讯)等。 
从全球范围上看，SylixOS作为实时操作系统

的后来者，在设计思路上借鉴了众多实时操作系统的设计思想，其中就包括RTEMS、VxWorks、ThreadX等，使得具体性能参数上达到或超过了众多

实时操作系统的水平，成为国内实时操作系统的最优秀代表之一。

SylixOS技术讨论群(32537017) SylixOS开发者联盟群(216907470)
主要特点有：
兼容IEEE 1003（ISO/IEC 9945）操作系统接口规范
兼容POSIX 1003.1b（ISO/IEC 9945-1）实时编程的标准
优秀的实时性能（任务调度与切换、中断响应算法都是O(1)时间复杂度算法）
支持无限多任务
支持进程、线程、协程三种多任务模型
支持优先级继承，防止优先级翻转
极其稳定的内核，内核CPU占用率低
支持紧耦合同构多处理器（SMP）
支持标准I/O、多路I/O复用与异步I/O接口
支持多种新型异步事件同步化接口，例如：signalfd、timerfd、hstimerfd、eventfd等
支持众多标准文件系统：FAT、YAFFS、ROOTFS、PROCFS、NFS、ROMFS等
支持文件记录锁，可为各种类型实时数据库提供支持（SQL、NoSQL、In-Mem DB）
支持动态应用程序装载、动态链接库以及内核模块
支持标准TCP/IPv4/v6双网络协议栈
支持AF_UNIX、AF_PACKET、AF_INET、AF_INET6协议域
集成众多网络工具，例如：FTP、TFTP、NAT、PING、TELNET、NFS等
支持众多标准设备抽象，如：TTY、BLOCK、DMA、ATA、GRAPH、RTC、PIPE等
支持多种工业设备或总线模型，如：CAN、I2C、SPI、USB、PCI、SDIO等
提供内核行为跟踪器方便调试
可支持众多图形界面系统，例如：Qt、ftk、ucGUI等


